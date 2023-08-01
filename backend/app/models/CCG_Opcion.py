from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Opcion(db.Model):
    __tablename__ = 'CCG_Opcion'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    Codigo = db.Column(db.String(10))
    Estado = db.Column(db.String(10))
    Modulo= db.Column(db.String(10))
    descripcion = db.Column(db.String(30))


class CCG_OpcionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Opcion
