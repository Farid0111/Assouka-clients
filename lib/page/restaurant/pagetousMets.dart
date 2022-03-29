import 'package:assouka_publique/detailProduct.dart';
import 'package:assouka_publique/model/produit.dart';
import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PageTousMets extends StatefulWidget {


  Restaurant? resto ;
  PageTousMets({ required this.resto}) ;

  @override
  _PageTousMetsState createState() => _PageTousMetsState();
}

class _PageTousMetsState extends State<PageTousMets> {

  @override
  Widget build(BuildContext context) {

    String? uidRestaurant = widget.resto!.uid ;
     Stream<QuerySnapshot> _lastEventStreamProduit = FirebaseFirestore.instance.collection("Produits").where("uidRestaurant",isEqualTo: "${uidRestaurant}").where("type",isEqualTo: "${Chaines.CONST_PRODUIT_METS}").limit(30).snapshots();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text("Mets"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:  SingleChildScrollView(
          child: Column(
            children: [


              StreamBuilder<QuerySnapshot>(
                  stream: _lastEventStreamProduit,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                    if (snapshot.hasError) {
                      print("erreur : ${snapshot.hasError.toString}");
                      print("erreur : ${snapshot.error}");
                      return Text('Something went wrong');
                    }

                    if(snapshot.hasData)
                    {

                      return GridView(
                        shrinkWrap: true,
                        reverse: false,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        //  crossAxisSpacing: 5,
                        //  mainAxisSpacing: 5,
                        ),


                        /*  return GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2 ,

                        */
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                          Produit produit =  Produit(

                            userUID: data['userUID'],
                            uid: data['uid'],
                            photo_produit: data['photo_produit'],
                            uidRestaurant: data['uidRestaurant'],
                            name: data['name'],
                            nameChef: data['nameChef'],
                            like_counpteur: data['like_counpteur'],
                            description: data['description'],
                            date_ajout: data['date_ajout'],
                            prix: data['prix'].toString(),
                            cartegory: data['cartegory'].toString(),
                            type: data['type'].toString(),
                            timeStampe: data['timeStampe'],

                          )  ;

                            return
                            GestureDetector(
                              onTap: (){

                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child:  DetailProduct(produit: produit,restaurant: widget.resto,)),
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),

                                elevation: 3.0,
                                shadowColor: Couleurs.buttonPageRetaurantColors,
                                color: Colors.grey[200],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height/5,
                                      //        height: MediaQuery.of(context).size.height/7,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: const BorderRadius.only (topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                                        image: const DecorationImage(
                                          image: AssetImage( 'assets/images/Mets1.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${produit.name}",
                                          style:   GoogleFonts.ptSerif(fontSize: 12,color: Colors.black, fontWeight: FontWeight.bold), /*textAlign: TextAlign.center*/ maxLines: 1,),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("${produit.prix} FCFA", style:   GoogleFonts.ptSerif(fontSize: 14,color: Colors.red, fontWeight: FontWeight.bold), /*textAlign: TextAlign.center*/ maxLines: 1,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );

                        }).toList(),
                      );

                    }

                    else {
                      return  Align(
                       alignment: Alignment.topCenter,
                       child: Padding(
                        padding: const EdgeInsets.only(top:  10.0),
                        child: CupertinoActivityIndicator(
                          animating: true,
                          radius: MediaQuery.of(context).size.width *0.08,
                        ),
                      ),
                    );
                    }
                  }
              ),

              /*
              StreamBuilder<QuerySnapshot>(
                  stream: _lastEventStreamProduit,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                    if (snapshot.hasError) {
                      print("erreur : ${snapshot.hasError.toString}");
                      print("erreur : ${snapshot.error}");
                      return Text('Something went wrong');
                    }

                    if(snapshot.hasData)
                    {

                      return ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                          Produit produit =  Produit(

                            userUID: data['userUID'],
                            uid: data['uid'],
                            photo_produit: data['photo_produit'],
                            uidRestaurant: data['uidRestaurant'],
                            name: data['name'],
                            nameChef: data['nameChef'],
                            like_counpteur: data['like_counpteur'],
                            description: data['description'],
                            date_ajout: data['date_ajout'],
                            prix: data['prix'].toString(),
                            cartegory: data['cartegory'].toString(),
                            type: data['type'].toString(),
                            timeStampe: data['timeStampe'],

                          )  ;

                          if(produit.uidRestaurant == widget.resto!.uid && produit.type == Chaines.CONST_PRODUIT_METS) {
                            return

                              Card(
                                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 3.0,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height/5,
                                      //        height: MediaQuery.of(context).size.height/7,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.only (topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0),),
                                        image: const DecorationImage(
                                          image: AssetImage( 'assets/images/Mets1.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all (Radius.circular(10.0)),
                                        color: Colors.green,
                                      ),

                                      padding: EdgeInsets.only( left: 2.0, right: 2.0),
                                      child: Row(
                                        children: [
                                          Text(data['name']),
                                          Text("${produit.prix} FCFA", style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal
                                          ), textAlign: TextAlign.center,),
                                        ],
                                      )
                                      ,
                                    ),
                                  ],
                                ),
                              );
                          }

                        //  else
                            return Container();
                        }).toList(),
                      );

                    }

                    return  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top:  10.0),
                        child: CupertinoActivityIndicator(
                          animating: true,
                          radius: MediaQuery.of(context).size.width *0.08,
                        ),
                      ),
                    );
                  }
              ),
*/
            ],
          ),
        ),


          /* GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2 ,
          children: List.generate(10,(index){
            return Container(
              child: GestureDetector(
                onTap: (){

                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child:  DetailProduct()),
                  );

                },
                child:

                Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 3.0,
                  shadowColor: ( index  % 2 ==  0) ? Colors.green : Colors.green,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/5,
                        //        height: MediaQuery.of(context).size.height/7,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.only (topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0),),
                          image: DecorationImage(
                            image: AssetImage( 'assets/images/Mets1.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all (Radius.circular(10.0)),
                          color: Colors.green,
                        ),
                        padding: EdgeInsets.only( left: 2.0, right: 2.0),
                        child: Text("500 fcfa", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal
                        ), textAlign: TextAlign.center,)
                        ,
                      ),
                    ],
                  ),
                ),
              ),
            );

          }),
        ),*/
      ),
    );
  }
}
