from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Rol(db.Model):
    __tablename__ = 'CCG_Rol'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    Codigo = db.Column(db.String(10))
    Descripcion = db.Column(db.String(30))
    Estado = db.Column(db.String(30))


class CCG_RolSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Rol
