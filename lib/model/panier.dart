

import 'package:assouka_publique/model/produit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Panier {


  String? uid ;
  String? date_ajout ;
  String? uid_cleint ;

  Produit? produit;
  int? timeStampe ;
  int? quantity ;

  bool? statut_livrer ;
  bool? statut_payer ;

  Panier
  (
 {

   this.date_ajout,
   this.produit,
   this.quantity,

   this.uid_cleint,
   this.statut_livrer,
   this.statut_payer,

   this.uid,
   this.timeStampe,
}

   );


 //insert
 toMap() {
   return {

     // Panier
  'produit_panier_uid': uid,
  'produit_panier_date_ajout': date_ajout,
   'panier_uid_client': uid_cleint,

    'timeStampe_panier': timeStampe,
    'quantity_panier': quantity,

    'statut_livrer': statut_livrer,
   'statut_payer': statut_payer,

     // Produit
     'produit_name': produit!.name,
     'produit_photo_produit': produit!.photo_produit,
     'produit_nameChef': produit!.nameChef,
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
   };
 }


}