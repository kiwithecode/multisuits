from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models.CCG_Persona import CCG_Persona


class CCG_Ministerio(db.Model):
    __tablename__ = 'CCG_Ministerio'
    __table_args__ = {'schema': 'CCG.dbo'}

    Id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(30))
    IdEncargado = db.Column(db.Integer, db.ForeignKey(CCG_Persona.id))
    Estado = db.Column(db.String(10))



class CCG_MinisterioSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Ministerio
