import 'package:assouka_publique/model/panier.dart';
import 'package:assouka_publique/model/produit.dart';
import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/page/restaurant/express/panierRestauExpress.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class DetailProduct extends StatefulWidget {

  Restaurant? restaurant ;
  Produit? produit ;
  DetailProduct({ required this.produit, required this.restaurant}) ;

  @override
  _DetailProductState createState() => _DetailProductState();
}
class _DetailProductState extends State<DetailProduct> {
  var nombrePlat = 0;
  @override
  void initState() {
    nombrePlat = 1;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Center(
         child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
             /* Image.asset(
                'assets/images/food.jpeg',
              ),     */
              Container(
               /* width: 500,
                height: 1000,*/
                color: Colors.red,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/food.jpeg',
                      fit: BoxFit.fitHeight,
                      height: MediaQuery.of(context).size.height,
                      width: 500,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 10),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18.0),
                              topRight: Radius.circular(18.0),
                              bottomRight: Radius.circular(18.0),

                            ),
                            color: Colors.green,
                          ),
                          width: 40,
                            height: 40,

                            child: Icon(Icons.arrow_back, color: Colors.white,size: 30,)),
                      ),
                    )
                  ],
                )
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 16.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Text('${widget.produit!.name}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Text('Livraison à domicile',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Row(
                             children: [
                               IconButton(
                                   icon: Container(
                                       child: Icon(Icons.remove, color: Colors.white, size: 15,),
                                     height: 19,
                                     width: 20,

                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(3.0),
                                           topRight: Radius.circular(3.0),
                                           bottomRight: Radius.circular(3.0),
                                           bottomLeft: Radius.circular(3.0),


                                         ),
                                         color: Colors.red,

                                     ),
                                   ),
                                   onPressed: () {
                                     setState(() {
                                       if(nombrePlat >1){
                                         nombrePlat -= 1;
                                       }
                                     });
                                   }),
                                  Text("$nombrePlat"),
                               IconButton(
                                   icon: Icon(Icons.add_box_rounded, color: Colors.green,),
                                   onPressed: () {
                                     setState(() {
                                       nombrePlat += 1;
                                     });
                                   }),
                             ],
                           ),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(3.0),
                                      topRight: Radius.circular(3.0),
                                      bottomRight: Radius.circular(3.0),
                                      bottomLeft: Radius.circular(3.0),


                                    ),
                                    color: Colors.green,
                                  ),

                                    height: 30,
                                    width: 120,
                                    child: Center(child: Text("${widget.produit!.prix} XOF", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),))),
                              )
                            ],
                          ),

                         Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text('${widget.produit!.description}', style: TextStyle( fontSize: 15),),

                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                FlatButton(
                                  onPressed: () {

                                    //
                                    // Add produit au panier
                                    //
                                    addProduitPanierDataToDb(produit: widget.produit!, quantity: nombrePlat);

                                   /* var route = MaterialPageRoute(
                                        builder: (BuildContext context) => PanierRestauExpress());
                                    Navigator.of(context).push(route);*/
                                  },
                                  child: Text(
                                    'Ajouter au panier',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  color: Colors.green,
                                  minWidth: MediaQuery.of(context).size.width/1.15,
                                  height: 45,
                                )
                              ]),
                            ),
                          )
                        ],
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

  bool isLoading = false;

  void addProduitPanierDataToDb({Produit? produit, int? quantity}) async {
    setState(() {
      isLoading = true;
    });


    Panier panier = new Panier();
    panier.produit = produit;
    panier.date_ajout = DateTime.now().toString();
    panier.statut_payer = false;
    panier.statut_livrer = false;
    panier.quantity = quantity;
    panier.uid_cleint = FirebaseAuth.instance.currentUser!.uid;


    var docRef = await FirebaseFirestore.instance.collection(Chaines.panier_Collection)
        .add({


      // Panier
      'produit_panier_uid': "",
      'produit_panier_date_ajout': DateTime.now().toString(),
      'panier_uid_client': FirebaseAuth.instance.currentUser!.uid,

      'timeStampe_panier': FieldValue.serverTimestamp(),
      'quantity_panier': panier.quantity,

      'statut_livrer': panier.statut_livrer,
      'statut_payer': panier.statut_payer,

      // Produit
      'produit_name': produit!.name,
      'produit_photo_produit': produit!.photo_produit,
     // 'produit_nameChef': "produit!.nameChef",
      'produit_cartegory': produit!.cartegory,

      'produit_date_ajout': produit!.date_ajout,
      'produit_description': produit!.description,
      'produit_like_counpteur': produit!.like_counpteur,

      'produit_prix': produit!.prix,
      'produit_uid': produit!.uid,
      'produit_userUID': produit!.userUID,

      'produit_userRestaurant': produit!.uidRestaurant,
      'produit_type': produit!.type,
      'produit_timestamp': FieldValue.serverTimestamp()


    })
        .then((value) {


    String docID =   value.id;
    updatePanierUID (docID, context);

    }

    )
    //   .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));


  }

  Future<void> updatePanierUID(String doc, BuildContext context) {
    return FirebaseFirestore.instance.collection(Chaines.panier_Collection)
        .doc(doc)
        .update({'produit_panier_uid': doc})
        .then((value) {

      Fluttertoast.showToast(msg: "ajouter au panier",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15,
        toastLength: Toast.LENGTH_LONG,);

    //  Navigator.pop(context);
    //  Navigator.pop(context);

      setState(() {
        isLoading = false;
      });

      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child:  PanierRestauExpress(restaurant: widget.restaurant,)),
      );

    })


    // .then((value) =>   Navigator.pop(context))
        .catchError((error) => print("Failed to update event: $error"));
  }


}
