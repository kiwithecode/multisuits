from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Persona
from app.models import CCG_Grupo

class CCG_Bitacora_Grupo(db.Model):
    __tablename__ = 'CCG_Bitacora_Grupo'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    idGrupo = db.Column(db.Integer, db.ForeignKey(CCG_Grupo.CCG_Grupo.id))
    Fecha = db.Column(db.Date)
    Estado = db.Column(db.String(1))
    HoraInicio = db.Column(db.Time)
    HoraFin = db.Column(db.Time)
    Semana = db.Column(db.Integer)
    Comentario = db.Column(db.String(100))



class CCG_Bitacora_GrupoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Bitacora_Grupo
