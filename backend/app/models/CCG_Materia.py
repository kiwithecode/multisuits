from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Materia(db.Model):
    __tablename__ = 'CCG_Materia'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    idFase = db.Column(db.String(10))
    Nombre = db.Column(db.String(20))
    Descripción = db.Column(db.String(250))
    FechaInicio = db.Column(db.Date)
    FechaFin = db.Column(db.Date)
    Horario = db.Column(db.String(30))
    Modalidad = db.Column(db.String(10))

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idFase'], ['CCG_Fase.Id'])
    )


class CCG_MateriaSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Materia
