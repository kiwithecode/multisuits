import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TemplateF extends StatelessWidget {
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
                        'https://res.cloudinary.com/doneqqziy/image/upload/v1686254172/media_library_export-testingdeveloper-2023_06_08_14_48_20/pexels-elina-fairytale-3807571-scaled_tgcrks.jpg'),
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
                      'Familias en CCG',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Fusionados',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    SizedBox(height: 20.0),
                    Center(
                        child: Text(
                            'A través de actividades divertidas, enseñanzas significativas y momentos de conexión, nos enfocamos en nutrir los valores cristianos y fomentar un ambiente de amor y apoyo mutuo. Ya sea que estés buscando recursos para la crianza de tus hijos, consejos para fortalecer tu matrimonio o simplemente deseas compartir momentos especiales con otras familias, estamos aquí para ti.',
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
                'https://res.cloudinary.com/doneqqziy/image/upload/v1686254172/media_library_export-testingdeveloper-2023_06_08_14_48_20/pexels-ketut-subiyanto-4544901-scaled_k7jksr.jpg',
                'https://res.cloudinary.com/doneqqziy/image/upload/v1686254174/media_library_export-testingdeveloper-2023_06_08_14_48_20/sfasfd_btmwck.jpg',
                'https://res.cloudinary.com/doneqqziy/image/upload/v1686254166/media_library_export-testingdeveloper-2023_06_08_14_48_20/dadas-scaled_vzkkg9.jpg'
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
                          '¡Explora, Conéctate y Diviértete con la Tribu Juvenil en CCG!',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: Text(
                          'Completa nuestro formulario de contacto y forma parte de la gran familia. Estamos aquí para responder todas tus preguntas, recibir tus sugerencias y brindarte toda la información que necesitas.',
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Edad',
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0), // Espacio entre los campos
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Ciudad',
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Campos de email y teléfono en la misma fila
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
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
