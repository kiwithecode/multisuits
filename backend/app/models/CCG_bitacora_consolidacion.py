from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Persona
from app.models import CCG_Usuario


class CCG_bitacora_consolidacion(db.Model):
    __tablename__ = 'CCG_bitacora_consolidacion'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    idPersona = db.Column(db.Integer)
    comentario = db.Column(db.String(50))
    fechaCreacion = db.Column(db.Date)
    usuarioCrea = db.Column(db.Integer)
    FechaModificacion = db.Column(db.Date)
    UsuarioModifica = db.Column(db.Integer)
    Motivo = db.Column(db.String(70))
    Contactar = db.Column(db.Boolean)

class CCG_bitacora_consolidacionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_bitacora_consolidacion

