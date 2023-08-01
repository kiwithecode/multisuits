from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Fase(db.Model):
    __tablename__ = 'CCG_Fase'
    __table_args__ = {'schema': 'CCG.dbo'}

    Id = db.Column(db.String(10), primary_key=True)
    Nombre = db.Column(db.String(30))
    Nivel = db.Column(db.Integer)
    EncargadoVoluntacrio = db.Column(db.String(10))
    Periodo = db.Column(db.String(10))
    FechaInicio = db.Column(db.Date)
    FechaFin = db.Column(db.Date)
    Modalidad = db.Column(db.String(10))
    Estado = db.Column(db.String(30))

    __table_args__ = (
        PrimaryKeyConstraint('Id'),
        db.ForeignKeyConstraint(['EncargadoVoluntacrio'], ['CCG_Persona.id'])
    )


class CCG_FaseSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Fase
