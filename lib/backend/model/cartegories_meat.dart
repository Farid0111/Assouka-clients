

import 'package:assouka_publique/backend/model/meat.dart';

class CartegoriesMeat {

 late List  <Meat> _meat_list ;
 late String _name ;
 late int _like_counpteur ;
 late String _description ;
 late String _uid ;
 late String _restaurent_uid ;
 late String _restaurent_name ;
 late String _date_ajout ;

 CartegoriesMeat
  (
  {
    required String uid ,
    required String name ,
    required List  <Meat> meat_list ,

    required int like_counpteur ,
    required String description ,

    required String restaurent_uid ,
    required String restaurent_name ,
    required String date_ajout ,

  }
   )
  {
    _meat_list = meat_list ;

    _uid = uid ;
    _name = name ;

    _like_counpteur = like_counpteur ;
    _description = description ;

    _restaurent_uid = restaurent_uid ;
    _restaurent_name = restaurent_name ;
    _date_ajout = date_ajout ;
  }



}