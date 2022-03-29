import 'package:assouka_publique/page/restaurant/evenementiel/accueilEvenementiel.dart';
import 'package:assouka_publique/page/restaurant/nostal/nostalAccueil.dart';
import 'package:assouka_publique/page/page_default_non_disponible.dart';
import 'package:assouka_publique/page/restaurant/pageRestaurant.dart';
import 'package:assouka_publique/page/restaurant/express/pagerestoEx.dart';
import 'package:assouka_publique/page/partenaire.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PagePrincipal extends StatefulWidget {
  @override
  _PagePrincipalState createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo/arr.jpeg"),
          //  image: AssetImage("assets/logo/arr.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          const Image(image: AssetImage("assets/logo/assouka_logo.png")),
           // Resto
           principalButton(indix: 1, nameRestaurant: Chaines.resto),

           // Epicerie
           principalButton(indix: 2, nameRestaurant: Chaines.epicerie),

           // Decoration
           principalButton(indix: 3, nameRestaurant: Chaines.decoration),

           // Mode
           principalButton(indix: 4, nameRestaurant: Chaines.mode),


           // Devenir partenaire
           Visibility(
             visible: false,
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: ConstrainedBox(
                 constraints: BoxConstraints.tightFor(
                   width: MediaQuery.of(context).size.width * 0.6,
                   height:  MediaQuery.of(context).size.height * 0.08,),
                 child: ElevatedButton.icon(
                   icon: Icon(Icons.thumb_up, color: Colors.red,),
                   label: Text(Chaines.devenir_partenaire, style: TextStyle(color: Couleurs.black),),
                   onPressed: () {
                     Navigator.push(
                       context,
                       PageTransition(
                           type: PageTransitionType.rightToLeft,
                           child:  Partenaire()),
                     );
                   },
                   style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(32.0),
                     ),
                     primary: Couleurs.buttonPageRetaurantColors,
                   ),
                 ),
               ),
             ),
           )


         ],
      ),

    );
  }


  // Widget Button
  Widget principalButton ({required int indix, required String nameRestaurant}){

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
                    child:  PageRestaurantEx()),
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
