import 'package:assouka_publique/page/restaurant/evenementiel/accueilEvenementiel.dart';
import 'package:assouka_publique/page/restaurant/nostal/nostalAccueil.dart';
import 'package:assouka_publique/page/restaurant/express/pagerestoEx.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PageRestaurantEx extends StatefulWidget {
  @override
  _PageRestaurantExState createState() => _PageRestaurantExState();
}

class _PageRestaurantExState extends State<PageRestaurantEx> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logo/arr.jpeg"),
       // image: AssetImage("assets/logo/arr.jpeg"),
        fit: BoxFit.fill,
        ),
        ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
            //  color: Colors.black
          ),

          elevation: 0.0,
          backgroundColor: Colors.transparent,

        ),


        body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.restaurant, size: 100, color: Colors.lightGreenAccent,),
              ),
              // Resto express
              restaurantButton(indix: 1, nameRestaurant: Chaines.resto_express),
              // Resto nostal
              restaurantButton(indix: 2, nameRestaurant: Chaines.resto_nostal),
              // Resto Event
              restaurantButton(indix: 3, nameRestaurant: Chaines.resto_evenementiel),

            ],
          ),
        )
        )
      ),
    );
  }


  // Widget Retaurant Button
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
                    child:  PageRestoEx()),
              );
            }

          // Restaurant Nostal
          else if (indix == 2)
            {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  AccueilNostal()),
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

        ),
      ),
    );
  }


}
