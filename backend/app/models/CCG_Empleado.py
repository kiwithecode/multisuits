from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Empleado(db.Model):
    __tablename__ = 'CCG_Empleado'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    idRol = db.Column(db.String(10))
    FechaInicioOperaciones = db.Column(db.Date)
    FechaFinOperaciones = db.Column(db.Date)
    Estado = db.Column(db.String(30))
    idPersona = db.Column(db.String(10))

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idPersona'], ['CCG_Persona.id']),
        db.ForeignKeyConstraint(['idRol'], ['CCG_Rol.id'])
    )


class CCG_EmpleadoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Empleado
