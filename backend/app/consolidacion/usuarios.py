from app.models.CCG_Persona import CCG_Persona, CCG_PersonaSchema
from app.models.CCG_Persona_Contacto import CCG_Persona_Contacto, CCG_Persona_ContactoSchema
from app.models.CCG_Usuario import CCG_Usuario, CCG_UsuarioSchema

from flask import jsonify, request
from flask_cors import cross_origin
from app.consolidacion import bp
from app.extensions import db
from sqlalchemy import text
import base64
from flask_jwt_extended import jwt_required, get_jwt_identity
from datetime import date, datetime
from sqlalchemy import or_
'''
@bp.route('/getUsuarioByID/<int:persona_id>', methods=['GET'])
@cross_origin()
def get_persona_by_ID(persona_id):
    persona = CCG_Persona.query.filter_by(id=persona_id).first()

    if persona is None:
        return jsonify({'message': 'Persona no encontrada'}), 404

    persona_schema = CCG_PersonaSchema()
    persona_contacto_schema = CCG_Persona_ContactoSchema()
    contacto_schema = CCG_ContactoSchema()
    persona_relacion_schema = CCG_Persona_RelacionSchema()

    persona_data = persona_schema.dump(persona)
    contactos = CCG_Persona_Contacto.query.filter_by(idPersona=persona.id).all()
    familiares = CCG_Persona_Relacion.query.filter(or_(CCG_Persona_Relacion.idPersona1 == persona.id,CCG_Persona_Relacion.idPersona2 == persona.id)).all()
    familiares_data= []
    contactos_data = []
    print(familiares)
    grupo = CCG_Persona_Grupo.query.filter_by(idPersona=persona.id).first()
    persona_data['lider'] = 'Sin lider'
    persona_data['ministerio'] = 'Sin ministerio'
    if grupo:
        #look the grupo in Grupo table
        grupo_data = CCG_Grupo.query.get(grupo.idGrupo)
        #look the ministerio in Ministerio table
        ministerio_data = CCG_Ministerio.query.get(grupo_data.idMinisterio)
        #add the ministerio to the persona
        persona_data['ministerio'] = ministerio_data.nombre
        #search for the lider of the grupo in Persona table
        lider = CCG_Persona.query.get(grupo_data.lider)
        #add the lider to the persona
        persona_data['lider'] = lider.Nombres + ' ' + lider.Apellidos
        
        familiares_data.append(dicc) 

    
    
    #persona_data['contactos'] = contactos_data
    persona_data['familiares'] = familiares_data

    return jsonify(persona_data)
'''
# 
@bp.route('/usuarios', methods=['GET'])
@cross_origin()
#@jwt_required()
def get_usuarios():
    usuarios = CCG_Usuario.query.all()
    usuarios_schema = CCG_UsuarioSchema()
    info_result = []
    for usuario in usuarios:
        user_data = usuarios_schema.dump(usuario)
        nombre = CCG_Persona.query.get(usuario.idPersona).Nombres
        apellido = CCG_Persona.query.get(usuario.idPersona).Apellidos
        ide = CCG_Persona.query.get(usuario.idPersona).Identificacion
        user_data['Persona'] = nombre + ' ' + apellido
        user_data['Identificacion'] = ide

        info_result.append(user_data)

    return jsonify(info_result)

@bp.route('/getUsuarioById/<string:ident_persona>', methods=['GET'])
@cross_origin()
def get_usuario_By_Id(ident_persona):
    persona = CCG_Persona.query.filter_by(Identificacion=ident_persona).first()
    id = persona.id
    nombre = persona.Nombres
    apellido = persona.Apellidos
    userPersona = CCG_Usuario.query.filter_by(idPersona=id).first()

    if userPersona is None:
        return jsonify({'message': 'No hay usuario para esa persona'}), 404

    usuario_schema = CCG_UsuarioSchema()
    result = usuario_schema.dump(userPersona)
    result['Identificacion'] = ident_persona
    result['Persona nombres'] = nombre + ' ' +apellido
    
    return jsonify(result)
