from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_DeberesMateria(db.Model):
    __tablename__ = 'CCG_DeberesMateria'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    idPersonaDeberes = db.Column(db.String(10))
    NombreDeber = db.Column(db.String(30))
    FechaEntrega = db.Column(db.Date)
    HoraEntrega = db.Column(db.Time)
    Calificacion = db.Column(db.Numeric)

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idPersonaDeberes'], ['CCG_ReporteMateria.idPersonaMateria'])
    )


class CCG_DeberesMateriaSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_DeberesMateria
