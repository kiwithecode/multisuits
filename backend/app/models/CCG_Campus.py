from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Campus(db.Model):
    __tablename__ = 'CCG_Campus'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.String(10), primary_key=True)
    Direccion = db.Column(db.String(50))
    Nombre = db.Column(db.String(30))


class CCG_CampusSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Campus
