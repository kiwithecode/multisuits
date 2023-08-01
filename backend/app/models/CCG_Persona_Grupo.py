from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models.CCG_Persona import CCG_Persona
from app.models.CCG_Grupo import CCG_Grupo



class CCG_Persona_Grupo(db.Model):
    __tablename__ = 'CCG_Persona_Grupo'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    idGrupo = db.Column(db.Integer,db.ForeignKey(CCG_Grupo.id))
    idPersona = db.Column(db.Integer,db.ForeignKey(CCG_Persona.id))
    FechaInicio = db.Column(db.Date)
    FechaFin = db.Column(db.Date)
    Estado = db.Column(db.String(1))



class CCG_Persona_GrupoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Persona_Grupo
