import 'package:assouka_publique/page/restaurant/evenementiel/diche.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class SelectionMetsGEntree extends StatefulWidget {
  @override
  _SelectionMetsGEntreeState createState() => _SelectionMetsGEntreeState();
}

class _SelectionMetsGEntreeState extends State<SelectionMetsGEntree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        //    title: Text("", style: TextStyle(color: Couleurs.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gold -> Entrée", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Veuillez choisir quelques entrées", style: TextStyle(fontSize: 17),),
            ),
            CustomCheckBoxGroup(
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: [
                "Acajou",
                "Acajou",
                "Acajou",
                "Acajou",
                "Acajou",
                "Acajou",
                "Acajou",
                "Acajou",
                "Acajou",
                "Acajou",
              ],
              buttonValuesList: [
                "Air conditionné",
                "Airbag",
                "Radio",
                "Bluetooth",
                "Direction assistée",
                "siège enfant",
                "GPS",
                "Pneus secours",
                "Acajou2",
                "Acajou3",
              ],
              checkBoxButtonValues: (values) {
                print(values);
              },
              defaultSelected: ["Monday"],
              horizontal: true,
              width: 120,
              // hight: 50,
              selectedColor: Theme.of(context).colorScheme.secondary,
              padding: 5,
              spacing: 0.0,
              // enableShape: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Couleurs.buttonPageRetaurantColors,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)
                      )
                  ),
                  onPressed: (){

                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child:  PupupDiche()),
                    );

                    /*
                     var route = MaterialPageRoute(
                         builder: (BuildContext context) =>
                             DetailsEvennement());
                     Navigator.of(context).push(route);*/
                  },
                  child: Text("Continuer", style:  TextStyle(color: Colors.black),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
