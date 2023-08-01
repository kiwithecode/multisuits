from app.extensions import db, PrimaryKeyConstraint
from app.extensions import ma
import base64

class CCG_Persona(db.Model):
    __tablename__ = 'CCG_Persona'
    __table_args__ = {'schema': 'CCG.dbo'}

    id = db.Column(db.Integer, primary_key=True)
    Identificacion = db.Column(db.String(16))
    Tipo_Identificacion = db.Column(db.String(20))
    Fecha_Nac = db.Column(db.Date)
    Nombres = db.Column(db.String(50))
    Apellidos = db.Column(db.String(50))
    Sexo = db.Column(db.String(1))
    EstadoCivil = db.Column(db.String(10))
    EsVoluntario = db.Column(db.Boolean)
    EsEmpleado = db.Column(db.Boolean)
    EsAlumno = db.Column(db.Boolean)
    EsUsuario = db.Column(db.Boolean)
    EsFacilitador = db.Column(db.Boolean)
    HobbiesPersona = db.Column(db.String(10))
    Zona = db.Column(db.String(20))
    Fecha_Ingreso_Registro = db.Column(db.Date)
    Consolidacion = db.Column(db.Boolean)
    Fidelidad_Aportaciones = db.Column(db.Boolean)
    Foto = db.Column(db.LargeBinary)
    EsBautizado = db.Column(db.Boolean)
    PerteneceGrupoFamiliar = db.Column(db.Boolean)
    EsLider = db.Column(db.Boolean)
    UsuarioModifica = db.Column(db.String(10))
    FechaModificacion = db.Column(db.Date)
    Dir_Domicilio = db.Column(db.String(60))
    profesion = db.Column(db.String(30))
    Dir_Trabajo = db.Column(db.String(30))
    FechaBautizo = db.Column(db.Date)
    Tel_Trabajo = db.Column(db.String(10))
    Tel_Domicilio = db.Column(db.String(10))
    Correo_Trabajo = db.Column(db.String(10))
    Correo_Personal = db.Column(db.String(10))
    Cel_Personal = db.Column(db.String(10))
    Cel_Trabajo = db.Column(db.String(10))


class CCG_PersonaSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = CCG_Persona

    Foto = ma.Method("get_Foto")

    def get_Foto(self, obj):
        if obj.Foto:
            return base64.b64encode(obj.Foto).decode("utf-8")
        return None

