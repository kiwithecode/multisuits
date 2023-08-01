from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Persona

from app.models import CCG_Rol

class CCG_Usuario(db.Model):
    __tablename__ = 'CCG_Usuario'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    Codigo = db.Column(db.String(10))
    Contrasenia = db.Column(db.String(30))
    idPersona = db.Column(db.Integer , db.ForeignKey(CCG_Persona.CCG_Persona.id))
    Estado = db.Column(db.String(1))
    Fecha_Creacion = db.Column(db.DateTime)
    Fecha_modificacion = db.Column(db.DateTime)
    idRol = db.Column(db.Integer , db.ForeignKey(CCG_Rol.CCG_Rol.id))





from marshmallow import fields

class CCG_UsuarioSchema(ma.SQLAlchemyAutoSchema):
    #idPersona = fields.Str()  # Manually add the field here

    class Meta:
        model = CCG_Usuario
        load_instance = True