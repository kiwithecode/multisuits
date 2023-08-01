from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Voluntario_evento(db.Model):
    __tablename__ = 'CCG_Voluntario_evento'
    __table_args__ = {'schema': 'CCG.dbo'}

    idVoluntario = db.Column(db.String(10), primary_key=True)
    idEvento = db.Column(db.String(10), primary_key=True)

    __table_args__ = (
        PrimaryKeyConstraint('id'),
        db.ForeignKeyConstraint(['idVoluntario'], ['CCG_Voluntariado.id']),
        db.ForeignKeyConstraint(['idEvento'], ['CCG_Evento.id']),

    )


class CCG_Voluntari0_eventoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Voluntario_evento