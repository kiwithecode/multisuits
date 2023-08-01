import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TemplateRenace extends StatefulWidget {
  @override
  _TemplateRenaceState createState() => _TemplateRenaceState();
}

class _TemplateRenaceState extends State<TemplateRenace> {
  String? _estadoCivil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Banner trapezoide con slider interno
            ClipPath(
              clipper: TrapezoidClipper(),
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://res.cloudinary.com/doneqqziy/image/upload/v1686254160/media_library_export-testingdeveloper-2023_06_08_14_48_20/averi-scaled_ijxhnz.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Separación
            SizedBox(height: 20.0),
            // Fondo negro con título y subtítulo
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Renace',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Todas las cosas son hechas nuevas.',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    SizedBox(height: 20.0),
                    Center(
                        child: Text(
                            'En Dios todas las cosas son hechas nuevas',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11.0),
                            textAlign: TextAlign.center)),
                             Center(
                        child: Text(
                            'Ven y vive la experiencia para renovar tu cuerpo, tu alma y tu espíritu. Un nuevo inicio y una nueva oportunidad esperan por ti.',
                            style:
                                TextStyle(color: Colors.white, fontSize: 11.0),
                            textAlign: TextAlign.center))
                  ],
                ),
              ),
            ),
            // Separación
            SizedBox(height: 20.0),
            // Carrusel de imágenes
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [
                'https://res.cloudinary.com/doneqqziy/image/upload/v1686254173/media_library_export-testingdeveloper-2023_06_08_14_48_20/respiando-scaled_rf8ids.jpg',
                'https://res.cloudinary.com/doneqqziy/image/upload/v1686254172/media_library_export-testingdeveloper-2023_06_08_14_48_20/pexels-askar-abayev-5638602-scaled_t2lotn.jpg',
                // agrega más urls de imagenes aquí
              ].map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit
                              .cover, // puedes cambiar esto a tu ajuste preferido
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Center(
                      child: Text(
                          'Vuelve a creer.',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: Text(
                          'Separa tu cupo y empieza a vivir lo nuevo que Dios tiene para ti',
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                          textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
            ),
            // Separación
            SizedBox(height: 20.0),
            // Formulario
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    // Campos de nombre y apellido en la misma fila
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Cédula',
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0), // Espacio entre los campos
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0), // Espacio entre los campos
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Apellido',
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Campos de email y teléfono en la misma fila
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Estado Civil',
                            ),
                            value: _estadoCivil,
                            items: <String>['Casado', 'Soltero', 'Divorciado', 'Viudo', 'Otro'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _estadoCivil = newValue;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.0), // Espacio entre los campos
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Teléfono',
                            ),
                          ),
                        ),
                      ],
                    ),

                    // ... más campos
                    CheckboxListTile(
                      title: Text("Acepto términos y condiciones"),
                      value: true, // Deberías manejar este valor con un estado
                      onChanged: (newValue) {
                        // Actualizar el estado
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar el botón
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(
                            255, 255, 255, 255), // background
                        onPrimary:
                            const Color.fromARGB(255, 0, 0, 0), // foreground
                      ),
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
