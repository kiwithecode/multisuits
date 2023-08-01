from flask import request, jsonify
from flask_jwt_extended import jwt_required, create_access_token
from app.extensions import db
from app.models.CCG_Usuario import CCG_Usuario, CCG_UsuarioSchema
from app.models.CCG_Persona import CCG_Persona
from app.models.CCG_bitacora_consolidacion import CCG_bitacora_consolidacion
from app.login import bp as app
from marshmallow import ValidationError
from werkzeug.security import generate_password_hash, check_password_hash
from flask_cors import cross_origin
import datetime
'''
{
    "usuario": "amigo",
    "contrasenia": "abc123",
    "cedula": "1234567890"
}

'''
@app.route('/register', methods=['POST'])
@cross_origin()
def register():
    # use the schema to load the data from the request
    cedula = request.json['cedula']
    #rol by default is 2, which is 'Usuario' or its requested by the user
    rol = request.json['rol'] if 'rol' in request.json else 4
    # check if cedula exists in CCG_Persona
    existing_cedula = CCG_Persona.query.filter_by(Identificacion=cedula).first()
    if existing_cedula is None:
        return jsonify({'message': 'Cedula does not exist'}), 400
    # get id of CCG_Persona from cedula
    id_persona = existing_cedula.id
    # check if id_persona exists in CCG_Usuario
    existing_id_persona = CCG_Usuario.query.filter_by(idPersona=id_persona).first()
    if existing_id_persona is not None:
        return jsonify({'message': 'User already exists'}), 400
    # check if persona is in CCG_BitacoracON
    existing_persona = CCG_bitacora_consolidacion.query.filter_by(idPersona=id_persona).first()
    if existing_persona is None:
        return jsonify({'message': 'Missing consolidation'}), 400
    
    # check if username exists in CCG_Usuario
    existing_username = CCG_Usuario.query.filter_by(Codigo=request.json['usuario']).first()
    print(existing_username)
    if existing_username is not None:
        return jsonify({'message': 'Username already exists'}), 400

    try:
        user = CCG_Usuario(
            idPersona=id_persona,
            Codigo=request.json['usuario'],
            Contrasenia=request.json['contrasenia'],
            Estado='A',
            idRol=rol,
            Fecha_Creacion=datetime.datetime.now(),
            Fecha_modificacion=datetime.datetime.now()
        )

    except ValidationError as err:
        return jsonify(err.messages), 400

    # hash the user's password
    password = user.Contrasenia
    hashed_password = generate_password_hash(password)
    user.Contrasenia = hashed_password

    # add new user to the database
    db.session.add(user)
    db.session.commit()

    # create a new JWT for the user
    access_token = create_access_token(identity=user.id)
    user_dict={
        'id': user.id,
        'idPersona': user.idPersona,
        'Codigo': user.Codigo,
        'Estado': user.Estado,
        'Fecha_Creacion': user.Fecha_Creacion,
        'Fecha_modificacion': user.Fecha_modificacion
    }
    # return the new user and their JWT to the client
    return jsonify(access_token=access_token, user=user_dict), 201
