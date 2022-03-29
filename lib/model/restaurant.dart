

import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {

  String? userUID ;
  String? uid ;
  String? name ;
  String? nameChef ;
  String? slogant ;

  String? numero_telephone ;
  String? registre_commerce ;
  int? like_counpteur ;

  String? description ;
  String? date_ajout ;
  bool? activer ;

  String? prix ;
  String? cartegory ;
  String? localisation ;

  String? abonnement ;
  String? email ;
  int? timeStampe ;

 Restaurant
  (
 {
   this.email,
   this.userUID,
   this.name,
   this.nameChef,
   this.abonnement,

   this.activer,
   this.cartegory,
   this.date_ajout,

   this.description,
   this.like_counpteur,
   this.localisation,

   this.numero_telephone,
   this.prix,
   this.registre_commerce,

   this.slogant,
   this.uid,
   this.timeStampe,
}

   );


 //insert
 toMap() {
   return {
     'email': email,
     'name': name,
     'nameChef': nameChef,
     'abonnement': abonnement,

     'activer': activer,
     'cartegory': cartegory,
     'date_ajout': date_ajout,

     'description': description,
     'like_counpteur': like_counpteur,
     'localisation': localisation,

     'prix': prix,
     'mobileNumber': numero_telephone,
     'RCCM': registre_commerce,

     'slogant': slogant,
     'uid': uid,
     'userUID': userUID,
     'timestamp': FieldValue.serverTimestamp()
   };
 }

 factory Restaurant.fromMap(Map map) {
   return Restaurant(

     activer: map["activer"],
     cartegory:  map["cartegory"],
     date_ajout: map["date_ajout"] ,

     description: map["description"],
     email: map["email"] ,
     like_counpteur: map["name"],

     localisation: map["localisation"],
     prix: map["prix"],
     registre_commerce: map["RCCM"],

     slogant: map["slogant"],
     timeStampe: map["timestamp"],
     userUID: map["userUID"],

     name: map["name"],
     nameChef: map["nameChef"],
     numero_telephone: map["mobileNumber"],
     abonnement: map["abonnement"],

     uid: map["timestamp"],
   );
 }

}