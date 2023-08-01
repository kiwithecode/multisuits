from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
from app.models.CCG_Rol import CCG_Rol
from app.models.CCG_Parametro import CCG_Parametro


class CCG_RolOpcionPar(db.Model):
    __tablename__ = 'CCG_RolOpcionPar'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    idRol = db.Column(db.Integer,  db.ForeignKey(CCG_Rol.id))
    idPar = db.Column(db.Integer,  db.ForeignKey(CCG_Parametro.id))
    Estado = db.Column(db.String(1))


class CCG_RolOpcionParSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_RolOpcionPar
