import 'package:flutter/material.dart';
import '../stylePalette.dart';

class EingabeNeuesElement extends StatefulWidget {
  final Function() notifyParent;
  EingabeNeuesElement({
    this.listenGenre,
    @required this.liste,
    @required this.notifyParent,
    Key key,
  }) : super(key: key);

  final String listenGenre;
  Map<String, bool> liste;

  @override
  _EingabeNeuesElementState createState() => _EingabeNeuesElementState();
}

class _EingabeNeuesElementState extends State<EingabeNeuesElement> {
  @override
  Widget build(BuildContext context) {
    String produktEingabe = "";
    int selectedEinheit = 1;
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
                    '${widget.listenGenre}',
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
                'Füge Produkte zu deiner\nEinkaufsliste hinzu',
                textAlign: TextAlign.right,
                style: kSubtitleWhite,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 50),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onChanged: (text) => produktEingabe = text,
                        decoration: InputDecoration(
                          labelText: 'Produkt',
                          labelStyle: kSubtitleGrey,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          width: 100.0,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            decoration: InputDecoration(
                              labelText: 'Menge',
                              labelStyle: kSubtitleGrey,
                            ),
                          ),
                        ),
                        Container(
                          child: DropdownButton(
                            onChanged: (value) {
                              setState(() {
                                selectedEinheit = value;
                              });
                            },
                            value: selectedEinheit,
                            items: [
                              DropdownMenuItem(
                                child: Text('Stk'),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text('g'),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text('Kg'),
                                value: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100.0,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextField(
                        keyboardAppearance: Brightness.dark,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Schätzpreis',
                          labelStyle: kSubtitleGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, size: 30.0, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 35),
        backgroundColor: Colors.greenAccent[400],
        onPressed: () =>
            (produktEingabe == '' || widget.liste.containsKey(produktEingabe)
                ? {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => _popUpInfo(context))
                  }
                : {
                    widget.liste[produktEingabe] = false,
                    widget.notifyParent(),
                    Navigator.pop(context),
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            '$produktEingabe wurde zu "${widget.listenGenre}" hinzugefügt'),
                      ),
                    )
                  }),
      ),
    );
  }
}

//pop Up Widget
Widget _popUpInfo(BuildContext context) {
  return new AlertDialog(
    title: const Text(
      'Ups! Da ist etwas schiefgelaufen',
    ),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Du hast das Produkt bereits in deiner Einkaufsliste'),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(15.0),
          child: IconButton(
            icon: Icon(Icons.check, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        )
      ],
    ),
  );
}
