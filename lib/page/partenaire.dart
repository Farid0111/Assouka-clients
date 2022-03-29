
import 'package:assouka_publique/page/page_default_non_disponible.dart';
import 'package:assouka_publique/page/restaurant/partRestauration.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Partenaire extends StatefulWidget {
  @override
  _PartenaireState createState() => _PartenaireState();
}

class _PartenaireState extends State<Partenaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),

       // title: Text(Chaines.devenir_partenaire, style: TextStyle(color:  Couleurs.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),


      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            /*
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:   FlatButton(onPressed: (){
                  var route = MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PartRestauration());
                  Navigator.of(context).push(route);
                }, child: Text("Restauration", style: TextStyle(fontSize: 18),), color: Colors.green[300], minWidth: 250,height: 57,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:   FlatButton(onPressed: (){}, child: Text("Epicerie", style: TextStyle(fontSize: 18),), color: Colors.green[300], minWidth: 250,height: 57,),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:   FlatButton(onPressed: (){}, child: Text("Décoration", style: TextStyle(fontSize: 18),), color: Colors.green[300], minWidth: 250,height: 57,),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:   FlatButton(onPressed: (){}, child: Text("Mode", style: TextStyle(fontSize: 18),), color: Colors.green[300], minWidth: 250,height: 57,),
              ),
              */


           Padding(padding: const EdgeInsets.all(10.0),child:
             Text(Chaines.devenir_partenaire,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color:  Couleurs.black),),),

              // Resto
              partenariatButton(indix: 1, nameRestaurant: Chaines.resto),

              // Epicerie
              partenariatButton(indix: 2, nameRestaurant: Chaines.epicerie),

              // Decoration
              partenariatButton(indix: 3, nameRestaurant: Chaines.decoration),

              // Mode
              partenariatButton(indix: 4, nameRestaurant: Chaines.mode),

            ],
          ),
        ),
      ),
    );


  }


  // Widget Button
  Widget partenariatButton ({required int indix, required String nameRestaurant}){

    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.6,
          height:  MediaQuery.of(context).size.height * 0.08,),

        child: ElevatedButton(

          onPressed: (){

            // Restaurant
            if (indix == 1)
            {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  PartRestauration()),
              );
            }
            // Mode //  Epicerie // Decoration
            else {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  PageNonDisponible()),
              );
            }



          },

          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              // <-- Radius
            ),
            primary: Couleurs.buttonPageRetaurantColors,



          ),


          child: Text(nameRestaurant, style: TextStyle(color: Couleurs.black),),
          // color:  Couleurs.buttonPageRetaurantColors,
          //  color: Colors.green[300],
          //   minWidth: MediaQuery.of(context).size.width * 0.6,
          //    height: MediaQuery.of(context).size.height * 0.08,





        ),
      ),
    );
  }




}
