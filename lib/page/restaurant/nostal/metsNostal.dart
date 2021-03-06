import 'package:assouka_publique/Data/caroussel.dart';
import 'package:assouka_publique/detailProduct.dart';
import 'package:assouka_publique/model/produit.dart';
import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/page/restaurant/express/PageTousBoissons.dart';
import 'package:assouka_publique/page/restaurant/pagetousMets.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MetsNostal extends StatefulWidget {

  Restaurant? restaurant ;
  MetsNostal({required this.restaurant});

  @override
  _MetsNostalState createState() => _MetsNostalState();
}

class _MetsNostalState extends State<MetsNostal> {



  @override
  Widget build(BuildContext context) {

    String? uidRestaurant = widget.restaurant!.uid ;
    Stream<QuerySnapshot> _lastEventStreamProduit = FirebaseFirestore.instance.collection("Produits").where("uidRestaurant",isEqualTo: "${uidRestaurant}").where("type",isEqualTo: "${Chaines.CONST_PRODUIT_METS}").limit(4).snapshots();

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          //    title: Text("", style: TextStyle(color: Couleurs.black),),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),

      body: SingleChildScrollView(
        child: Column(
          children: [
           /* Padding(
              padding: const EdgeInsets.only(top: 50, right: 40, left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    color: Colors.green,
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.green,
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                  )
                ],
              ),
            ),*/

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        //  color: Colors.green[100],
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/4,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Recherche des mets',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5)),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Couleurs.buttonPageRetaurantColors,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                //  topRight: Radius.circular(5.0),
                                //  bottomRight: Radius.circular( 5.0),
                                bottomLeft: Radius.circular( 5.0)

                            )
                        ),

                      ),
                      Container(child: Icon(Icons.search),
                        width: 40, height: 50,// color: Colors.green[100],
                        decoration: BoxDecoration(
                            color: Couleurs.buttonPageRetaurantColors,
                            borderRadius: BorderRadius.only(
                              //  topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular( 5.0),
                              //  bottomLeft: Radius.circular( 5.0)

                            )
                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
           /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.green[100],
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/4,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Recherche des mets',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5)),
                          ),
                        ),
                      ),
                      Container(child: Icon(Icons.search),
                        width: 40, height: 50, color: Colors.green[100],),
                    ],
                  ),
                ),
              ],
            ),*/
            
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView(children:[

                  Center(child: Text("Mets d'origine Parakou", style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20
                  ),
                  )),

               /*
                 Container(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width:  MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/1.18,
                              child:  GridView.count(
                                //            childAspectRatio: 3/2,
                                scrollDirection: Axis.vertical,
                                crossAxisCount: 2 ,
                                children: List.generate(6,(index){
                                  return Container(
                                    child: GestureDetector(
                                      onTap: (){
                                        var route = MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                DetailProduct());
                                        Navigator.of(context).push(route);
                                      },
                                      child: Card(
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
                                            Center(
                                              child: Container(
                                                height: MediaQuery.of(context).size.height/7,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only (topLeft: Radius.circular(15.0), topRight: Radius.circular(45.0),),
                                                  image: DecorationImage(
                                                    image: AssetImage( 'assets/images/Restaurant.jpeg'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only( left: 2.0, right: 2.0),
                                              child: Column(
                                                children: [
                                                  Text("Poulet avec Aloco", style: TextStyle(fontSize: 18),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text("500fcfa", style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                          color: Colors.red,
                                                          fontSize: 18,
                                                          fontStyle: FontStyle.normal
                                                      ), textAlign: TextAlign.center,),
                                                    ],
                                                  ),
                                                ],
                                              )
                                              ,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );

                                }),
                              ),
                            ) ,
                            Text("Avis des clients", style: TextStyle(fontSize: 20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 0.65,
                                    center: new Text("65%"),
                                    progressColor: Colors.green,
                                  ),
                                ),   CircularPercentIndicator(
                                  radius: 60.0,
                                  lineWidth: 5.0,
                                  percent: 0.25,
                                  center: new Text("25%"),
                                  progressColor: Colors.orange,
                                ),Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 0.1,
                                    center: new Text("10%"),
                                    progressColor: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),*/

                  Container(
                      height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height/4,
                      child: ListView(

                        children:[

                          ComplicatedImageDemo(),

                          const Center(child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Cat??gories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          )),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.rightToLeft,
                                            child:  PageTousMets(resto: widget.restaurant,)),
                                      );
                                    },
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * 0.25,
                                      width: MediaQuery.of(context).size.height * 0.25,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0) //                 <--- border radius here
                                        ),
                                        image: const DecorationImage(
                                          image: AssetImage("assets/images/Mets1.jpeg"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),

                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child:  PageTousBoissons(resto: this.widget.restaurant,)),
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.25,
                                    width: MediaQuery.of(context).size.height * 0.25,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0) //                 <--- border radius here
                                      ),
                                      image: const DecorationImage(
                                        image: AssetImage("assets/images/boissons.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                              height: MediaQuery.of(context).size.height,
                              margin: EdgeInsets.only(bottom: 50),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const  Text('Mets les plus acheter', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                                          GestureDetector(
                                              onTap: (){
                                                Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      type: PageTransitionType.rightToLeft,
                                                      child:  PageTousMets(resto: widget.restaurant,)),
                                                );
                                              },
                                              child: Text('voir tous', style: TextStyle(fontWeight: FontWeight.bold),))
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:  MediaQuery.of(context).size.width,
                                      // height: 500,
                                      height: MediaQuery.of(context).size.height/1.7,
                                      child:  StreamBuilder<QuerySnapshot>(
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
                                                              child:  DetailProduct(produit: produit, restaurant: widget.restaurant,)),
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
                                    ) ,


                                    Text("Avis des clients", style: TextStyle(fontSize: 20),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircularPercentIndicator(
                                            radius: 60.0,
                                            lineWidth: 5.0,
                                            percent: 0.65,
                                            center: new Text("65%"),
                                            progressColor: Colors.green,
                                          ),
                                        ),   CircularPercentIndicator(
                                          radius: 60.0,
                                          lineWidth: 5.0,
                                          percent: 0.25,
                                          center: new Text("25%"),
                                          progressColor: Colors.orange,
                                        ),Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircularPercentIndicator(
                                            radius: 60.0,
                                            lineWidth: 5.0,
                                            percent: 0.1,
                                            center: new Text("10%"),
                                            progressColor: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ],
                      )),

                ], ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
