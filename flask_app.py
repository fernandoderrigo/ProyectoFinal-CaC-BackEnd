from flask import Flask, request, jsonify, render_template, redirect, url_for, session
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = "your_secret_key"

# Configuración de la base de datos
db_config = {
    "user": "root",
    "password": "TigritoTeGrita",
    "host": "127.0.0.1",
    "database": "chocoarte",
}


# Función para conectar a la base de datos
def connect_db():
    return mysql.connector.connect(**db_config)


# Función para obtener los datos del usuario por correo
def get_user(mail):
    conn = connect_db()
    try:
        cursor = conn.cursor(dictionary=True)
    except Exception:
        conn.connect()
        cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM usuario WHERE mail = %s;"
    cursor.execute(query, (mail,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()
    return user


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        mail = request.json.get("mail")
        password = request.json.get("password")

        user = get_user(mail)

        if not user or not check_password_hash(user["password_hash"], password):
            return (
                jsonify(
                    {
                        "success": False,
                        "message": "Correo electrónico o contraseña incorrectos",
                    }
                ),
                401,
            )

        # Guardar el usuario en la sesión
        session["user"] = {
            "id_usuario": user["id_usuario"],
            "nombre": user["nombre"],
            "apellido": user["apellido"],
            "mail": user["mail"],
        }

        return jsonify({"success": True, "message": "Login exitoso"}), 200

    return render_template("login.html")


@app.route("/register/", methods=["POST", "GET"])
def register():
    if request.method == "POST":
        try:
            nombre = request.form.get("nombre")
            apellido = request.form.get("apellido")
            mail = request.form.get("mail")
            password = request.form.get("password")

            conn = connect_db()
            if conn:
                cursor = conn.cursor()

                hashed_password = generate_password_hash(password)

                insert_query = "INSERT INTO usuario (nombre, apellido, mail, password_hash) VALUES (%s, %s, %s, %s);"
                cursor.execute(insert_query, (nombre, apellido, mail, hashed_password))
                conn.commit()

                cursor.close()
                conn.close()

                # Obtener el usuario recién registrado para añadirlo a la sesión
                user = get_user(mail)
                session["user"] = {
                    "id_usuario": user["id_usuario"],
                    "nombre": user["nombre"],
                    "apellido": user["apellido"],
                    "mail": user["mail"],
                }

                # Redirigir al usuario a la página de usuario después del registro exitoso
                return redirect(url_for("usuario"))

            else:
                return (
                    jsonify(
                        success=False, message="No se pudo conectar a la base de datos"
                    ),
                    500,
                )

        except Exception as e:
            return (
                jsonify(success=False, message="Se produjo un error", error=str(e)),
                500,
            )

    return render_template("register.html")


@app.route("/usuario", methods=["GET", "POST", "PUT"])
def usuario():
    if "user" in session:
        user = session["user"]

        if request.method == "PUT":
            try:
                data = request.json
                nombre = data.get("nombre")
                apellido = data.get("apellido")
                mail = data.get("mail")
                password = data.get("password")

                conn = connect_db()
                cursor = conn.cursor()

                if password:
                    hashed_password = generate_password_hash(password)
                    update_query = "UPDATE usuario SET nombre=%s, apellido=%s, mail=%s, password_hash=%s WHERE id_usuario=%s;"
                    cursor.execute(
                        update_query,
                        (nombre, apellido, mail, hashed_password, user["id_usuario"]),
                    )
                else:
                    update_query = "UPDATE usuario SET nombre=%s, apellido=%s, mail=%s WHERE id_usuario=%s;"
                    cursor.execute(
                        update_query, (nombre, apellido, mail, user["id_usuario"])
                    )

                conn.commit()
                cursor.close()
                conn.close()

                user["nombre"] = nombre
                user["apellido"] = apellido
                user["mail"] = mail
                session["user"] = user

                return (
                    jsonify(success=True, message="Perfil actualizado exitosamente"),
                    200,
                )

            except Exception as e:
                return (
                    jsonify(
                        success=False,
                        message="Error al actualizar el perfil",
                        error=str(e),
                    ),
                    500,
                )

        return render_template("usuario.html", user=user)
    else:
        return redirect(url_for("login"))


@app.route("/edit_user/", methods=["PUT"])
def edit_user():
    user_id = session["user"]["id_usuario"]
    try:
        data = request.json
        nombre = data["nombre"]
        apellido = data["apellido"]
        mail = data["mail"]
        password = data.get(
            "password"
        )  # Obtenemos la contraseña solo si existe en los datos

        conn = connect_db()
        cursor = conn.cursor()

        if password:
            hashed_password = generate_password_hash(password)
            update_query = "UPDATE usuario SET nombre=%s, apellido=%s, mail=%s, password_hash=%s WHERE id_usuario=%s;"
            cursor.execute(
                update_query, (nombre, apellido, mail, hashed_password, user_id)
            )
        else:
            update_query = "UPDATE usuario SET nombre=%s, apellido=%s, mail=%s WHERE id_usuario=%s;"
            cursor.execute(update_query, (nombre, apellido, mail, user_id))

        conn.commit()
        cursor.close()
        conn.close()

        # Actualiza los datos en la sesión
        session["user"]["nombre"] = nombre
        session["user"]["apellido"] = apellido
        session["user"]["mail"] = mail

        return jsonify(
            success=True,
            message="Datos actualizados correctamente",
            nombre=nombre,
            apellido=apellido,
            mail=mail,
        )

    except Exception as e:
        return jsonify(success=False, message="Se produjo un error", error=str(e)), 500


@app.route("/delete_account/", methods=["DELETE"])
def delete_account():
    if "user" in session:
        user_id = session["user"]["id_usuario"]
        password = request.json.get("password")

        user = get_user(session["user"]["mail"])

        # Verificar la contraseña del usuario
        if not check_password_hash(user["password_hash"], password):
            return jsonify(success=False, message="Contraseña incorrecta"), 401

        try:
            conn = connect_db()
            cursor = conn.cursor()

            # Eliminar al usuario de la base de datos
            delete_query = "DELETE FROM usuario WHERE id_usuario = %s;"
            cursor.execute(delete_query, (user_id,))
            conn.commit()

            cursor.close()
            conn.close()

            # Eliminar al usuario de la sesión
            session.pop("user", None)

            return (
                jsonify(
                    success=True,
                    message="Cuenta eliminada exitosamente",
                    redirect_url=url_for("index"),
                ),
                200,
            )

        except Exception as e:
            return (
                jsonify(
                    success=False, message="Error al eliminar la cuenta", error=str(e)
                ),
                500,
            )

    return jsonify(success=False, message="Usuario no autenticado"), 401


@app.route("/logout")
def logout():
    # Eliminar el usuario de la sesión
    session.pop("user", None)
    return redirect(url_for("index"))


@app.route("/productos")
def productos():
    return render_template("productos.html")


@app.route("/sobre_nosotros")
def sobre_nosotros():
    return render_template("sobre_nosotros.html")


@app.route("/contacto")
def contacto():
    return render_template("contacto.html")


if __name__ == "__main__":
    app.run(debug=True)
