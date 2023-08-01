from app.models.CCG_Persona import CCG_Persona, CCG_PersonaSchema
from app.models.CCG_Hobbies_Pasatiempos import CCG_Hobbies_Pasatiempos, CCG_Hobbies_PasatiemposSchema
from app.models.CCG_Consolidacion import CCG_Consolidacion, CCG_ConsolidacionSchema
from app.models.CCG_bitacora_consolidacion import CCG_bitacora_consolidacion
from app.models.CCG_Persona_Contacto import CCG_Persona_Contacto, CCG_Persona_ContactoSchema
from app.models.CCG_Contacto import CCG_Contacto,CCG_ContactoSchema
from app.models.CCG_Ministerio import CCG_Ministerio, CCG_MinisterioSchema
from app.models.CCG_Grupo import CCG_Grupo, CCG_GrupoSchema
from app.models.CCG_Persona_Grupo import CCG_Persona_Grupo, CCG_Persona_GrupoSchema
from app.models.CCG_Persona_Relacion import CCG_Persona_Relacion,CCG_Persona_RelacionSchema
from app.models.CCG_Relacion import CCG_Relacion,CCG_RelacionSchema
from app.models.CCG_Usuario import CCG_Usuario, CCG_UsuarioSchema
from app.models.CCG_Bitacora_Grupo import CCG_Bitacora_Grupo,CCG_Bitacora_GrupoSchema
from app.models.CCG_Asistencia_Grupo import CCG_Asistencia_Grupo,CCG_Asistencia_GrupoSchema

from flask import jsonify, request
from flask_cors import cross_origin
from app.consolidacion import bp
from app.extensions import db
from sqlalchemy import text
import base64
from flask_jwt_extended import jwt_required, get_jwt_identity
from datetime import date, datetime
from sqlalchemy import or_
import datetime
import math


# @bp.route('/personas', methods=['GET'])
# @cross_origin()
# @jwt_required()
# def get_personas():
#     personas = CCG_Persona.query.all()
#     persona_schema = CCG_PersonaSchema(many=True)
#     output = persona_schema.dump(personas)
#     return jsonify(output)

@bp.route('/personas', methods=['GET'])
@cross_origin()
def get_persona():
    personas = CCG_Persona.query.all()

    persona_schema = CCG_PersonaSchema()
    persona_contacto_schema = CCG_Persona_ContactoSchema()
    contacto_schema = CCG_ContactoSchema()
    persona_relacion_schema = CCG_Persona_RelacionSchema()

    output = []
    for persona in personas:
        persona_data = persona_schema.dump(persona)
        contactos = CCG_Persona_Contacto.query.filter_by(idPersona=persona.id).all()
        #get the grupo where persona is, is only one
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
        contactos_data = []
        familiares = CCG_Persona_Relacion.query.filter_by(idPersona1 = persona.id).all()
        familiares_data=[]
        for contacto in contactos:
            contacto_data = persona_contacto_schema.dump(contacto)
            contacto_data['contacto_tipo'] = CCG_Contacto.query.get(contacto.idContacto).Tipo
            contactos_data.append(contacto_data)
        
        
        persona_data['contactos'] = contactos_data
        output.append(persona_data)

    return jsonify(output)




@bp.route('/personaExistente/<id>', methods=['GET'])
@cross_origin()
@jwt_required()
def get_persona_existente(id):
    persona = CCG_Persona.query.get(id)
    if persona:
        return jsonify(True)
    else:
        return jsonify(False)
    
@bp.route("/lideres", methods=['GET'])
@cross_origin()
@jwt_required()
def get_lideres():
    lideres = CCG_Persona.query.filter_by(EsLider=True).all()
    #quit lider if is admin 
    lideres = [l for l in lideres if l.id != 13]
    persona_schema = CCG_PersonaSchema(many=True)
    output = persona_schema.dump(lideres)
    return jsonify(output)
