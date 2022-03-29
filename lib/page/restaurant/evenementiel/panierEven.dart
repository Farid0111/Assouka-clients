import 'package:assouka_publique/qrCode.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:flutter/material.dart';

class PanierEven extends StatefulWidget {
  @override
  _PanierEvenState createState() => _PanierEvenState();
}

class _PanierEvenState extends State<PanierEven> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.green,
                        child: Icon(Icons.arrow_back, color: Colors.white,size: 30,)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text("Ma liste d'achat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 10),
                  child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.green,
                      child: Icon(Icons.shopping_cart, color: Colors.white,size: 30,)),
                ),
              ],
            ),*/

            Padding(
              padding: const EdgeInsets.only(top: 10,),
              child: Text("Ma liste d'achat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            /* Container(
              width: 1000,
              height: MediaQuery.of(context).size.height/2,
              child: GridView.count(
                //            childAspectRatio: 3/2,
                scrollDirection: Axis.vertical,
                crossAxisCount: 1 ,
                children: List.generate(3,(index){
                  return Container(
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.green,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Restaurant.jpeg',
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      )
                    ),
                  );

                }),
              ),
            ),*/

            ProduitDetailCart (),
            ProduitDetailCart (),
            ProduitDetailCart (),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      color: Colors.green,
                      child: Icon(Icons.location_on_rounded,color: Colors.white,)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Localisation", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sous-total", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("9000 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Frais de livraison", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("500 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tax(12%)", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("225 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Montant Total", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("9725 F", style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Valider la commande',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      color: Colors.green,
                      minWidth: MediaQuery.of(context).size.width/1.15,
                      height: 50,
                    )
                  ]),
            )

          ],
        ),
      ),
    );
  }
  Widget PupupDiche(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class ProduitDetailCart extends StatefulWidget {
  const ProduitDetailCart({
    Key? key,
  }) : super(key: key);

  @override
  _ProduitDetailCartState createState() => _ProduitDetailCartState();
}

class _ProduitDetailCartState extends State<ProduitDetailCart> {
  int nombrePlat = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *0.20,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10.0),
        /*  decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: const Color.fromRGBO(19, 12, 117, 1.0),
        ),*/
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Image
                  Image.asset(
                    'assets/images/Restaurant.jpeg',
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  SizedBox(width: 05,),

                  // Descirption et title
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Poulet avec aloco',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),

                        Text(
                          'Poulet avec aloco Poulet avec aloco Poulet avec aloco \nPoulet avec aloco ',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 12
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Text(
                          '3 500 F',
                          style: TextStyle(
                              color: Couleurs.buttonPageRetaurantColors,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),


                      ],
                    ),
                  ),


                ],
              ),
            ),
            /*  Align(
              alignment: Alignment.centerLeft,
              child : Text(
                '3 500 F',
                style: TextStyle(
                    color: Couleurs.buttonPageRetaurantColors,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ),*/
            Positioned(
              right: 5.0,
              bottom: -10.0,
              child:   Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.add_box_rounded, color: Colors.green[200]),
                      onPressed: () {
                        setState(() {
                          nombrePlat -= 1;
                        });
                      }),
                  Text("$nombrePlat"),
                  IconButton(
                      icon: Icon(Icons.add_box_rounded, color: Colors.green),
                      onPressed: () {
                        setState(() {
                          nombrePlat += 1;
                        });
                      }),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}