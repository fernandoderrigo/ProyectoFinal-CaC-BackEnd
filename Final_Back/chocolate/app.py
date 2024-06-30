# app.py
from flask import Flask, request, jsonify
from flask_cors import CORS
import models

app = Flask(__name__)
CORS(app)

@app.route('/productos', methods=['GET'])
def get_items():
    items = models.get_productos()
    return jsonify(items)

@app.route('/producto/<int:item_id>', methods=['GET'])
def get_item(item_id):
    item = models.get_producto_by_id(item_id)
    if item:
        return jsonify(item)
    else:
        return jsonify({'message': 'Producto no encontrado'}), 404

@app.route('/producto', methods=['POST'])
def create_item():
    data = request.get_json()
    descripcion = data.get('descripcion')
    models.add_producto(descripcion)
    return jsonify({'message': 'Item created'}), 201

@app.route('/producto/<int:item_id>', methods=['DELETE'])
def delete_producto(item_id):
    models.delete_producto(item_id)
    return jsonify({'message': 'Producto eliminado'})

if __name__ == '__main__':
    app.run(debug=True)