''''
{
  "ID": "1234567890",
  "Identificacion": "ABC123",
  "Tipo_Identifiicacion": "Passport",
  "Fecha_Nac": "1990-01-01",
  "Nombres": "John",
  "Apellidos": "Doe",
  "Sexo": "Male",
  "EstadoCivil": "Single",
  "EsVoluntario": true,
  "EsEmpleado": false,
  "EsAlumno": true,
  "EsUsuario": true,
  "EsFacilitador": false,
  "HobbiesPersona": "123",
  "Zona": "Zone A",
  "Fecha_Ingreso_Registro": "2022-01-01T10:00:00",
  "Consolidacion": true,
  "Fidelidad_Aportaciones": true,
  "Foto": "base64encodedimage",
  "EsBautizado": true,
  "PerteneceGrupoFamiliar": false,
  "EsLider" = true
}
'''

@bp.route('/getPersonaByID/<int:persona_id>', methods=['GET'])
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
        
    '''for contacto in contactos:
        contacto_data = persona_contacto_schema.dump(contacto)
        contacto_data['contacto_tipo'] = CCG_Contacto.query.get(contacto.idContacto).Tipo
        contactos_data.append(contacto_data)'''
      
    
    for familiar in familiares:
        familiar_data = persona_relacion_schema.dump(familiar)
        tipo=CCG_Relacion.query.get(familiar.idRelacion).Descripcion
        if familiar.idPersona1 == persona_id:
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



def calcular_edad(fecha_nacimiento):
    today = datetime.today()
    return today.year - fecha_nacimiento.year - ((today.month, today.day) < (fecha_nacimiento.month, fecha_nacimiento.day))

