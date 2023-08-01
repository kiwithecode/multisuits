from app.models.CCG_Persona import CCG_Persona, CCG_PersonaSchema
from app.models.CCG_Ministerio import CCG_Ministerio, CCG_MinisterioSchema
from app.models.CCG_Grupo import CCG_Grupo, CCG_GrupoSchema
from app.models.CCG_Persona_Grupo import CCG_Persona_Grupo, CCG_Persona_GrupoSchema

from app.models.CCG_Opcion import CCG_Opcion, CCG_OpcionSchema
from app.models.CCG_Parametro import CCG_Parametro,CCG_ParametroSchema
from app.models.CCG_RolOpcionPar import CCG_RolOpcionPar, CCG_RolOpcionParSchema
from app.models.CCG_Usuario import CCG_Usuario, CCG_UsuarioSchema
from app.models.CCG_Rol import CCG_Rol, CCG_RolSchema


from flask import jsonify, request
from flask_cors import cross_origin
from app.perfiles import bp
from app.extensions import db
from sqlalchemy import text
import base64
from flask_jwt_extended import jwt_required
from datetime import date


@bp.route('/getPerfilEsLider/<int:persona_id>', methods=['GET'])
@cross_origin()
def get_Perfil_Lider_id(persona_id):
    persona = CCG_Persona.query.filter_by(id=persona_id,EsLider=True).first()

    if persona is None:
        return jsonify({'message': 'Persona no encontrada'}), 404

    persona_schema = CCG_PersonaSchema()
    ministerio_schema = CCG_MinisterioSchema()
    grupo_schema = CCG_GrupoSchema()

    ministerio = CCG_Ministerio.query.filter_by(IdEncargado=persona.id).first()
    ministerio_data = ministerio_schema.dump(ministerio)
    nombre = CCG_Persona.query.get(ministerio.idEncargado).Nombres
    apellido = CCG_Persona.query.get(ministerio.idEncargado).Apellidos
    ministerio_data['Encargado'] = nombre + ' ' + apellido
    #ministerio_data['Id']=CCG_Grupo
    #grupos_data = []
    #grupo = CCG_Grupo.query.filter_by(idMinisterio=5).first()

    #grupo_data = grupo_schema.dump(grupo)
    
    return jsonify(ministerio_data)
    


@bp.route('/getGrupos/<int:ministerio_id>', methods=['GET'])
@cross_origin()
def get_grupos(ministerio_id):
    ministerioGrupos = CCG_Grupo.query.filter_by(idMinisterio=ministerio_id).all()

    if ministerioGrupos is None:
        return jsonify({'message': 'No hay grupos para el ministerio'}), 404

    grupo_schema = CCG_GrupoSchema()

    grupos_data = []
    print('hola')
    for grupo in ministerioGrupos:
        grupo_data = grupo_schema.dump(grupo)
        nombre = CCG_Persona.query.get(grupo.idEncargado).Nombres
        apellido = CCG_Persona.query.get(grupo.idEncargado).Apellidos
        grupo_data['Encargado'] = nombre + ' ' + apellido
        print(nombre)
        personas = CCG_Persona_Grupo.query.filter_by(idGrupo=grupo.id).all()
        persona_schema = CCG_Persona_GrupoSchema()
        personas_grupo = []
        for persona in personas:
            persona_data = persona_schema.dump(persona)
            nombre = CCG_Persona.query.get(persona.idPersona).Nombres
            apellido = CCG_Persona.query.get(persona.idPersona).Apellidos
            persona_data['Nombre'] = nombre + ' ' + apellido
            print(nombre)
            personas_grupo.append(persona_data)

        grupo_data['Miembros'] = personas_grupo
        grupos_data.append(grupo_data)

  
    return jsonify(grupos_data)
    

