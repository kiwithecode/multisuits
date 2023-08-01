from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Contacto(db.Model):
    __tablename__ = 'CCG_Contacto'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    Tipo = db.Column(db.String(30))


class CCG_ContactoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Contacto
