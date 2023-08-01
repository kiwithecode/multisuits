from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma


class CCG_Hobbies_Pasatiempos(db.Model):
    __tablename__ = 'CCG_Hobbies_Pasatiempos'
    __table_args__ = {'schema': 'CCG.dbo'}

    IdHobbie = db.Column(db.String(10), primary_key=True)
    descripcion = db.Column(db.String(30))


class CCG_Hobbies_PasatiemposSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Hobbies_Pasatiempos
