from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Aplicaciones(db.Model):
    __tablename__ = 'CCG_Aplicaciones'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    codigo = db.Column(db.String(50))
    descripcion = db.Column(db.String(30))
    estado = db.Column(db.String(1))

class CCG_AplicacionesSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Aplicaciones
