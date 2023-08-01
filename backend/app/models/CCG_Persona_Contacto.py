from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models.CCG_Contacto import CCG_Contacto
from app.models.CCG_Persona import CCG_Persona

class CCG_Persona_Contacto(db.Model):
    __tablename__ = 'CCG_Persona_Contacto'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    idPersona = db.Column(db.Integer, db.ForeignKey(CCG_Persona.id))
    idContacto = db.Column(db.Integer, db.ForeignKey(CCG_Contacto.id))
    Estado = db.Column(db.String(1))
    Fecha_registro = db.Column(db.Date)
    Valor = db.Column(db.String(60))


class CCG_Persona_ContactoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Persona_Contacto
