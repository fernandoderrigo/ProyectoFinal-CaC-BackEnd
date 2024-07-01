from flask import Flask, request, jsonify, render_template, redirect, url_for, session
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Cambia esto por una clave segura en producción

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
    cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM usuario WHERE mail = %s"
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
            return jsonify({"success": False, "message": "Correo electrónico o contraseña incorrectos"}), 401

        # Guardar el usuario en la sesión
        session['user'] = user

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

                insert_query = "INSERT INTO usuario (nombre, apellido, mail, password_hash) VALUES (%s, %s, %s, %s)"
                cursor.execute(insert_query, (nombre, apellido, mail, hashed_password))
                conn.commit()

                cursor.close()
                conn.close()

                # Redirigir al usuario a la página de usuario después del registro exitoso
                return redirect(url_for('usuario'))

            else:
                return jsonify(success=False, message="No se pudo conectar a la base de datos"), 500

        except Exception as e:
            return jsonify(success=False, message="Se produjo un error", error=str(e)), 500

    return render_template("register.html")

@app.route("/usuario")
def usuario():
    # Obtener el usuario de la sesión
    if 'user' in session:
        user = session['user']
        return render_template("usuario.html", user=user)
    else:
        return redirect(url_for('login'))

@app.route("/logout")
def logout():
    # Eliminar el usuario de la sesión
    session.pop('user', None)
    return redirect(url_for('index'))

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