from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_LeccionesMateria(db.Model):
    __tablename__ = 'CCG_LeccionesMateria'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    idPersonaLecciones = db.Column(db.String(10))
    NombreLección = db.Column(db.String(30))
    FechaEntrega = db.Column(db.Date)
    horaEntrega = db.Column(db.Time)
    Calificacin = db.Column(db.Numeric)

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idPersonaLecciones'], ['CCG_ReporteMateria.idPersonaMateria'])
    )


class CCG_LeccionesMateriaSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_LeccionesMateria