'''
json example for /sendForm
{
    "Identificacion": "1234567890",
    "Tipo_Identificacion": "Cedula",
    "Fecha_Nac": "1990-01-01",
    "Nombres": "John",
    "Apellidos": "Doe",
    "Foto": "base64encodedimage",//opcional
    "Sexo":"M",
    "EstadoCivil":"soltero",
    "Zona":"Zona A",
    "Dir_Trabajo":"Trabajo",
    "profesion":"Profesion",
    "Dir_Domicilio":"Direccion",
    "EsBautizado":true,
    "PerteneceGrupoFamiliar":false,
    "FechaBautizo":"2021-01-01",
    "comentario":"comentario",
    "Tel_Domicilio":"1234567890",
    "Cel_Personal":"1234567890",
    "Tel_Trabajo":"1234567890",
    "Correo_Personal":"juan@fmail.com
}
'''
@bp.route('/sendForm', methods=['POST'])
@cross_origin()
@jwt_required()
def send_form():
    current_user = get_jwt_identity()
    user = CCG_Usuario.query.filter_by(Codigo=current_user).first()
    id_user = user.id

    data = request.json
    Identificacion = data.get('Identificacion')
    Tipo_Identificacion = data.get('Tipo_Identificacion')
    Fecha_Nac = data.get('Fecha_Nac')
    Nombres = data.get('Nombres')
    Foto = data.get('Foto')
    Apellidos = data.get('Apellidos')
    Sexo = data.get('Sexo')
    EstadoCivil = data.get('EstadoCivil')
    EsVoluntario=False
    EsEmpleado=False
    EsAlumno=False
    EsFacilitador=False
    Zona = data.get('Zona')
    Fecha_Ingreso_Registro = datetime.today()
    Consolidacion = True
    Fidelidad_Aportaciones=False
    EsBautizado = data.get('EsBautizado')
    PerteneceGrupoFamiliar = data.get('PerteneceGrupoFamiliar')
    EsLider=False
    UsuarioModifica = id_user
    Dir_Domicilio = data.get('Dir_Domicilio')
    profesion = data.get('profesion')
    Dir_Trabajo = data.get('Dir_Trabajo')
    FechaBautizo = data.get('FechaBautizo')
    Tel_Trabajo=data.get('Tel_Trabajo')
    Tel_Domicilio=data.get('Tel_Domicilio')
    Cel_Personal=data.get('Cel_Personal')
    Correo_Personal=data.get('Correo_Personal')
    Cel_Trabajo=data.get('Cel_Trabajo')
    Correo_Trabajo=data.get('Correo_Trabajo')

    # fecha de ingreso hoy
    fields_to_update = data.keys()

    # if persona exists, update it
    persona = CCG_Persona.query.filter_by(Identificacion=Identificacion).first()
    if persona:
        #update fields with for
        for field in fields_to_update:
            setattr(persona, field, data[field])
        db.session.commit()
    else:
        # Crear una nueva instancia del modelo CCG_Persona
        persona = CCG_Persona(
            Identificacion=Identificacion,
            Tipo_Identificacion=Tipo_Identificacion,
            Fecha_Nac=Fecha_Nac,
            Nombres=Nombres,
            Apellidos=Apellidos,
            Sexo=Sexo,
            EstadoCivil=EstadoCivil,
            Zona=Zona,
            Fecha_Ingreso_Registro=Fecha_Ingreso_Registro,
            Consolidacion=Consolidacion,
            EsBautizado=EsBautizado,
            PerteneceGrupoFamiliar=PerteneceGrupoFamiliar,
            Foto=Foto,
            Dir_Domicilio=Dir_Domicilio,
            profesion=profesion,
            Dir_Trabajo=Dir_Trabajo,
            FechaBautizo=FechaBautizo,
            UsuarioModifica=UsuarioModifica,
            EsVoluntario=EsVoluntario,
            EsEmpleado=EsEmpleado,
            EsAlumno=EsAlumno,
            EsFacilitador=EsFacilitador,
            Fidelidad_Aportaciones=Fidelidad_Aportaciones,
            EsLider=EsLider,
            Tel_Trabajo=Tel_Trabajo,
            Tel_Domicilio=Tel_Domicilio,
            Cel_Personal=Cel_Personal,
            Correo_Personal=Correo_Personal,
            Cel_Trabajo=Cel_Trabajo,
            Correo_Trabajo=Correo_Trabajo
        )

        # Agregar la persona a la sesión de la base de datos
        db.session.add(persona)
        db.session.commit()

    # Después de agregar la persona, obtener el ID de la persona
    #persona = CCG_Persona.query.filter_by(Identificacion=Identificacion).first()
    idPersona = persona.id

    # si pertenece a un grupo familiar, asignarle el id del lider que escogió
    if PerteneceGrupoFamiliar:
        lider = data.get('lider')
        grupo = CCG_Grupo.query.filter((CCG_Grupo.lider == lider) | (CCG_Grupo.idEncargado == lider)).first()
        if grupo:
            persona_grupo = CCG_Persona_Grupo(
                idGrupo=grupo.id,
                idPersona=idPersona,
                FechaInicio=datetime.today(),
                Estado='A'
            )
            db.session.add(persona_grupo)
            db.session.commit()

    # chequear si la persona quiere ser parte de un grupo familiar
    quiereGrupoFamiliar = data.get('quiereGrupoFamiliar')
    if quiereGrupoFamiliar:
        # Determinar el líder temporal basado en la edad y el estado civil
        lider_temporal = None
        age = calcular_edad(Fecha_Nac)  # Función para calcular la edad basada en la fecha de nacimiento
        if age > 40:
            if EstadoCivil == 'casado':
                lider_temporal = 'Fusionados'
            elif EstadoCivil == 'soltero':
                # Usar la API de Google Maps para determinar la zona basada en la ubicación de la persona
                #lider_temporal = obtener_lider_zona(zona) 
                lider_temporal = ''
                # Función para obtener el líder de zona desde la API de Google Maps
        elif 26 <= age <= 40:
            lider_temporal = 'Mosaico'
        elif 18 <= age <= 25:
            lider_temporal = 'Enciende'
        elif 13 <= age <= 17:
            lider_temporal = 'Piroforia'
        elif age <= 12:
            lider_temporal = 'Tierra Prometida'
        #get ministerio from lider_temporal
        ministerio = CCG_Ministerio.query.filter_by(nombre=lider_temporal).first()
        if ministerio:
            #get grupo from ministerio
            grupo = CCG_Grupo.query.filter_by(idMinisterio=ministerio.id).first()
            if grupo:
                persona_grupo = CCG_Persona_Grupo(
                    idGrupo=grupo.id,
                    idPersona=idPersona,
                    FechaInicio=datetime.today(),
                    Estado='A'
                )
                db.session.add(persona_grupo)
                db.session.commit()

    # Crear una nueva instancia del modelo CCG_Consolidacion
    consolidacion = CCG_Consolidacion(
        idPersona=idPersona,
        Fecha=datetime.today(),
        idForm='1',
        NúmeroCulto='1',
    )

    # Agregar la consolidación a la sesión de la base de datos
    db.session.add(consolidacion)
    db.session.commit()

    # Obtener el ID de la consolidación recién agregada
    #consolidacion = CCG_Consolidacion.query.filter_by(idPersona=idPersona).first()
    #idConsolidacion = consolidacion.Id

    # Crear una nueva instancia del modelo CCG_bitacora_consolidacion
    bitacora_consolidacion = CCG_bitacora_consolidacion(
        idPersona=idPersona,
        comentario=data.get('comentario'),
        fechaCreacion=datetime.today(),
        usuarioCrea=UsuarioModifica,
        FechaModificacion=datetime.today(),
        Motivo=data.get('motivo'),
        Contactar=False,
    )

    # Agregar la bitácora de consolidación a la sesión de la base de datos
    db.session.add(bitacora_consolidacion)
    db.session.commit()

    # Agregar los contactos a la sesión de la base de datos
    '''contactos = [
        ('3', data.get('Correo_Personal')),
        ('1', data.get('Tel_Domicilio')),
        ('5', data.get('Tel_Trabajo')),
        ('2', data.get('Cel_Personal'))
    ]

    for idContacto, valor in contactos:
        if valor:
            persona_contacto = CCG_Persona_Contacto(
                idPersona=idPersona,
                idContacto=idContacto,
                Valor=valor,
                Fecha_registro=datetime.today(),
                Estado='A'
            )
            db.session.add(persona_contacto)

    db.session.commit()'''

    return 'Formulario enviado exitosamente', 201


