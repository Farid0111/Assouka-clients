
import 'package:assouka_publique/detailProduct.dart';
import 'package:assouka_publique/model/produit.dart';
import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PageTousBoissons extends StatefulWidget {


  Restaurant? resto ;
  PageTousBoissons({ required this.resto}) ;

  @override
  _PageTousBoissonsState createState() => _PageTousBoissonsState();
}

class _PageTousBoissonsState extends State<PageTousBoissons> {


  @override
  Widget build(BuildContext context) {

    String? uidRestaurant = widget.resto!.uid ;
    Stream<QuerySnapshot> _lastEventStreamProduit = FirebaseFirestore.instance.collection("Produits").where("uidRestaurant",isEqualTo: "${uidRestaurant}").where("type",isEqualTo: "${Chaines.CONST_PRODUIT_BOISSON}").limit(30).snapshots();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text("Boissons"),
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

                      return GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2 ,
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
                                        child:  DetailProduct(produit: produit, restaurant: widget.resto,)),
                                  );
                                },
                                child: Card(
                                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),

                                  elevation: 3.0,
                                  shadowColor: Colors.green,
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
                                          borderRadius: BorderRadius.only (topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0), bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                                          image: const DecorationImage(
                                            image: AssetImage( 'assets/images/boissons.png'),
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


            ],
          ),
        ),

      ),
    );
  }
}
