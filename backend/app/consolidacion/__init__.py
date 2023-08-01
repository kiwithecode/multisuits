from flask import Blueprint
from flask_cors import CORS

bp = Blueprint('consolidacion', __name__)

cors = CORS(bp,resources={r"/*": {"origins": "*", "headers":["Content-Type"]}})

from app.consolidacion import personas
from app.consolidacion import bitacora
from app.consolidacion import personasCED
from app.consolidacion import addPersona
from app.consolidacion import addFamiliar
from app.consolidacion import usuarios