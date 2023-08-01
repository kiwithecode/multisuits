from flask import jsonify, request
from flask_cors import cross_origin
from app.consolidacion import bp
from app.extensions import db
from sqlalchemy import text
import base64
from flask_jwt_extended import jwt_required
from datetime import date
from sqlalchemy import or_
from app.models.CCG_bitacora_consolidacion import CCG_bitacora_consolidacion, CCG_bitacora_consolidacionSchema
from app.models.CCG_Persona import CCG_Persona
from app.models.CCG_Usuario import CCG_Usuario, CCG_UsuarioSchema

@bp.route('/bitacoraPersona/<string:id>', methods=['GET'])
@cross_origin()
@jwt_required()
def bitacora(id):
    id_persona = id
    bitacora = CCG_bitacora_consolidacion.query.filter_by(idPersona=id_persona).all()
    if bitacora:
        results = CCG_bitacora_consolidacionSchema(many=True)
        output = results.dump(bitacora)

        return jsonify(output), 200
    else:
        return jsonify({"message": "No se encontraron registros"})


@bp.route('/bitacora', methods=['GET'])
@cross_origin()
@jwt_required()
def bitacora_all():
    bitacora = CCG_bitacora_consolidacion.query.all()
    if bitacora:
        for bit in bitacora:
            persona = CCG_Persona.query.filter_by(id=bit.idPersona).first()
            if persona:
                bit.nombre = persona.Nombres
                bit.apellido = persona.Apellidos

        output = []
        for bit in bitacora:
            usuario=CCG_Usuario.query.filter_by(id=bit.usuarioCrea).first()
            nombreUsuario=usuario.Codigo
            data = {
                'id': bit.id,
                'idPersona': bit.idPersona,
                'nombre': bit.nombre,
                'apellido': bit.apellido,
                'Contactar': bit.Contactar,
                'Motivo': bit.Motivo,
                'comentario': bit.comentario,
                'fechaCreacion': bit.fechaCreacion,
                'FechaModificacion': bit.FechaModificacion,
                'usuarioCrea': nombreUsuario,
                'UsuarioModifica': bit.UsuarioModifica
            }
            output.append(data)

        return jsonify(output), 200
    else:
        return jsonify({"message": "No se encontraron registros"})