import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:justify/widgets/ListeHorizontal.dart';
import 'package:justify/stylePalette.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'justify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(text: '''Meine\nEinkaufsliste'''),
    );
  }
}

class HomePage extends StatefulWidget {
  final String text;

  HomePage({@required this.text});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, bool> obstgemuese = {};
  Map<String, bool> brotaufstrich = {};
  Map<String, bool> tiefkuehl = {};
  Map<String, bool> getraenke = {};

  int alleElemente() {
    return obstgemuese.length +
        brotaufstrich.length +
        tiefkuehl.length +
        getraenke.length;
  }

  @override
  Widget build(BuildContext context) {
    var elemente = alleElemente();
    return Scaffold(
      body: Stack(
        children: [
          //Round List Elements

          Scrollbar(
            isAlwaysShown: true,
            thickness: 10.0,
            radius: Radius.circular(12),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 210.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//OBST UND GEMÜSE LISTE HPRIZONTAL
                    ListeHorizontal(
                      listenGenre: obstgemuese,
                      listenName: 'Obst und Gemüse',
                    ),
                    //if

                    ListeHorizontal(
                      listenGenre: brotaufstrich,
                      listenName: 'Brot und Aufstrich',
                    ),
                    ListeHorizontal(
                      listenGenre: getraenke,
                      listenName: 'Getränke',
                    ),

                    ListeHorizontal(
                      listenGenre: tiefkuehl,
                      listenName: 'TK Ware',
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      spreadRadius: 5.0),
                ]),
          ),

          //Container Top Title color: White SubTitle White
          Container(
            margin: EdgeInsets.only(left: 50.0, top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.text, style: kTopHeadingWhite),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Text(
                        'Elemente: $elemente',
                        style: kSubtitleWhite,
                      ),
                    ),
                    Text(
                      'Preis: $elemente',
                      style: kSubtitleWhite,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
