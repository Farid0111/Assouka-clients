

import 'package:cloud_firestore/cloud_firestore.dart';

class Produit {

  String? userUID ;
  String? photo_produit ;
  String? uid ;
  String? uidRestaurant ;

  String? name ;
  String? nameChef ;
  int? like_counpteur ;

  String? description ;
  String? date_ajout ;
  String? prix ;

  String? cartegory ;
  String? type ;
  int? timeStampe ;

  Produit
  (
 {

   this.userUID,
   this.photo_produit,
   this.name,
   this.nameChef,

   this.cartegory,
   this.date_ajout,
   this.description,

   this.like_counpteur,
   this.type,
   this.uidRestaurant,

   this.prix,
   this.uid,
   this.timeStampe,
}

   );


 //insert
 toMap() {
   return {

     'name': name,
     'photo_produit': photo_produit,
     'nameChef': nameChef,
     'cartegory': cartegory,

     'date_ajout': date_ajout,
     'description': description,
     'like_counpteur': like_counpteur,

     'prix': prix,
     'uid': uid,
     'userUID': userUID,

     'userRestaurant': uidRestaurant,
     'type': type,
     'timestamp': FieldValue.serverTimestamp()
   };
 }

 factory Produit.fromMap(Map map) {
   return Produit(

     cartegory:  map["cartegory"],
     photo_produit:  map["photo_produit"],
     date_ajout: map["date_ajout"] ,
     description: map["description"],

     like_counpteur: map["name"],


     prix: map["prix"],
     timeStampe: map["timestamp"],
     userUID: map["userUID"],

     name: map["name"],
     nameChef: map["nameChef"],
     uid: map["timestamp"],
   );
 }

}