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


@bp.route('/personas', methods=['POST'])
@cross_origin()
@jwt_required()
def create_persona():
    #get user from the jwt token
    current_user = get_jwt_identity()
    print(current_user)
    # find the user in the database with the current user username
    user = CCG_Usuario.query.filter_by(Codigo=current_user).first()
    # get the user id
    id_user = user.id
    #get the data from the request
    data = request.json
    
    Identificacion = data.get('Identificacion')
    Tipo_Identificacion = data.get('Tipo_Identificacion')
    Fecha_Nac = data.get('Fecha_Nac')
    Nombres = data.get('Nombres')
    Apellidos = data.get('Apellidos')
    Sexo = data.get('Sexo')
    EstadoCivil = data.get('EstadoCivil')
    EsVoluntario = False
    EsEmpleado = False
    EsAlumno = False
    EsUsuario = False
    EsFacilitador = False
    Zona = data.get('Zona')
    Fecha_Ingreso_Registro = datetime.today()
    Consolidacion = False
    Fidelidad_Aportaciones = False
    EsBautizado = data.get('EsBautizado')
    PerteneceGrupoFamiliar = False
    EsLider = False
    UsuarioModifica = id_user
    FechaModificacion = datetime.today()
    Dir_Domicilio = data.get('Dir_Domicilio')
    profesion = data.get('profesion')
    Dir_Trabajo = data.get('Dir_Trabajo')
    FechaBautizo = data.get('FechaBautizo')
    Tel_Trabajo = data.get('Tel_Trabajo')
    Tel_Domicilio = data.get('Tel_Domicilio')
    Correo_Trabajo = data.get('Correo_Trabajo')
    Correo_Personal = data.get('Correo_Personal')
    Cel_Personal = data.get('Cel_Personal')
    Cel_Trabajo = data.get('Cel_Trabajo')


    # Create a new instance of the CCG_Persona model
    persona = CCG_Persona(
        Identificacion=Identificacion,
        Tipo_Identificacion=Tipo_Identificacion,
        Fecha_Nac=Fecha_Nac,
        Nombres=Nombres,
        Apellidos=Apellidos,
        Sexo=Sexo,
        EstadoCivil=EstadoCivil,
        EsVoluntario=EsVoluntario,
        EsEmpleado=EsEmpleado,
        EsAlumno=EsAlumno,
        EsUsuario=EsUsuario,
        EsFacilitador=EsFacilitador,
        Zona=Zona,
        Fecha_Ingreso_Registro=Fecha_Ingreso_Registro,
        Consolidacion=Consolidacion,
        Fidelidad_Aportaciones=Fidelidad_Aportaciones,
        EsBautizado=EsBautizado,
        PerteneceGrupoFamiliar=PerteneceGrupoFamiliar,
        EsLider=EsLider,
        UsuarioModifica=UsuarioModifica,
        FechaModificacion=FechaModificacion,
        Dir_Domicilio=Dir_Domicilio,
        profesion=profesion,
        Dir_Trabajo=Dir_Trabajo,
        FechaBautizo=FechaBautizo,
        Tel_Trabajo=Tel_Trabajo,
        Tel_Domicilio=Tel_Domicilio,
        Correo_Trabajo=Correo_Trabajo,
        Correo_Personal=Correo_Personal,
        Cel_Personal=Cel_Personal,
        Cel_Trabajo=Cel_Trabajo
    )

    # Add the persona to the database session
    db.session.add(persona)
    db.session.commit()
    # make sure the persona is added first to get the id
    db.session.refresh(persona)
    print(persona.id)
    # get that persona from the database session
    '''idPersona = persona.id
        # Agregar los contactos a la sesión de la base de datos
    contactos = [
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


    return 'Persona created successfully', 201
