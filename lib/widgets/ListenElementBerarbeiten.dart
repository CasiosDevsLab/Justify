import 'package:flutter/material.dart';

import '../stylePalette.dart';

class ElementBearbeiten extends StatefulWidget {
  ElementBearbeiten({
    @required this.titelOfElement,
    @required this.changeMap,
    @required this.map,
    Key key,
  }) : super(key: key);

  Map<String, bool> map;
  String titelOfElement;
  final Function() changeMap;

  @override
  _ElementBearbeitenState createState() => _ElementBearbeitenState();
}

class _ElementBearbeitenState extends State<ElementBearbeiten> {
  @override
  Widget build(BuildContext context) {
    String altesElement = widget.titelOfElement;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200.0,
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Container(
          alignment: Alignment.topRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 200,
                child: Flexible(
                  child: Text(
                    widget.titelOfElement,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.right,
                    style: kTopHeadingWhite,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Bearbeite deine Angaben',
                textAlign: TextAlign.right,
                style: kSubtitleWhite,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: altesElement,
                  ),
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      widget.titelOfElement = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.edit_outlined,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          setState(() {
            print(widget.map);
            widget.map[widget.titelOfElement] = false;
            print(widget.map);
            print(widget.map);
            widget.changeMap();
            Navigator.pop(context);
          });
        },
        backgroundColor: Colors.greenAccent[400],
      ),
    );
  }
}
