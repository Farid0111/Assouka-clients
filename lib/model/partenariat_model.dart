

class ParternariatRestaurant {

 late String _uid ;
 late String _name ;
 late String _slogant ;

 late String _numero_telephone ;
 late String _registre_commerce ;

 late int _like_counpteur ;
 late String _description ;
 late String _date_ajout ;

 late String _localisation ;

 ParternariatRestaurant
  (
  {
    required String uid ,
    required String name ,
    required String slogant ,

    required String numero_telephone ,
    required String registre_commerce ,

    required int like_counpteur ,
    required String description ,
    required String date_ajout ,

    required String localisation ,

  }
   )
  {
    _slogant = slogant ;
    _uid = uid ;
    _name = name ;

    _numero_telephone = numero_telephone ;
    _registre_commerce = registre_commerce ;

    _like_counpteur = like_counpteur ;
    _description = description ;
    _date_ajout = date_ajout ;

    _localisation = localisation ;
  }



}