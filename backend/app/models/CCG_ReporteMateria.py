from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_ReporteMateria(db.Model):
    __tablename__ = 'CCG_ReporteMateria'
    __table_args__ = {'schema': 'CCG.dbo'}

    idPersonaMateria = db.Column(db.String(10), primary_key=True)
    Asistencia = db.Column(db.Boolean)
    Deberes = db.Column(db.String(10))
    Lecciones = db.Column(db.String(10))
    Examen = db.Column(db.Numeric)
    Estado = db.Column(db.String(30))

    __table_args__ = (
        PrimaryKeyConstraint('idPersonaMateria'),
        db.ForeignKeyConstraint(['idPersonaMateria'], ['CCG_PersonaMateria.id'])
    )


class CCG_ReporteMateriaSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_ReporteMateria
