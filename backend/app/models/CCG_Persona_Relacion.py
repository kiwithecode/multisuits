from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Persona
from app.models import CCG_Relacion



class CCG_Persona_Relacion(db.Model):
    __tablename__ = 'CCG_Persona_Relacion'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    idPersona1 = db.Column(db.Integer , db.ForeignKey(CCG_Persona.CCG_Persona.id))
    idPersona2 = db.Column(db.Integer , db.ForeignKey(CCG_Persona.CCG_Persona.id))
    idRelacion = db.Column(db.Integer , db.ForeignKey(CCG_Relacion.CCG_Relacion.id))
    Estado = db.Column(db.String(1))


class CCG_Persona_RelacionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Persona_Relacion
