
import 'package:assouka_publique/page/partenaire.dart';
import 'package:assouka_publique/page/restaurant/partenariat2.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../creerCatalogue.dart';

class PartRestauration extends StatefulWidget {
  @override
  _PartRestaurationState createState() => _PartRestaurationState();
}

class _PartRestaurationState extends State<PartRestauration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Text(Chaines.partenariat, style: TextStyle(color: Couleurs.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: Container(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("assets/images/Restaurant.jpeg"),
                  ),
                ),
              ),

              champSaisir (label:Chaines.nom_resto ),
              champSaisir (label:Chaines.slogan ),
              champSaisir (label:Chaines.numero_telephone ),
              champSaisir (label:Chaines.rcc ),


        /*      Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width-100,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nom du restaurant',
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width-100,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Slogan',
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width-100,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Numéro de téléphone',
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width-100,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Régistre de commerce',
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),*/



            /*  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 50),
                    child: RaisedButton(
                      onPressed: () {
                        var route = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Partenariat2());
                        Navigator.of(context).push(route);
                      },
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                           30, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              Chaines.suivant,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),*/

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height:  MediaQuery.of(context).size.height * 0.08,),
                    child: ElevatedButton.icon(

                      label: Text( Chaines.suivant, style: TextStyle(color: Couleurs.black),),
                      icon: Icon(Icons.arrow_forward, color: Colors.black,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child:  CreerCatalogue()),
                          //    child:  Partenariat2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Couleurs.buttonPageRetaurantColors,
                      //  primary: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   // Widget Champ de saisi
 Widget champSaisir ({required String label}) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(5),
       // width: MediaQuery.of(context).size.width-100,
       //  height: 60,
        width: MediaQuery.of(context).size.width * 0.8,
        height:  MediaQuery.of(context).size.height * 0.1,

        child: TextFormField(
          decoration: InputDecoration(
            focusColor: Colors.red,
            labelText: label,
            labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(10)),
          ),
        ),
      ),
    );
 }

}
