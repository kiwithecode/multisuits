from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models.CCG_Persona import CCG_Persona
from app.models.CCG_Ministerio import CCG_Ministerio


class CCG_Grupo(db.Model):
    __tablename__ = 'CCG_Grupo'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    idEncargado = db.Column(db.Integer,  db.ForeignKey(CCG_Persona.id))
    idMinisterio = db.Column(db.Integer,  db.ForeignKey(CCG_Ministerio.Id))
    lider = db.Column(db.Integer)
    Nombre = db.Column(db.String(50))
    Estado = db.Column(db.String(1))
    nivel = db.Column(db.Integer)
    jerarquia = db.Column(db.String(20))


class CCG_GrupoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Grupo
