

import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/page/login/auth/login_screen.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/accueilEvenementiel.dart';
import 'package:assouka_publique/page/restaurant/express/panierRestauExpress.dart';
import 'package:assouka_publique/page/restaurant/nostal/nostalAccueil.dart';
import 'package:assouka_publique/page/page_default_non_disponible.dart';
import 'package:assouka_publique/page/restaurant/pageAccueilRestau.dart';
import 'package:assouka_publique/page/restaurant/pageRestaurant.dart';
import 'package:assouka_publique/page/restaurant/express/pagerestoEx.dart';
import 'package:assouka_publique/page/partenaire.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class BottomHomeRestaurantExpress extends StatefulWidget {

    Restaurant? restaurant ;
    BottomHomeRestaurantExpress({Key? key, required this.restaurant}) : super(key: key);


    @override
    State<BottomHomeRestaurantExpress> createState() => _BottomHomeRestaurantExpressState();
    
}

class _BottomHomeRestaurantExpressState extends State<BottomHomeRestaurantExpress> {


  int _pageIndex = 0;
  late PageController _pageController;


  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tabPages = [
      PageAccueil(restaurant: widget.restaurant,),
      PanierRestauExpress(restaurant: widget.restaurant,),
      LoginScreen(),
      // Screen3(),
    ];


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        //    title: Text("", style: TextStyle(color: Couleurs.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          color: Couleurs.buttonPageRetaurantColors,
          fontWeight: FontWeight.bold,
        ),
        selectedItemColor: Couleurs.buttonPageRetaurantColors,

        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.home ,color: Couleurs.black,), title: Text("Accueil", style:  TextStyle(/*color: Couleurs.black,*/ fontWeight: FontWeight.bold,)), activeIcon: Icon(Icons.home ,color: Couleurs.buttonPageRetaurantColors),  ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart ,color: Couleurs.black), title: Text("Panier", style:  TextStyle(/*color: Couleurs.black,*/ fontWeight: FontWeight.bold,)) , activeIcon: Icon(Icons.shopping_cart ,color: Couleurs.buttonPageRetaurantColors)),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Couleurs.black), title: Text("Profil", style:  TextStyle(/*color: Couleurs.black,*/ fontWeight: FontWeight.bold,)), activeIcon: Icon(Icons.person ,color: Couleurs.buttonPageRetaurantColors)),
        ],

      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
}
