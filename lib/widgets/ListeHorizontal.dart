import 'package:flutter/material.dart';
import 'ListenElement.dart';
import '../stylePalette.dart';
import 'EingabeNeuesElement.dart';

class ListeHorizontal extends StatefulWidget {
  ListeHorizontal({
    @required this.listenName,
    Key key,
    @required this.listenGenre,
  }) : super(key: key);

  Map<String, bool> listenGenre;
  final String listenName;

  @override
  _ListeHorizontalState createState() => _ListeHorizontalState();
}

class _ListeHorizontalState extends State<ListeHorizontal> {
  @override
  Widget build(BuildContext context) {
    refresh() {
      setState(() {});
    }

    int anzahlgesamt = widget.listenGenre.length;

    int checkSelected(int anzahl) {
      anzahl = 0;
      widget.listenGenre.forEach((key, value) {
        (value == true) ? ++anzahl : anzahl = anzahl;
        print(anzahl);
        refresh();
      });
      return anzahl;
    }

    int anzahl = checkSelected(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.listenName, style: kSubtitleGrey),
                  Text(
                    "$anzahl / $anzahlgesamt",
                  ),
                ],
              )),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        ),
        Container(
          height: 180.0,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20.0),
          child: (widget.listenGenre.length > 0)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.listenGenre.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = widget.listenGenre.keys.elementAt(index);
                    return new ListenElement(
                      notifyParent: refresh,
                      titleOfListe: widget.listenName,
                      titleOfElement: key,
                      listenElemente: widget.listenGenre,
                    );
                  })
              : Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60.0),
                    child: Text(
                      'Du hast noch nichts für ${widget.listenName} auf deiner Liste',
                      style: kSubtitleGrey,
                    ),
                  ),
                ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.all(10.0),
          // ignore: missing_required_param
          child: OutlineButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EingabeNeuesElement(
                          notifyParent: refresh,
                          listenGenre: widget.listenName,
                          liste: widget.listenGenre)));
            },
            highlightColor: Colors.greenAccent[400],
            splashColor: Colors.greenAccent[400],
            textColor: Colors.black,
            highlightElevation: null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.black,
            ),
            child: Text('hinzufügen'),
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
