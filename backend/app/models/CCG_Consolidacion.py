from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Persona

class CCG_Consolidacion(db.Model):
    __tablename__ = 'CCG_Consolidacion'
    __table_args__ = {'schema': 'CCG.dbo'}

    Id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    idPersona = db.Column(db.String(10), db.ForeignKey(CCG_Persona.CCG_Persona.id))
    Fecha = db.Column(db.Date)
    NúmeroCulto = db.Column(db.String(1))
    idForm = db.Column(db.String(10))



class CCG_ConsolidacionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Consolidacion
