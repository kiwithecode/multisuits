from app.models.CCG_Persona_Relacion import CCG_Persona_Relacion, CCG_Persona_RelacionSchema
from app.models.CCG_Relacion import CCG_Relacion, CCG_RelacionSchema
from app.models.CCG_Persona import CCG_Persona, CCG_PersonaSchema

from flask import jsonify, request
from flask_cors import cross_origin
from app.consolidacion import bp
from app.extensions import db
from sqlalchemy import text
import base64
from flask_jwt_extended import jwt_required, get_jwt_identity
from datetime import date, datetime
from sqlalchemy import or_

@bp.route('/getRelaciones', methods=['GET'])
@cross_origin()
@jwt_required()
def getRelaciones():
    relaciones = CCG_Relacion.query.all()
    if relaciones:
        results = CCG_RelacionSchema(many=True)
        output = results.dump(relaciones)
        return jsonify(output), 200
    else:
        return jsonify({"message": "No se encontraron registros"})
    

@bp.route('/addRelacion', methods=['POST'])
@cross_origin()
@jwt_required()
def addRelacion():
    data = request.get_json()
    idPersona1=data.get('idPersona1')
    idPersona2=data.get('idPersona2')
    idRelacion=data.get('idRelacion')
    Estado='A'

    if idPersona1 is None:
        return jsonify({"message": "Debe indicar la persona 1"}), 400
    if idPersona2 is None:
        return jsonify({"message": "Debe indicar la persona 2"}), 400
    if idRelacion is None:
        return jsonify({"message": "Debe indicar la relación"}), 400
    
    #validar que no exista la relación
    relacion = CCG_Persona_Relacion.query.filter_by(idPersona1=idPersona1,idPersona2=idPersona2,idRelacion=idRelacion).first()
    if relacion:
        return jsonify({"message": "La relación ya existe"}), 400
    
    #validar que no exista la relación inversa
    relacion = CCG_Persona_Relacion.query.filter_by(idPersona1=idPersona2,idPersona2=idPersona1,idRelacion=idRelacion).first()
    if relacion:
        return jsonify({"message": "La relación ya existe"}), 400
    
    #agregar la relación
    relacion = CCG_Persona_Relacion(idPersona1=idPersona1,idPersona2=idPersona2,idRelacion=idRelacion,Estado=Estado)
    db.session.add(relacion)
    db.session.commit()
    return jsonify({"message": "Relación agregada exitosamente"}), 200