# Actualizar persona
@bp.route('/personas/<id>', methods=['PUT'])
@cross_origin()
def update_persona(id):
    # update the persona with the given id, only the fields that are provided in the request
    persona = CCG_Persona.query.get(id)
    data = request.json
    if not persona:
        return jsonify({'message': 'Persona does not exist'}), 400
    
    fields_to_update = data.keys()
    update=False
    for field in fields_to_update:
        if field == 'Foto':
            image_bytes = base64.b64decode(data[field])
            update=True
            setattr(persona, field, image_bytes)
        #check if the field exists in the model

        elif field in persona.__table__.columns:
            update=True
            setattr(persona, field, data[field])
    
    # if there where no fields to update, return an error
    if not update:
        return jsonify({'message': 'No fields to update'}), 400
    
    setattr(persona, field, data[field])
        

    db.session.commit()
    return jsonify({'message': 'Persona updated successfully'}), 200
        
# Eliminar persona
@bp.route('/personas/<id>', methods=['DELETE'])
@cross_origin()
@jwt_required()
def delete_persona(id):
    persona = CCG_Persona.query.get(id)
    if not persona:
        return jsonify({'message': 'Persona does not exist'}), 400
    db.session.delete(persona)
    db.session.commit()
    return jsonify({'message': 'Persona deleted successfully'}), 200

# update contacto 
@bp.route('/contacto/<id>', methods=['PUT'])
@cross_origin()
def update_contacto(id):
    # update the persona with the given id, only the fields that are provided in the request
    contacto = CCG_Persona_Contacto.query.get(id)
    data = request.json
    if not contacto:
        return jsonify({'message': 'Contacto does not exist'}), 400
    update = False
    fields_to_update = data.keys()
    for field in fields_to_update:
        #check if the field exists in the model
        if field in contacto.__table__.columns:
            update = True
            setattr(contacto, field, data[field])

    # if there where no fields to update, return an error
    if not update:
        return jsonify({'message': 'No fields to update'}), 400
    
    db.session.commit()
    return jsonify({'message': 'Contacto updated successfully'}), 200

