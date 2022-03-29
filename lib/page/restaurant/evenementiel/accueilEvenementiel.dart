import 'package:assouka_publique/page/restaurant/evenementiel/detailEvennements.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/detailsEvennementBateme.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/detailsEvennementEnterrement.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/detailsEvennementMariage.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/detailEvennements.dart';
class AccueilEvennementiel extends StatefulWidget {
  @override
  _AccueilEvennementielState createState() => _AccueilEvennementielState();
}

class _AccueilEvennementielState extends State<AccueilEvennementiel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),


      body: SingleChildScrollView(

        child: Column(
          children: [

            Align(
              alignment: Alignment.centerLeft,

              child: Container(
                margin: EdgeInsets.all(10.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evennementiel", style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("", style: GoogleFonts.abel(fontSize: 13, fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height- MediaQuery.of(context).size.height/3.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [


                      // Cocktails

                      cartRestaurantEvent (name: "Anniversaire"),
                      cartRestaurantEventMariage (name: "Mariage"),
                      cartRestaurantEventBateme (name: "Batême"),
                      cartRestaurantEventEnterrement (name: "Enterrement"),

                      /*
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23, right: 25),
                              child: Row(
                                children: [
                                  Text("Cocktails",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/restaurant2.png',
                              width: 350.0,
                            ),
                           /* Padding(
                              padding: const EdgeInsets.only(left: 23, right: 23),
                              child: Text("sdfghjkljkhjghfgdfsadfghjgkhl;k'kljkhjghfgdfdsfghfjgkhl;k'klkhjghfgdfsdasgfhjgkhlkjhgfddsfjc;ejkck;cmk;jefnvew;"),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                  )
                                ),
                                onPressed: (){
                                  var route = MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetailsEvennement());
                                  Navigator.of(context).push(route);
                                },
                                child: Text("En Savoir Plus"),
                              ),
                              ),
                            ),

                          ],

                        ),
                      ),

                      // Pause café
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23, right: 25),
                              child: Row(
                                children: [
                                  Text("Pause Café",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/restaurant2.png',
                              width: 350.0,
                            ),
                           /* Padding(
                              padding: const EdgeInsets.only(left: 23, right: 23),
                              child: Text("sdfghjkljkhjghfgdfsadfghjgkhl;k'kljkhjghfgdfdsfghfjgkhl;k'klkhjghfgdfsdasgfhjgkhlkjhgfddsfjc;ejkck;cmk;jefnvew;"),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0)
                                  )
                                ),
                                onPressed: (){
                                  var route = MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DetailsEvennement());
                                  Navigator.of(context).push(route);
                                },
                                child: Text("En Savoir Plus"),
                              ),
                              ),
                            )
                          ],

                        ),
                      ),

                      //Anniversaire
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23, right: 25),
                              child: Row(
                                children: [
                                  Text("Anniversaire",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/restaurant2.png',
                              width: 350.0,
                            ),
                            /* Padding(
                              padding: const EdgeInsets.only(left: 23, right: 23),
                              child: Text("sdfghjkljkhjghfgdfsadfghjgkhl;k'kljkhjghfgdfdsfghfjgkhl;k'klkhjghfgdfsdasgfhjgkhlkjhgfddsfjc;ejkck;cmk;jefnvew;"),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0)
                                      )
                                  ),
                                  onPressed: (){
                                    var route = MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailsEvennement());
                                    Navigator.of(context).push(route);
                                  },
                                  child: Text("En Savoir Plus"),
                                ),
                              ),
                            )
                          ],

                        ),
                      ),

                      // Mariage
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23, right: 25),
                              child: Row(
                                children: [
                                  Text("Mariage",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/restaurant2.png',
                              width: 350.0,
                            ),
                            /* Padding(
                              padding: const EdgeInsets.only(left: 23, right: 23),
                              child: Text("sdfghjkljkhjghfgdfsadfghjgkhl;k'kljkhjghfgdfdsfghfjgkhl;k'klkhjghfgdfsdasgfhjgkhlkjhgfddsfjc;ejkck;cmk;jefnvew;"),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0)
                                      )
                                  ),
                                  onPressed: (){
                                    var route = MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailsEvennement());
                                    Navigator.of(context).push(route);
                                  },
                                  child: Text("En Savoir Plus"),
                                ),
                              ),
                            )
                          ],

                        ),
                      ),

                      // Enterrement
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 23, right: 25),
                              child: Row(
                                children: [
                                  Text("Enterrement",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/restaurant2.png',
                              width: 350.0,
                            ),
                            /* Padding(
                              padding: const EdgeInsets.only(left: 23, right: 23),
                              child: Text("sdfghjkljkhjghfgdfsadfghjgkhl;k'kljkhjghfgdfdsfghfjgkhl;k'klkhjghfgdfsdasgfhjgkhlkjhgfddsfjc;ejkck;cmk;jefnvew;"),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0)
                                      )
                                  ),
                                  onPressed: (){
                                    var route = MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailsEvennement());
                                    Navigator.of(context).push(route);
                                  },
                                  child: Text("En Savoir Plus"),
                                ),
                              ),
                            )
                          ],

                        ),
                      ),

                      */
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


   Widget cartRestaurantEvent({ required String name  })
   {
     return  Padding(
       padding: const EdgeInsets.only(bottom: 8.0, right: 15.0, left: 15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(name,style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
           SizedBox(height: 2,),
           Container(
             height: MediaQuery.of(context).size.height * 0.25,
             width: MediaQuery.of(context).size.width ,
             decoration: BoxDecoration(
               border: Border.all(color: Colors.black),
               borderRadius: BorderRadius.all(
                   Radius.circular(15.0) //                 <--- border radius here
               ),
               image: DecorationImage(
                 image: AssetImage("assets/images/restaurant.png"),
                 fit: BoxFit.fill,
               ),
             ),

           ),
           SizedBox(height: 2,),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     primary: Couleurs.buttonPageRetaurantColors,
                     shape: new RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(10.0)
                     )
                 ),
                 onPressed: (){
                   Navigator.push(
                     context,
                     PageTransition(
                         type: PageTransitionType.rightToLeft,
                         child:  DetailsEvennement()

                     ),
                   );

                 },
                 child: Text("En Savoir Plus", style:  TextStyle(color: Colors.black),),
               ),
             ),
           ),

         ],
       ),
     );
   }

  Widget cartRestaurantEventMariage({ required String name  })
  {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 15.0, left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
          SizedBox(height: 2,),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                  Radius.circular(15.0) //                 <--- border radius here
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/restaurant.png"),
                fit: BoxFit.fill,
              ),
            ),

          ),
          SizedBox(height: 2,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Couleurs.buttonPageRetaurantColors,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    )
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child:  DetailsEvennementMariage()

                    ),
                  );

                },
                child: Text("En Savoir Plus", style:  TextStyle(color: Colors.black),),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget cartRestaurantEventBateme({ required String name  })
  {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 15.0, left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
          SizedBox(height: 2,),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                  Radius.circular(15.0) //                 <--- border radius here
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/restaurant.png"),
                fit: BoxFit.fill,
              ),
            ),

          ),
          SizedBox(height: 2,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Couleurs.buttonPageRetaurantColors,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    )
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child:  DetailsEvennementBateme()

                    ),
                  );

                },
                child: Text("En Savoir Plus", style:  TextStyle(color: Colors.black),),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget cartRestaurantEventEnterrement({ required String name  })
  {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 15.0, left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
          SizedBox(height: 2,),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                  Radius.circular(15.0) //                 <--- border radius here
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/restaurant.png"),
                fit: BoxFit.fill,
              ),
            ),

          ),
          SizedBox(height: 2,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(constraints: BoxConstraints.tightFor(width: 350, height: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Couleurs.buttonPageRetaurantColors,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    )
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child:  DetailsEvennementEnterrement()

                    ),
                  );

                },
                child: Text("En Savoir Plus", style:  TextStyle(color: Colors.black),),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
