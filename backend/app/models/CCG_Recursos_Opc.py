from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models import CCG_Opcion


class CCG_Recursos_Opc(db.Model):
    __tablename__ = 'CCG_Recursos_Opc'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True, autoincrement = True)
    idOpcion = db.Column(db.Integer, db.ForeignKey(CCG_Opcion.CCG_Opcion.id))
    nombre = db.Column(db.String(100))
    archivo = db.Column(db.LargeBinary)
    tipoArchivo = db.Column(db.String(50))

class CCG_bitacora_Recursos_OpcSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Recursos_Opc
