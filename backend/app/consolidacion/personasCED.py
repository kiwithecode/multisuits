from app.models.CCG_Persona import CCG_Persona, CCG_PersonaSchema
from app.models.CCG_Persona_Contacto import CCG_Persona_Contacto, CCG_Persona_ContactoSchema
from app.models.CCG_Contacto import CCG_Contacto,CCG_ContactoSchema
from app.models.CCG_Ministerio import CCG_Ministerio, CCG_MinisterioSchema
from app.models.CCG_Grupo import CCG_Grupo, CCG_GrupoSchema
from app.models.CCG_Persona_Grupo import CCG_Persona_Grupo, CCG_Persona_GrupoSchema
from app.models.CCG_Persona_Relacion import CCG_Persona_Relacion,CCG_Persona_RelacionSchema
from app.models.CCG_Relacion import CCG_Relacion,CCG_RelacionSchema


from flask import jsonify, request
from flask_cors import cross_origin
from app.consolidacion import bp
from app.extensions import db
from sqlalchemy import text
import base64
from flask_jwt_extended import jwt_required
from datetime import date
from sqlalchemy import or_

@bp.route('/getPersonaByCED/<string:cedula>', methods=['GET'])
@cross_origin()
def get_persona_by_CED(cedula):
    persona = CCG_Persona.query.filter_by(Identificacion=cedula).first()
    if persona is None:
        # return 'Persona no encontrada', 400
        return jsonify({'message': 'Persona no encontrada'})

    persona_schema = CCG_PersonaSchema()
    persona_contacto_schema = CCG_Persona_ContactoSchema()
    contacto_schema = CCG_ContactoSchema()
    persona_relacion_schema = CCG_Persona_RelacionSchema()

    persona_data = persona_schema.dump(persona)
    #contactos = CCG_Persona_Contacto.query.filter_by(idPersona=persona.id).all()
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
        
    '''for contacto in contactos:
        contacto_data = persona_contacto_schema.dump(contacto)
        contacto_data['contacto_tipo'] = CCG_Contacto.query.get(contacto.idContacto).Tipo
        contactos_data.append(contacto_data)'''
      
    
    for familiar in familiares:
        familiar_data = persona_relacion_schema.dump(familiar)
        tipo=CCG_Relacion.query.get(familiar.idRelacion).Descripcion
        if familiar.idPersona1 == persona.id:
            nombre = CCG_Persona.query.get(familiar.idPersona2).Nombres
            apellido = CCG_Persona.query.get(familiar.idPersona2).Apellidos
            id = CCG_Persona.query.get(familiar.idPersona2).id
        else:
            nombre = CCG_Persona.query.get(familiar.idPersona1).Nombres
            apellido = CCG_Persona.query.get(familiar.idPersona1).Apellidos
            id = CCG_Persona.query.get(familiar.idPersona1).id

        dicc = {
            'tipo relacion': tipo, 'Nombres': nombre,'Apellidos': apellido, 'id Persona': id
        }

        '''
        familiar_data['tipo relacion']=  tipo
        familiar_data['nombres']= nombre
        familiar_data['apellidos']= apellido
        '''
        familiares_data.append(dicc) 

    
    
    #persona_data['contactos'] = contactos_data
    persona_data['familiares'] = familiares_data

    return jsonify(persona_data)

