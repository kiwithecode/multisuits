from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Opcion



class CCG_Parametro(db.Model):
    __tablename__ = 'CCG_Parametro'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    idPadre = db.Column(db.Integer , db.ForeignKey(CCG_Opcion.CCG_Opcion.id))
    codigo = db.Column(db.String(10))
    descripcion = db.Column(db.String(50))
    estado = db.Column(db.String(1))



class CCG_ParametroSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Parametro
