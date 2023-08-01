from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Bitacora_Grupo
from app.models import CCG_Persona_Grupo


class CCG_Asistencia_Grupo(db.Model):
    __tablename__ = 'CCG_Asistencia_Grupo'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    idPersona = db.Column(db.Integer, db.ForeignKey(CCG_Persona_Grupo.CCG_Persona_Grupo.id))
    idReunionSemanal = db.Column(db.Integer, db.ForeignKey(CCG_Bitacora_Grupo.CCG_Bitacora_Grupo.id))
    asistencia = db.Column(db.Boolean)



class CCG_Asistencia_GrupoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Asistencia_Grupo
