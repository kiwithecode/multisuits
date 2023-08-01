// To parse this JSON data, do
//
//     final personaByCed = personaByCedFromJson(jsonString);

import 'dart:convert';

PersonaByCed personaByCedFromJson(String str) => PersonaByCed.fromJson(json.decode(str));

String personaByCedToJson(PersonaByCed data) => json.encode(data.toJson());

class PersonaByCed {
    String apellidos;
    bool consolidacion;
    bool esAlumno;
    bool esEmpleado;
    bool esFacilitador;
    bool esUsuario;
    bool esVoluntario;
    String estadoCivil;
    DateTime fechaIngresoRegistro;
    DateTime fechaNac;
    bool fidelidadAportaciones;
    String hobbiesPersona;
    int id;
    String identificacion;
    String nombres;
    String sexo;
    String tipoIdentificacion;
    String zona;
    List<Contacto> contactos;
    String direccion;
    bool esBautizado;
    bool esLider;
    List<Familiare> familiares;
    DateTime fechaBautizo;
    DateTime FechaModificacion;
    dynamic foto;
    String lider;
    dynamic lugarDeTrabajo;
    String ministerio;
    bool perteneceGrupoFamiliar;
    dynamic profesion;
    String UsuarioModifica;

    PersonaByCed({
        required this.apellidos,
        required this.consolidacion,
        required this.esAlumno,
        required this.esEmpleado,
        required this.esFacilitador,
        required this.esUsuario,
        required this.esVoluntario,
        required this.estadoCivil,
        required this.fechaIngresoRegistro,
        required this.fechaNac,
        required this.fidelidadAportaciones,
        required this.hobbiesPersona,
        required this.id,
        required this.identificacion,
        required this.nombres,
        required this.sexo,
        required this.tipoIdentificacion,
        required this.zona,
        required this.contactos,
        required this.direccion,
        required this.esBautizado,
        required this.esLider,
        required this.familiares,
        required this.fechaBautizo,
        required this.FechaModificacion,
        required this.foto,
        required this.lider,
        required this.lugarDeTrabajo,
        required this.ministerio,
        required this.perteneceGrupoFamiliar,
        required this.profesion,
        required this.UsuarioModifica,
    });

    factory PersonaByCed.fromJson(Map<String, dynamic> json) => PersonaByCed(
        apellidos: json["Apellidos"],
        consolidacion: json["Consolidacion"],
        esAlumno: json["EsAlumno"],
        esEmpleado: json["EsEmpleado"],
        esFacilitador: json["EsFacilitador"],
        esUsuario: json["EsUsuario"],
        esVoluntario: json["EsVoluntario"],
        estadoCivil: json["EstadoCivil"],
        fechaIngresoRegistro: DateTime.parse(json["Fecha_Ingreso_Registro"]),
        fechaNac: DateTime.parse(json["Fecha_Nac"]),
        fidelidadAportaciones: json["Fidelidad_Aportaciones"],
        hobbiesPersona: json["HobbiesPersona"],
        id: json["ID"],
        identificacion: json["Identificacion"],
        nombres: json["Nombres"],
        sexo: json["Sexo"],
        tipoIdentificacion: json["Tipo_Identificacion"],
        zona: json["Zona"],
        contactos: List<Contacto>.from(json["contactos"].map((x) => Contacto.fromJson(x))),
        direccion: json["direccion"],
        esBautizado: json["esBautizado"],
        esLider: json["esLider"],
        familiares: List<Familiare>.from(json["familiares"].map((x) => Familiare.fromJson(x))),
        fechaBautizo: DateTime.parse(json["fechaBautizo"]),
        FechaModificacion: DateTime.parse(json["FechaModificacion"]),
        foto: json["foto"],
        lider: json["lider"],
        lugarDeTrabajo: json["lugar_de_trabajo"],
        ministerio: json["ministerio"],
        perteneceGrupoFamiliar: json["perteneceGrupoFamiliar"],
        profesion: json["profesion"],
        UsuarioModifica: json["UsuarioModifica"],
    );

    Map<String, dynamic> toJson() => {
        "Apellidos": apellidos,
        "Consolidacion": consolidacion,
        "EsAlumno": esAlumno,
        "EsEmpleado": esEmpleado,
        "EsFacilitador": esFacilitador,
        "EsUsuario": esUsuario,
        "EsVoluntario": esVoluntario,
        "EstadoCivil": estadoCivil,
        "Fecha_Ingreso_Registro": fechaIngresoRegistro.toIso8601String(),
        "Fecha_Nac": "${fechaNac.year.toString().padLeft(4, '0')}-${fechaNac.month.toString().padLeft(2, '0')}-${fechaNac.day.toString().padLeft(2, '0')}",
        "Fidelidad_Aportaciones": fidelidadAportaciones,
        "HobbiesPersona": hobbiesPersona,
        "ID": id,
        "Identificacion": identificacion,
        "Nombres": nombres,
        "Sexo": sexo,
        "Tipo_Identificacion": tipoIdentificacion,
        "Zona": zona,
        "contactos": List<dynamic>.from(contactos.map((x) => x.toJson())),
        "direccion": direccion,
        "esBautizado": esBautizado,
        "esLider": esLider,
        "familiares": List<dynamic>.from(familiares.map((x) => x.toJson())),
        "fechaBautizo": "${fechaBautizo.year.toString().padLeft(4, '0')}-${fechaBautizo.month.toString().padLeft(2, '0')}-${fechaBautizo.day.toString().padLeft(2, '0')}",
        "FechaModificacion": "${FechaModificacion.year.toString().padLeft(4, '0')}-${FechaModificacion.month.toString().padLeft(2, '0')}-${FechaModificacion.day.toString().padLeft(2, '0')}",
        "foto": foto,
        "lider": lider,
        "lugar_de_trabajo": lugarDeTrabajo,
        "ministerio": ministerio,
        "perteneceGrupoFamiliar": perteneceGrupoFamiliar,
        "profesion": profesion,
        "UsuarioModifica": UsuarioModifica,
    };
}

class Contacto {
    String estado;
    DateTime fechaRegistro;
    String valor;
    String contactoTipo;
    int id;

    Contacto({
        required this.estado,
        required this.fechaRegistro,
        required this.valor,
        required this.contactoTipo,
        required this.id,
    });

    factory Contacto.fromJson(Map<String, dynamic> json) => Contacto(
        estado: json["Estado"],
        fechaRegistro: DateTime.parse(json["Fecha_registro"]),
        valor: json["Valor"],
        contactoTipo: json["contacto_tipo"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "Estado": estado,
        "Fecha_registro": "${fechaRegistro.year.toString().padLeft(4, '0')}-${fechaRegistro.month.toString().padLeft(2, '0')}-${fechaRegistro.day.toString().padLeft(2, '0')}",
        "Valor": valor,
        "contacto_tipo": contactoTipo,
        "id": id,
    };
}

class Familiare {
    String apellidos;
    String nombres;
    int idPersona;
    String tipoRelacion;

    Familiare({
        required this.apellidos,
        required this.nombres,
        required this.idPersona,
        required this.tipoRelacion,
    });

    factory Familiare.fromJson(Map<String, dynamic> json) => Familiare(
        apellidos: json["Apellidos"],
        nombres: json["Nombres"],
        idPersona: json["id Persona"],
        tipoRelacion: json["tipo relacion"],
    );

    Map<String, dynamic> toJson() => {
        "Apellidos": apellidos,
        "Nombres": nombres,
        "id Persona": idPersona,
        "tipo relacion": tipoRelacion,
    };
}
