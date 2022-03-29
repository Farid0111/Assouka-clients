import 'package:assouka_publique/page/restaurant/evenementiel/panierEven.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';

class PupupDiche extends StatefulWidget {
  @override
  _PupupDicheState createState() => _PupupDicheState();
}

class _PupupDicheState extends State<PupupDiche> {
  bool shouldCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Center(child: const Text('Location de diches')),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  CustomCheckBox(
                    value: shouldCheck,
                    shouldShowBorder: true,
                    borderColor: Colors.indigo,
                    checkedFillColor: Colors.indigo,
                    borderRadius: 8,
                    borderWidth: 1,
                    checkBoxSize: 22,
                    onChanged: (val) {
                      //do your stuff here
                      setState(() {
                        shouldCheck = val;
                        print(val);
                      });
                    },
                  ),
                  Container( width: MediaQuery.of(context).size.width/2,
                      child: Text("Voullez vous faire une location de diches ?", style: TextStyle(fontSize: 18),))
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: const Text('Quitter'),
                ),
              ),

              new FlatButton(
                onPressed: () {
                  var route = MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PanierEven());
                  Navigator.of(context).push(route);
                },
                color: Theme.of(context).primaryColor,
                textColor: Colors.white ,
                child: const Text('Continuer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
