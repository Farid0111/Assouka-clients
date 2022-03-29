import 'dart:async';
import 'dart:io';

import 'package:assouka_publique/page/page_principale.dart';
import 'package:assouka_publique/page/restaurant/pageRestaurant.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';




class Splash extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<Splash>  with TickerProviderStateMixin {


  FirebaseAuth auth = FirebaseAuth.instance;

  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;






  @override
   initState()  {
    // TODO: implement initState

    startTimer ();
    _portraitModeOnly();
    _initAnimation ();
    _animationController.forward();

    // Chek User or Creat User compte
    CheckUser ();

    super.initState();
  }


  // Screen orientation
  // blocks rotation; sets orientation to: portrait
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }



  Future<void> CheckUser ()
  async {
    if (FirebaseAuth.instance.currentUser != null)
      print(" UID CURRENT USER ${FirebaseAuth.instance.currentUser!.uid} ");
      else
       await FirebaseAuth.instance.signInAnonymously();
  }

  // Animation
  // User
  void _initAnimation ()
  {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _animationController.forward();

    _pulseAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController.forward();
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Container(

      color:   Couleurs.defaultColorsSplashBackground,
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: Stack (
            children: <Widget>[

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                      Container(
                          padding: EdgeInsets.only( bottom: 20.0),
                          child:
                              Align(alignment: Alignment.center,
                                child: Image.asset('assets/logo/assouka_logo.png',
                                  height:  MediaQuery.of(context).size.height  /1.5,
                                  width:  MediaQuery.of(context).size.width  /0.5,),)),
                  //  ),

                    Container(
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all( 20.0),
                      child:
                          const Align(alignment: Alignment.center,
                            child: Text( '',
                            maxLines: 2,
                              style: TextStyle(fontWeight: FontWeight.w200,
                                fontSize: 18.0, color: Colors.white),
                            textAlign: TextAlign.center ,),),
                        ),


                  ],
                ),
              ),



            ]
        )

      ),
    );
  }


  // Gestion du temps
  startTimer() async {
    var duration = Duration (seconds: 10);
    return Timer (duration, route);
  }

  route() {

    setState(() {
      Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            child:  PagePrincipal()),
      );
    });

  }


}
