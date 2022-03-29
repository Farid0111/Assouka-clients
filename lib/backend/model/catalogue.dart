

import 'package:assouka_publique/backend/model/cartegories_meat.dart';

class Catalogue {

 late String _uid ;
 late String _name_resto ;
 late String _uid_resto ;

 late String _description ;
 late String _date_ajout ;
 late List  <CartegoriesMeat> _cartegories_list ;
 late List  <String> _illustrationPhoto ;


 Restaurant
  (
  {
    required String uid ,
    required String name_resto ,
    required String uid_resto ,


    required List  <CartegoriesMeat> cartegories_list ,
    required List  <String>  illustrationPhoto ,
    required String description ,
    required String date_ajout ,

  }
   )
  {

    _uid = uid ;
    _name_resto = name_resto ;
    _uid_resto = uid_resto ;

    _cartegories_list = cartegories_list ;
    _illustrationPhoto = illustrationPhoto ;
    _description = description ;
    _date_ajout = date_ajout ;
  }



}