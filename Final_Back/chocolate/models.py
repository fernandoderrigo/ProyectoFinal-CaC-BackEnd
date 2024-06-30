# models.py
import mysql.connector
import base64
from config import Config

def get_db_connection():
    connection = mysql.connector.connect(
        host=Config.MYSQL_HOST,
        user=Config.MYSQL_USER,
        password=Config.MYSQL_PASSWORD,
        database=Config.MYSQL_DB
    )
    return connection

def get_productos():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT prod.*, img.imagen FROM productos prod LEFT JOIN imagenes img on prod.idProducto = img.idProducto")
    result = cursor.fetchall()

    for row in result:
        if row['imagen']:
            row['imagen'] = base64.b64encode(row['imagen']).decode('utf-8')
    

    cursor.close()
    connection.close()
    return result

def get_producto_by_id(item_id):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM productos prod LEFT JOIN imagenes img on prod.idProducto = img.idProducto WHERE idProducto = %s", (item_id,))
    result = cursor.fetchone()

    for row in result:
        if row['imagen']:
            row['imagen'] = base64.b64encode(row['imagen']).decode('utf-8')

    cursor.close()
    connection.close()
    return result

def add_producto(descripcion):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("INSERT INTO productos (descripcion) VALUES (%s)", (descripcion))
    connection.commit()
    cursor.close()
    connection.close()

def delete_producto(item_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("DELETE FROM productos WHERE id = %s", (item_id,))
    connection.commit()
    cursor.close()
    connection.close()
