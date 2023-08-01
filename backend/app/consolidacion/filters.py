from app.models.CCG_Persona import CCG_Persona, CCG_PersonaSchema
from app.models.CCG_Hobbies_Pasatiempos import CCG_Hobbies_Pasatiempos, CCG_Hobbies_PasatiemposSchema
from app.models.CCG_Consolidacion import CCG_Consolidacion, CCG_ConsolidacionSchema
from app.models.CCG_bitacora_consolidacion import CCG_bitacora_consolidacion
from app.models.CCG_Persona_Contacto import CCG_Persona_Contacto, CCG_Persona_ContactoSchema
from app.models.CCG_Contacto import CCG_Contacto,CCG_ContactoSchema
from app.models.CCG_Ministerio import CCG_Ministerio, CCG_MinisterioSchema
from app.models.CCG_Grupo import CCG_Grupo, CCG_GrupoSchema
from app.models.CCG_Persona_Grupo import CCG_Persona_Grupo, CCG_Persona_GrupoSchema
from app.models.CCG_Persona_Relacion import CCG_Persona_Relacion,CCG_Persona_RelacionSchema
from app.models.CCG_Relacion import CCG_Relacion,CCG_RelacionSchema


from flask import jsonify, request
from flask_cors import cross_origin
from app.consolidacion import bp
from app.extensions import db
from sqlalchemy import text
import base64
from flask_jwt_extended import jwt_required
from datetime import date
from sqlalchemy import or_

