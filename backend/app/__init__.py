
from flask import Flask, jsonify

from app.config import Config

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    from app.extensions import db
    db.init_app(app)

    from app.extensions import ma
    ma.init_app(app)

    from app.extensions import cors
    cors.init_app(app,resources={r"/*": {"origins": "*", "headers":["Content-Type", "Authorization"]}})

    from app.extensions import jwt
    jwt.init_app(app)

    from app.consolidacion import bp as consolidacion_bp
    app.register_blueprint(consolidacion_bp, url_prefix='/consolidacion')

    from app.login import bp as login_bp
    app.register_blueprint(login_bp, url_prefix='/login')

    from app.perfiles import bp as perfiles_bp
    app.register_blueprint(perfiles_bp, url_prefix='/perfiles')

    from app.menu import bp as menu_bp
    app.register_blueprint(menu_bp, url_prefix='/menu')
    

    @app.route('/')
    def index():
        endpoints = []
        for rule in app.url_map.iter_rules():
            endpoints.append(str(rule))
        return jsonify(endpoints=endpoints)
    
    return app