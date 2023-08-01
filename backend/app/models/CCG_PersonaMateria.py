from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_PersonaMateria(db.Model):
    __tablename__ = 'CCG_PersonaMateria'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    idPersona = db.Column(db.String(10))
    idMateria = db.Column(db.String(10))
    Estado = db.Column(db.String(30))
    FechaInicio = db.Column(db.Date)
    FechaFin = db.Column(db.Date)

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idPersona'], ['CCG_Persona.id']),
        db.ForeignKeyConstraint(['idMateria'], ['CCG_Materia.id'])
    )


class CCG_PersonaMateriaSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_PersonaMateria
