from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Tipo(db.Model):
    __tablename__ = 'CCG_Tipo'
    __table_args__ = {'schema': 'CCG.dbo'}

    Id = db.Column(db.String(10), primary_key=True)
    Descipcion = db.Column(db.String(30))


class CCG_TipoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Tipo
