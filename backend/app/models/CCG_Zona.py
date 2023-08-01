from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Zona(db.Model):
    __tablename__ = 'CCG_Zona'
    __table_args__ = {'schema': 'CCG.dbo'}

    idZona = db.Column(db.String(10), primary_key=True)
    Descripcion = db.Column(db.String(50))
    Codigo = db.Column(db.String(10))


class CCG_ZonaSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Zona