# Hobbies
@bp.route('/hobbies', methods=['GET'])
@cross_origin()
@jwt_required()
def get_hobbies():
    hobbies = CCG_Hobbies_Pasatiempos.query.all()
    hobbies_schema = CCG_Hobbies_PasatiemposSchema(many=True)
    result = hobbies_schema.dump(hobbies)
    return jsonify(result)

@bp.route('/hobbies', methods=['POST'])
@cross_origin()
@jwt_required()
def create_hobby():
    data = request.json

    # Extract the necessary data from the request
    id_hobbie = data.get('IdHobbie')
    descripcion = data.get('descripcion')

    # Create a new instance of the CCG_Hobbies_Pasatiempos model
    hobby = CCG_Hobbies_Pasatiempos(
        IdHobbie=id_hobbie,
        descripcion=descripcion
    )

    # Add the hobby to the database session
    db.session.add(hobby)
    db.session.commit()

    return 'Hobby created successfully', 201

#perfiles que puede ver el lider

@bp.route('/getPerfilEsLider/<int:persona_id>', methods=['GET'])
@cross_origin()
def get_Perfil_Lider_ID(persona_id):
    persona = CCG_Persona.query.filter_by(id=persona_id,EsLider=True).first()

    if persona is None:
        return jsonify({'message': 'Persona no encontrada'}), 404

    persona_schema = CCG_PersonaSchema()
    ministerio_schema = CCG_MinisterioSchema()
    grupo_schema = CCG_GrupoSchema()

    ministerio = CCG_Ministerio.query.filter_by(IdEncargado=persona.id).first()
    ministerio_data = ministerio_schema.dump(ministerio)
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


@bp.route('/getGrupoPorLider/<int:lider_id>', methods=['GET'])
@cross_origin()
def get_grupos_lider(lider_id):
    grupo = CCG_Grupo.query.filter_by(idEncargado=lider_id).first()
    if grupo is None:
        return jsonify({'message': 'No hay grupos para el ministerio'}), 404

    grupo_schema = CCG_GrupoSchema()
    personas = CCG_Persona_Grupo.query.filter_by(idGrupo=grupo.id).all()
    persona_schema = CCG_Persona_GrupoSchema()
    grupo_data = grupo_schema.dump(grupo)
    ministerio = CCG_Ministerio.query.get(grupo.idMinisterio).nombre
    personas_grupo = []
    #if len(Tel_Domicilio) == 0:
    
    for persona in personas:
        persona_data = persona_schema.dump(persona)
        nombre = CCG_Persona.query.get(persona.idPersona).Nombres
        apellido = CCG_Persona.query.get(persona.idPersona).Apellidos
        identif = CCG_Persona.query.get(persona.idPersona).Identificacion
        ministeriop = ministerio
        persona_contacto_schema = CCG_Persona_ContactoSchema()
        Tel_Domicilio = None
        Correo_Personal=None
        
        persona_data = persona_schema.dump(persona)
        contactos = CCG_Persona_Contacto.query.filter_by(idPersona=persona.idPersona).all()
        for contacto in contactos:
           
            if (contacto.idContacto == 2):
                Tel_Domicilio = contacto.Valor
                persona_data['Telefono'] = Tel_Domicilio

            elif (contacto.idContacto == 3):
                Correo_Personal = contacto.Valor
                persona_data['Correo'] = Correo_Personal

        #Correo_Personal = CCG_Persona.query.get(persona.idPersona).Dir_Domicilio
        Dir_Domicilio = CCG_Persona.query.get(persona.idPersona).Zona
        zona = CCG_Persona.query.get(persona.idPersona).Apellidos
        persona_data['Nombres'] = nombre
        persona_data['Apellidos'] = apellido
        persona_data['Identificacion'] = identif
        
        persona_data['Ministerio'] = ministeriop
        persona_data['Direccion'] = Dir_Domicilio
        persona_data['Zona'] = zona
        
        personas_grupo.append(persona_data)


    grupo_data['Miembros'] = personas_grupo
    
    return jsonify(grupo_data)


