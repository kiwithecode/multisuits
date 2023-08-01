from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Area_vol(db.Model):
    __tablename__ = 'CCG_Area_vol'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    Descripcion = db.Column(db.String(50))
    Estado = db.Column(db.String(10))


class CCG_Area_volSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Area_vol