@bp.route('/getOpcionesVentanas', methods=['GET'])
@cross_origin()
def get_opcVentanas():
    opciones = CCG_Opcion.query.all()

    opcion_schema = CCG_OpcionSchema()
    par_schema = CCG_ParametroSchema()

    output = []
    for opc in opciones:
        opc_data = opcion_schema.dump(opc)
        parametros = CCG_Parametro.query.filter_by(idPadre=opc.id).all()
        parametros_data = []
        for par in parametros:
            par_data = par_schema.dump(par)
            parametros_data.append(par_data)
        
        
        opc_data['parametros'] = parametros_data
        output.append(opc_data)

    return jsonify(output)


@bp.route('/getOpcionesUsuario/<int:usuario_id>', methods=['GET'])
@cross_origin()
def get_Opciones(usuario_id):
    usuario = CCG_Usuario.query.filter_by(id=usuario_id).first()
    
    rolUsu = CCG_Rol.query.filter_by(id=usuario.idRol).first()

    if usuario is None:
        return jsonify({'message': 'Usuario no encontrado'}), 404

    usuario_schema = CCG_UsuarioSchema()
    rol_schema = CCG_RolSchema()

    #para obtener todas las opciones del usuario
    opcionesrol = CCG_RolOpcionPar.query.filter_by(idRol=rolUsu.id).all()
    opciones_schema = CCG_RolOpcionParSchema()

    #data = opciones_schema.dump(opcionesrol)
    data = rol_schema.dump(rolUsu)
   # data1 = opciones_schema.dump(opcionesrol)

    data["opciones"] = {}
    #'''
    par_data = []
    claves =[]
    
    for pr in opcionesrol:
        

        parametroinfo = CCG_Parametro.query.filter_by(id=pr.idPar).first()
        parametro_schema = CCG_ParametroSchema()
        opcionInfo = CCG_Opcion.query.filter_by(id=parametroinfo.idPadre).first()
        opcion_schema = CCG_OpcionSchema()


        p_data = parametro_schema.dump(parametroinfo)
        print(parametroinfo)
        op_data = opcion_schema.dump(opcionInfo)

        if opcionInfo.descripcion not in claves:
            data["opciones"][opcionInfo.descripcion]= op_data
            data["opciones"][opcionInfo.descripcion]["parametros"]= []
        
        data["opciones"][opcionInfo.descripcion]["parametros"].append(p_data)
        claves = list( data["opciones"].keys()) 

        '''
        data["opciones"][opcionInfo.descripcion]= op_data 
        par_data.append(p_data)
        data["opciones"][opcionInfo.descripcion]["parametros"]= par_data
        '''
        #par_data.clear()
      
        #para agregar los parametros   
    

    return jsonify(data)


  
'''
 @bp.route('/getGrupos/<int:ministerio_id>', methods=['GET'])
@cross_origin()
def get_grupos(ministerio_id):
    ministerioGrupos = CCG_Grupo.query.filter_by(idMinisterio=ministerio_id).all()

    if ministerioGrupos is None:
        return jsonify({'message': 'No hay grupos para el ministerio'}), 404

    grupo_schema = CCG_GrupoSchema()

    grupos_data = []
    for grupo in ministerioGrupos:
        grupo_data = grupo_schema.dump(grupo)
        nombre = CCG_Persona.query.get(grupo.idEncargado).Nombres
        apellido = CCG_Persona.query.get(grupo.idEncargado).Apellidos
        grupo_data['Encargado'] = nombre + ' ' + apellido
        personas = CCG_Persona_Grupo.query.filter_by(idGrupo=grupo.id).all()
        persona_schema = CCG_Persona_GrupoSchema()
        personas_grupo = []
        for persona in personas:
            persona_data = persona_schema.dump(persona)
            nombre = CCG_Persona.query.get(persona.idPersona).Nombres
            apellido = CCG_Persona.query.get(persona.idPersona).Apellidos
            persona_data['Nombre'] = nombre + ' ' + apellido
            personas_grupo.append(persona_data)

        grupo_data['Miembros'] = personas_grupo
        grupos_data.append(grupo_data)

  
    return jsonify(grupos_data)
'''