@bp.route('/familiares', methods=['GET'])
@cross_origin()
#@jwt_required()
def get_tipoFamiliar():
    relacion = CCG_Relacion.query.all()
    relacion_schema = CCG_RelacionSchema(many=True)
    result = relacion_schema.dump(relacion)
    return jsonify(result)


@bp.route('/reunionSemanal/<int:lider_id>', methods=['POST'])
@cross_origin()
#@jwt_required()
def create_reunion(lider_id):
    grupo = CCG_Grupo.query.filter_by(idEncargado=lider_id).first()

    if grupo is None:
        return jsonify({'message': 'No hay grupos para el lider'}), 404
    
    id_grupo = grupo.id
    grupoid = CCG_Grupo.query.filter_by(id=id_grupo).first()
    if grupoid is None:
        return jsonify({'message': 'No hay grupos para el lider'}), 404

    data = request.json

    # Extract the necessary data from the request
    #id_grupo = data.get('IdGrupo')
    frecuencia = data.get('Frecuencia')
    #if frecuencia == 0:
        
    fechaI = data.get('FechaInicio')
    fechaF = data.get('FechaFin')
    semana = data.get('Semana')
    horaI = data.get('HrInicio')
    horaF = data.get('HrFin')
    estado = data.get('Estado')

    comentarios = data.get('Comentario')

    start = datetime.datetime.strptime(fechaI,"%d-%B-%Y")

    if fechaI is None or semana is None or horaI is None:
        return jsonify({'error': 'Datos no válidos'}), 400
    
    if frecuencia == 0:
        #reunion de una sola vez
        repite_reunion(start,id_grupo,semana,estado,horaI,horaF,comentarios)
    
    elif frecuencia == 1:
        if fechaF is None:
            return jsonify({'error': 'Datos no válidos'}), 400
        #reunion todos los dias
        end = datetime.datetime.strptime(fechaF,"%d-%B-%Y")

        while start <= end:
            repite_reunion(start,id_grupo,semana,estado,horaI,horaF,comentarios)
            # Add the hobby to the database session
            start += datetime.timedelta(days=1)
        print('hola')

    elif frecuencia == 2:
        if fechaF is None:
            return jsonify({'error': 'Datos no válidos'}), 400
        #start = datetime.datetime.strptime(fechaI,"%d-%B-%Y")
        end = datetime.datetime.strptime(fechaF,"%d-%B-%Y")

        dia = start.strftime("%w")
        #Weekday as a number 0-6
        while start <= end:
            if start.strftime("%w") == dia:
                # 4 representa el viernes (0 = lunes, 1 = martes)
                repite_reunion(start,id_grupo,semana,estado,horaI,horaF,comentarios)
            # Add the hobby to the database session
            start += datetime.timedelta(days=1)

    else:
        return jsonify({'error': 'Opción no válida'}), 400


    db.session.commit()
    return 'Reunion Semanal created successfully', 201

def repite_reunion(start,id_grupo,semana,estado,horaIni,horaFi,comentarios):
    fechaNueva = f"{start.strftime('%Y')}-{start.strftime('%m')}-{start.day}"

    reunion = CCG_Bitacora_Grupo(
    idGrupo=id_grupo,
    Fecha=fechaNueva,
    Semana = semana+1,
    Estado = estado,
    HoraInicio  = horaIni,
    HoraFin = horaFi,
    Comentario = comentarios)

    db.session.add(reunion) 


