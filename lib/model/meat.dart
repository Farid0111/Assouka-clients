

class Meat {

 late String _uid ;
 late String _name ;
 late String _price ;
 late String _photo;
 late int _like_counpteur ;
 late String _description ;
 late String _restaurent_cartegorie_uid ;
 late String _restaurent_cartegorie_name ;
 late String _restaurent_uid ;
 late String _restaurent_name ;
 late String _date_ajout ;

  Meat
  (
  {
    required String uid ,
    required String name ,
    required String price ,
    required String photo ,
    required int like_counpteur ,
    required String description ,
    required String restaurent_cartegorie_uid ,
    required String restaurent_cartegorie_name ,
    required String restaurent_uid ,
    required String restaurent_name ,
    required String date_ajout ,

  }
   )
  {
    _uid = uid ;
    _name = name ;
    _price = price ;
    _photo = photo ;
    _like_counpteur = like_counpteur ;
    _description = description ;
    _restaurent_cartegorie_uid = restaurent_cartegorie_uid ;
    _restaurent_cartegorie_name = restaurent_cartegorie_name ;
    _restaurent_uid = restaurent_uid ;
    _restaurent_name = restaurent_name ;
    _date_ajout = date_ajout ;
  }


  // Getter

}