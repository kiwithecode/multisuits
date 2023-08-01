import 'package:flutter/material.dart';

class CampusView extends StatefulWidget {
  const CampusView({Key, key}) : super(key: key);

  @override
  _CampusViewState createState() => _CampusViewState();
}

class _CampusViewState extends State<CampusView> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                children: [
                  Image.network(
                    "https://darrylburling.com/wp-content/uploads/2017/04/cross.png",
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Campus Monte Sinai",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.black, // Cambiar el color del texto a negro
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (isExpanded) ...[
              Image.network(
                "https://darrylburling.com/wp-content/uploads/2017/04/cross.png",
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dirección:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cambiar el color del texto a negro
                    ),
                  ),
                  Text("Av. Francisco de Orellana",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,)),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Horarios:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cambiar el color del texto a negro
                    ),
                  ),
                  Text("Lunes a Viernes 8:00 - 17:00",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,)),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contacto:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cambiar el color del texto a negro
                    ),
                  ),
                  Text("099 999 9999",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,)),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cultos - Domingos:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cambiar el color del texto a negro
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("08:00 - 10:00",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,)),
                      Text("10:00 - 12:00",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,)),
                      Text("10:00 - 12:00",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,)),
                      
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CampusSearch extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != '');
    final ThemeData theme = Theme.of(context).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
        fillColor: Color.fromARGB(255, 0, 0, 0),
      ),
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black, // Cambiar el color del texto del campo de búsqueda a negro
        ),
      ),
    );
    assert(theme != "");
    return theme.copyWith(
      primaryColor: const Color.fromARGB(255, 0, 0, 0),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your results page here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement your suggestions page here
    return Container();
  }
}
