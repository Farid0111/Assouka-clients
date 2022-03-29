import 'package:assouka_publique/page/restaurant/evenementiel/accueilEvenementiel.dart';
import 'package:assouka_publique/page/restaurant/nostal/nostalAccueil.dart';
import 'package:assouka_publique/page/restaurant/express/pagerestoEx.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PageNonDisponible extends StatefulWidget {
  @override
  _PageNonDisponibleState createState() => _PageNonDisponibleState();
}

class _PageNonDisponibleState extends State<PageNonDisponible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0,) ,
      backgroundColor: Couleurs.black,
      body: Center(
       child: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset("assets/logo/assouka_logo.png",height: 1000,),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(Chaines.message_non_diponible,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,),
            ),

          ],
      ),
       )
      )
    );
  }


  // Widget Button
  Widget restaurantButton ({required int indix, required String nameRestaurant}){

    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: MediaQuery.of(context).size.width * 0.6,
            height:  MediaQuery.of(context).size.height * 0.08,),

        child: ElevatedButton(

          onPressed: (){

          // Restaurant Express
          if (indix == 1)
            {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  AccueilEvennementiel()),
              );
            }

          // Restaurant Nostal
          else if (indix == 2)
            {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  AccueilEvennementiel()),
              );
            }

          // Restaurant Event
          else {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child:  AccueilEvennementiel()),
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


          child: Text(nameRestaurant, style: TextStyle(color: Colors.black),),
         // color:  Couleurs.buttonPageRetaurantColors,
          //  color: Colors.green[300],
         //   minWidth: MediaQuery.of(context).size.width * 0.6,
        //    height: MediaQuery.of(context).size.height * 0.08,





        ),
      ),
    );
  }


}
