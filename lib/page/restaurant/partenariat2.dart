
import 'package:assouka_publique/creerCatalogue.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Partenariat2 extends StatefulWidget {
  @override
  _Partenariat2State createState() => _Partenariat2State();
}

class _Partenariat2State extends State<Partenariat2> {
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
                padding: const EdgeInsets.only(top: 0),
                child: Container(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("assets/images/Restaurant.jpeg"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Text("Restaurant le triomphe", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Icon(Icons.edit, size: 20, color: Colors.green,)
                ],
              ),

              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
          Text("Manger bien, manger équilibré"),
    Icon(Icons.edit, size: 18, color: Colors.green,)

  ],
),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width-100,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: new Icon(Icons.phone),
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
                      icon: new Icon(Icons.assignment_outlined),
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
              ),

            /*  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50, right: 50),
                          child: RaisedButton(
                            onPressed: () {
                              var route = MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CreerCatalogue());
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
                                    'Continue',
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
}
