from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_PersonaEvento(db.Model):
    __tablename__ = 'CCG_PersonaEvento'
    __table_args__ = {'schema': 'CCG.dbo'}

    idPersona = db.Column(db.String(10), primary_key=True)
    idEvento = db.Column(db.String(10), primary_key=True)

    __table_args__ = (
        PrimaryKeyConstraint('idPersona', 'idEvento'),
        db.ForeignKeyConstraint(['idPersona'], ['CCG_Persona.id']),
        db.ForeignKeyConstraint(['idEvento'], ['CCG_Evento.id'])
    )


class CCG_PersonaEventoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_PersonaEvento
