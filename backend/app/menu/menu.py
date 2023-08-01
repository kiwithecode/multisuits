from flask import request, jsonify
from app.menu import bp
from app.extensions import db
from flask_cors import cross_origin
from flask_jwt_extended import jwt_required


from app.models.CCG_Aplicaciones import CCG_Aplicaciones, CCG_AplicacionesSchema

from app.models.CCG_Opcion import CCG_Opcion, CCG_OpcionSchema



@bp.route('/get_modulos', methods=['GET'])
@cross_origin()
@jwt_required()
def get_menu():
    try:
        # filter the modules that are active
        modulos = CCG_Aplicaciones.query.filter_by(estado='A').all()
        # serialize the data
        modulo_schema = CCG_AplicacionesSchema(many=True)
        output = modulo_schema.dump(modulos)
        return jsonify({"modulos": output}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@bp.route('/get_opciones', methods=['GET'])
@cross_origin()
@jwt_required()
def get_opciones():
    try:
        # filter the modules that are active
        opciones = CCG_Opcion.query.filter_by(Estado='A').all()
        # serialize the data
        opcion_schema = CCG_OpcionSchema(many=True)
        output = opcion_schema.dump(opciones)
        return jsonify({"opciones": output}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@bp.route('/get_opciones_modulo/<modulo>', methods=['GET'])
@cross_origin()
@jwt_required()
def get_opciones_modulo(modulo):
    try:
        # filter the modules that are active
        opciones = CCG_Opcion.query.filter_by(Modulo=modulo , Estado='A').all()
        # serialize the data
        opcion_schema = CCG_OpcionSchema(many=True)
        output = opcion_schema.dump(opciones)
        return jsonify({"opciones": output}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
