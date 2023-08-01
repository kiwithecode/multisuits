from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Evento(db.Model):
    __tablename__ = 'CCG_Evento'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    NombreEvento = db.Column(db.String(30))
    Tipo = db.Column(db.String(30))
    FechaInicio = db.Column(db.Date)
    FechaFin = db.Column(db.Date)
    Hora = db.Column(db.Time)
    Lugar = db.Column(db.String(10))
    Encargado = db.Column(db.String(10))
    NumeroAsistentes = db.Column(db.Integer)
    Descripcion = db.Column(db.String(50))
    idCampus = db.Column(db.String(10))

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['Encargado'], ['CCG_Persona.id']),
        db.ForeignKeyConstraint(['Lugar'], ['CCG_Campus.idCampus'])
    )


class CCG_EventoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Evento
