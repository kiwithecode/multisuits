from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_DetalleRecaudaciones(db.Model):
    __tablename__ = 'CCG_DetalleRecaudaciones'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    Tipo = db.Column(db.String(10))
    FechaPago = db.Column(db.Date)
    MetodoPago = db.Column(db.String(10))
    Monto = db.Column(db.Numeric)
    idPersona = db.Column(db.String(10))
    Canal = db.Column(db.String(30))
    idEvento = db.Column(db.String(10))
    Descripción = db.Column(db.String(30))

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idPersona'], ['CCG_Persona.id']),
        db.ForeignKeyConstraint(['idEvento'], ['CCG_Evento.id']),
        db.ForeignKeyConstraint(['Tipo'], ['CCG_Tipo.Id'])
    )


class CCG_DetalleRecaudacionesSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_DetalleRecaudaciones
