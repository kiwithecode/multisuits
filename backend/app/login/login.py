from flask import request, jsonify
from flask_jwt_extended import create_access_token
from app.extensions import db
from app.models.CCG_Usuario import CCG_Usuario, CCG_UsuarioSchema
from app.login import bp as app
from marshmallow import ValidationError
from werkzeug.security import check_password_hash
from flask_cors import cross_origin
from datetime import timedelta

@app.route('/login', methods=['POST'])
@cross_origin()
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    # Find the user by username
    user = CCG_Usuario.query.filter_by(Codigo=username).first()
    expires_in_days = 3
    expires_delta = timedelta(days=expires_in_days)

    if user is None:
        return 'Usuario no existe', 401
    
    #check is the user is activo, Estado = A
    if user.Estado != 'A':
        return 'Usuario inhabilitado', 401
    
    # Check if the password is correct
    if not check_password_hash(user.Contrasenia, password):
        return 'Credenciales inválidas', 401

    # Generate access token
    access_token = create_access_token(identity=user.Codigo, expires_delta=expires_delta)
    idPersona = user.idPersona
    idRol = user.idRol
    user=CCG_UsuarioSchema().dump(user)
    user['idPersona']=idPersona
    user['idRol']=idRol


    #return access token and user
    print()
    return jsonify(access_token=access_token, user=user), 200
 