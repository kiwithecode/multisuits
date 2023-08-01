from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Método_pago(db.Model):
    __tablename__ = 'CCG_Método_pago'
    __table_args__ = {'schema': 'CCG.dbo'}

    MetodoId = db.Column(db.String(10), primary_key=True)
    Descripcion = db.Column(db.String(30))


class CCG_Método_pagoSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Método_pago
