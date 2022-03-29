

class User {

 late String _uid ;
 late String _name ;
 late String _photo;

 late String _email ;
 late String _numero_phone ;


 User
  (
  {
    required String uid ,
    required String name ,
    required String photo ,

    required String email ,
    required String numero_phone ,

  }
   )
  {
    _uid = uid ;
    _name = name ;
    _photo = photo ;

    _email = email ;
    _numero_phone = numero_phone ;

  }



}