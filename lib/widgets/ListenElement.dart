import 'package:flutter/material.dart';

import '../stylePalette.dart';
import 'ListenElementBerarbeiten.dart';

class ListenElement extends StatefulWidget {
  ListenElement({
    @required this.notifyParent,
    @required this.titleOfElement,
    @required this.titleOfListe,
    @required this.listenElemente,
    Key key,
  }) : super(key: key);

  final Function() notifyParent;
  String titleOfElement;
  String titleOfListe;
  Map<String, bool> listenElemente;

  @override
  _ListenElementState createState() => _ListenElementState();
}

class _ListenElementState extends State<ListenElement> {
  bool selected;
  bool isFavorite;
  int position;
  final List<String> favorite = [];

  @override
  Widget build(BuildContext context) {
    if (selected == null) {
      selected = false;
    }
    if (isFavorite == null) {
      isFavorite = false;
    }

    refresh() {
      setState(() {});
    }

    String produktName;
    String listenName;

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
      height: 160.0,
      width: 160.0,
      decoration: BoxDecoration(
        color: selected ? Colors.grey : Colors.white,
        border: Border.all(
            color: selected ? Colors.black.withOpacity(0.5) : Colors.white),
        boxShadow: [
          BoxShadow(color: Colors.black38, blurRadius: 10.0, spreadRadius: 1.0),
        ],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selected = !selected;
                    widget.listenElemente[widget.titleOfElement] = selected;
                    print(widget.listenElemente);
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (selected)
                            ? Colors.greenAccent[400]
                            : Colors.amber.withOpacity(0.5),
                        border: Border.all(width: 1, color: Colors.black))),
              ),

              //Produkt

              IconButton(
                  icon: Icon(Icons.more_vert_outlined),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ElementBearbeiten(
                                titelOfElement: widget.titleOfElement,
                                map: widget.listenElemente,
                                changeMap: refresh)));
                  }),
            ],
          ),
          Center(
            child: Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                alignment: Alignment.center,
                child: Flexible(
                  child: Text(
                    widget.titleOfElement,
                    style: kTitleListenElement,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          //löschen

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  icon: Icon(Icons.star),
                  color: (isFavorite) ? Colors.amber : Colors.grey,
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                      if (isFavorite &&
                          !favorite.contains(widget.titleOfElement)) {
                        favorite.add(widget.titleOfElement);
                      } else {
                        favorite.remove(widget.titleOfElement);
                      }
                      print(favorite);
                    });
                  },
                ),
              ),
              Container(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        produktName = widget.titleOfElement;
                        listenName = widget.titleOfListe;
                        elementloeschen();
                        widget.notifyParent();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '$produktName wurde aus "$listenName" entfernt'),
                        ),
                      );
                    },
                    child: Text(
                      'löschen',
                      style: kSubTitleListenElement,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void elementloeschen() {
    setState(() {
      widget.listenElemente.remove(widget.titleOfElement);
    });
  }
}
