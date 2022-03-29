
import 'package:assouka_publique/ressources/Strings.dart';

class ModelCartegory {

  String _name = "";
  String _image  = "";



 ModelCartegory({required String image, required String name,})
 {
   this._image = image;
   this._name=  name ;
 }


 String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }




}


List<ModelCartegory> getCartegoris()
{

List<ModelCartegory> listmodel = <ModelCartegory>[];

  listmodel.add(new ModelCartegory (name: Chaines.menu_home[0], image: "assets/home/restaurant.jpg"));
  listmodel.add(new ModelCartegory (name: Chaines.menu_home[1], image: "assets/home/commandes.jpg"));
  listmodel.add(new ModelCartegory (name: Chaines.menu_home[2], image: "assets/home/compta.jpg"));
  listmodel.add(new ModelCartegory (name: Chaines.menu_home[3], image: "assets/home/retraire.jpeg"));


  return listmodel ;

}