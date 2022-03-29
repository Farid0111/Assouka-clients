import 'package:assouka_publique/model/panier.dart';
import 'package:assouka_publique/model/produit.dart';
import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/qrCode.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PanierRestauExpress extends StatefulWidget {


  Restaurant? restaurant ;
  PanierRestauExpress({required this.restaurant});

  @override
  State<PanierRestauExpress> createState() => _PanierRestauExpressState();
}

class _PanierRestauExpressState extends State<PanierRestauExpress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
             /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 10),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.green,
                          child: Icon(Icons.arrow_back, color: Colors.white,size: 30,)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text("Ma liste d'achat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, right: 10),
                    child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.green,
                        child: Icon(Icons.shopping_cart, color: Colors.white,size: 30,)),
                  ),
                ],
              ),*/

              const Padding(
                padding: EdgeInsets.only(top: 10,),
                child: Text("Ma liste d'achat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
             /* Container(
                width: 1000,
                height: MediaQuery.of(context).size.height/2,
                child: GridView.count(
                  //            childAspectRatio: 3/2,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 1 ,
                  children: List.generate(3,(index){
                    return Container(
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.green,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/Restaurant.jpeg',
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        )
                      ),
                    );

                  }),
                ),
              ),*/

           //   ProduitDetailCart (),
           //   ProduitDetailCart (),
           //   ProduitDetailCart (),

              // Optionnel
             //   Container(
              //    height: MediaQuery.of(context).size.height /2,
              //    child:

                  SingleChildScrollView(
                    child: Column(
                      children: [


                        StreamBuilder<QuerySnapshot>(
                            stream:  FirebaseFirestore.instance.collection(Chaines.panier_Collection).snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }

                              if(snapshot.hasData)
                              {

                                return ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                                   // print("ddddddddddddddddd  ${data['produit_name']}");

                                    Produit produit =  Produit(
                                      uid: data['produit_uid'],
                                      userUID: data['produit_userUID'],
                                      cartegory: data['produit_cartegory'],
                                      name: data['produit_name'],
                                      type: data['produit_type'],
                                      prix: data['produit_prix'],
                                      uidRestaurant: data['produit_userRestaurant'],
                                      description: data['produit_description'],
                                      nameChef: data['produit_nameChef'],
                                      like_counpteur: data['produit_like_counpteur'],
                                      date_ajout: data['produit_date_ajout'].toString(),

                                    )  ;

                                    Panier panier =  Panier(
                                      quantity: data['quantity_panier'],
                                      produit: produit,
                                      date_ajout: data['produit_panier_date_ajout'],
                                      statut_livrer: data['statut_livrer'],
                                      statut_payer: data['statut_payer'] ,
                                      // timeStampe: data['date_ajout'] ,
                                      uid: data['produit_panier_uid'],
                                      uid_cleint: data['panier_uid_client'],

                                    )  ;

                                   // print("Type du produit ${produit.type}");
                                  //  print("Cartegory du produit ${produit.cartegory}");
                                  //  print("Produit chef current ${FirebaseAuth.instance.currentUser!.uid == produit.userUID}");
                                 //   print("ddddddddddddddddd  ${data['produit_panier_uid']}");

                                    //if(FirebaseAuth.instance.currentUser!.uid == panier.uid_cleint  ) {
                                    if(FirebaseAuth.instance.currentUser!.uid == panier.uid_cleint && widget.restaurant!.uid == produit.uidRestaurant  ) {
                                      return GestureDetector(
                                          onLongPress: (){
                                            deleteProduit(uidProduitPanier: panier.uid as String);
                                          },
                                          child: ProduitDetailCart (produit: produit ,panier: panier,));
                                    } else {
                                      return Container();
                                    }

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

                      ],
                    ),
                  ),
            //    ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        color: Colors.green,
                        child: Icon(Icons.location_on_rounded,color: Colors.white,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Localisation", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sous-total", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("9000 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Frais de livraison", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("500 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tax(12%)", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("225 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Montant Total", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("9725 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () {

                        },
                        child: const Text(
                          'Valider la commande',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        color: Colors.green,
                        minWidth: MediaQuery.of(context).size.width/1.15,
                        height: 50,
                      )
                    ]),
              )

            ],
          ),
        ),
      ),
    );
  }

  void deleteProduit ({required String uidProduitPanier})
  {
    FirebaseFirestore.instance.collection(Chaines.panier_Collection)
        .doc(uidProduitPanier)
        .delete()
        .then((value) {


      Fluttertoast.showToast(msg: "Supprimer du panier",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG,);

      print("Produit delete form cart");
    })
        .catchError((error) => print("Failed to delete produit: $error"));
  }
}

class ProduitDetailCart extends StatefulWidget {

  Produit? produit; Panier? panier;
   ProduitDetailCart({
     this.panier,
     this.produit,
    Key? key,
  }) : super(key: key);

  @override
  _ProduitDetailCartState createState() => _ProduitDetailCartState();
}

class _ProduitDetailCartState extends State<ProduitDetailCart> {
  int nombrePlat = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *0.20,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10.0),
      /*  decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: const Color.fromRGBO(19, 12, 117, 1.0),
        ),*/
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Image
                  Image.asset(
                    'assets/images/Restaurant.jpeg',
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  SizedBox(width: 05,),

                  // Descirption et title
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.produit!.name as String,
                          //'Poulet avec aloco',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),

                        Text(
                         widget.produit!.description as String,
                        //  'Poulet avec aloco Poulet avec aloco Poulet avec aloco \nPoulet avec aloco ',
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 12
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Text(
                          "${widget.produit?.prix}" + " XOF",
                          style: TextStyle(
                              color: Couleurs.buttonPageRetaurantColors,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),


                      ],
                    ),
                  ),


                ],
              ),
            ),
          /*  Align(
              alignment: Alignment.centerLeft,
              child : Text(
                '3 500 F',
                style: TextStyle(
                    color: Couleurs.buttonPageRetaurantColors,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),*/
            Positioned(
              right: 5.0,
              bottom: -10.0,
              child:   Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.add_box_rounded, color: Colors.green[200]),
                      onPressed: () {
                        setState(() {
                          widget.panier?.quantity =  ((widget.panier?.quantity)! - 1)!;
                        });
                      }),
                  Text("${widget.panier?.quantity}"),
                  IconButton(
                      icon: Icon(Icons.add_box_rounded, color: Colors.green),
                      onPressed: () {
                        setState(() {
                          widget.panier?.quantity =  ((widget.panier?.quantity)! + 1)!;
                        });
                      }),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}