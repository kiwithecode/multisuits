from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Relacion(db.Model):
    __tablename__ = 'CCG_Relacion'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    Descripcion = db.Column(db.String(30))


class CCG_RelacionSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Relacion
