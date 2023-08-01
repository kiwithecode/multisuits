import 'package:flutter/material.dart';
import '../components/cards/CustomMusicCard.dart';

class MusicaView extends StatefulWidget {
  const MusicaView({super.key});

  @override
  _MusicaViewState createState() => _MusicaViewState();
}

class _MusicaViewState extends State<MusicaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildListDelegate(
              [
                const CustomMusicCard(),
                const CustomMusicCard(),
                const CustomMusicCard(),
                const CustomMusicCard(),
                const CustomMusicCard(),
                const CustomMusicCard(),
                const CustomMusicCard(),
                const CustomMusicCard(),
                const CustomMusicCard(),
              ]
            )
          )
        ],
      ),
    );
  }
}

class MusicSearch extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != "");
    final ThemeData theme = Theme.of(context).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), 
        fillColor: Colors.white,
      ),
    );
    assert(theme != "");
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: const Color.fromARGB(255, 255, 255, 255)),
      
      primaryTextTheme: theme.textTheme,
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
