from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Voluntariado(db.Model):
    __tablename__ = 'CCG_Voluntariado'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    idPersona = db.Column(db.Integer)
    Area = db.Column(db.String(10))
    Estado = db.Column(db.String(10))
    FechaModificacion = db.Column(db.Date)

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idPersona'], ['CCG_Persona.id']),
        db.ForeignKeyConstraint(['Area'], ['CCG_Area_vol.id']),

    )


class CCG_VoluntariadoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Voluntariado