@bp.route('/reunionSemanalAsistencia/', methods=['POST'])
@cross_origin()
#@jwt_required()
def reunion_asistencia():
    
    
    data = request.json
    # Extract the necessary data from the request
    id_reunion = data.get('idReunion')
    id_miembro = data.get('idMiembro')
    asistencia_ = data.get('asistencia')

    reunion_existe = CCG_Bitacora_Grupo.query.filter_by(id=id_reunion).first()
    miembro_existe = CCG_Persona_Grupo.query.filter_by(id=id_miembro).first()

    if reunion_existe is None or miembro_existe is None:
        return jsonify({'error': 'Datos no válidos'}), 400


    if asistencia_ not in range(0, 2):
        return jsonify({'error': 'Valor de asistencia no válido'}), 400
    

    # Create a new instance of the CCG_Hobbies_Pasatiempos model
    reunion = CCG_Asistencia_Grupo(
        idPersona =  id_miembro,
        idReunionSemanal = id_reunion,
        asistencia = asistencia_
    )

    # Add the hobby to the database session
    db.session.add(reunion)
    db.session.commit()

    return 'Asistencias registradas successfully', 201




'''
@bp.route('/familiares', methods=['POST'])
@cross_origin()
@jwt_required()
def agregar_familiar():
    data = request.json

    # Extract the necessary data from the request
    #usuario_actual = get_jwt_identity()
    id_persona = data.get('IdPersona2')
    id_Relacion = data.get('Relacion')
    estado = data.get('Estado')
    # Create a new instance of the CCG_Hobbies_Pasatiempos model
    familiar_per = CCG_Persona_Relacion(
        idPersona1= id_persona,
        idRelacion= id_Relacion,
        Estado = estado
    )

    # Add the hobby to the database session
    db.session.add(hobby)
    db.session.commit()

    return 'Hobby created successfully', 201


    def get_persona_by_ID(persona_id):
    persona = CCG_Persona.query.filter_by(id=persona_id).first()

    if persona is None:
        return jsonify({'message': 'Persona no encontrada'}), 404

    persona_schema = CCG_PersonaSchema()
    persona_contacto_schema = CCG_Persona_ContactoSchema()
    contacto_schema = CCG_ContactoSchema()

    persona_data = persona_schema.dump(persona)
    contactos = CCG_Persona_Contacto.query.filter_by(idPersona=persona.id).all()
    contactos_data = []
    for contacto in contactos:
        contacto_data = persona_contacto_schema.dump(contacto)
        contacto_data['contacto_tipo'] = CCG_Contacto.query.get(contacto.idContacto).Tipo
        contactos_data.append(contacto_data)

    persona_data['contactos'] = contactos_data

    return jsonify(persona_data)



@bp.route('/personas', methods=['POST'])
@cross_origin()
@jwt_required()
def create_persona():
    data = request.json
    
    id = data.get('id')
    identificacion = data.get('Identificacion')
    tipo_identificacion = data.get('Tipo_Identificacion')
    Fecha_Nac = data.get('Fecha_Nac')
    Nombres = data.get('Nombres')
    Apellidos = data.get('Apellidos')
    Sexo = data.get('Sexo')
    EstadoCivil = data.get('EstadoCivil')
    Fecha_Ingreso_Registro = data.get('Fecha_Ingreso_Registro')
    Consolidacion = data.get('Consolidacion')
    Fidelidad_Aportaciones = data.get('Fidelidad_Aportaciones')
    Foto = data.get('Foto')
    EsBautizado = data.get('EsBautizado')
    PerteneceGrupoFamiliar = data.get('PerteneceGrupoFamiliar')
    EsLider = data.get('EsLider')
    if Foto:
        image_bytes = base64.b64decode(Foto)
    # Create a new instance of the CCG_Persona model
    persona = CCG_Persona(
        id=id,
        Identificacion=identificacion,
        Tipo_Identificacion=tipo_identificacion,
        Fecha_Nac=Fecha_Nac,
        Nombres=Nombres,
        Apellidos=Apellidos,
        Sexo=Sexo,
        Fecha_Ingreso_Registro=Fecha_Ingreso_Registro,
        Consolidacion=Consolidacion,
        Fidelidad_Aportaciones=Fidelidad_Aportaciones,
        Foto=image_bytes if 'image_bytes' in locals() else None,
        EsBautizado=EsBautizado,
        PerteneceGrupoFamiliar=PerteneceGrupoFamiliar,
        EsLider=EsLider
    )

    # Add the persona to the database session
    db.session.add(persona)
    db.session.commit()

    return 'Persona created successfully', 201

'''

