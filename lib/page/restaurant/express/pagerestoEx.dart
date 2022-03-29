import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/accueilEvenementiel.dart';
import 'package:assouka_publique/page/restaurant/express/express_bottom_hom.dart';
import 'package:assouka_publique/page/restaurant/nostal/nostalAccueil.dart';
import 'package:assouka_publique/page/restaurant/pageAccueilRestau.dart';
import 'package:assouka_publique/page/partenaire.dart';
import 'package:assouka_publique/page/restaurant/partRestauration.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class PageRestoEx extends StatefulWidget {

  @override
  _PageRestoExState createState() => _PageRestoExState();
}

class _PageRestoExState extends State<PageRestoEx> {

  final Stream<QuerySnapshot> _lastEventStream = FirebaseFirestore.instance.collection(Chaines.restaurant_Collection).orderBy("timestamp", descending: true).limit(30).snapshots();
  Restaurant? restauUniv;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context, ) {
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
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              // Search Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: 150,
                      height: 40,
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Recherche',
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ],
          ),
           // Text("Resto Express", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
           // Text("Choisi ton restaurant préféré", style: TextStyle(fontSize: 18),),
            Text("Resto Express", style: GoogleFonts.ptSerif(fontSize: 20, fontWeight: FontWeight.bold),),
            Text("Choisis ton restaurant préféré", style: GoogleFonts.ptSerif(fontSize: 18),),

            (searchController.text.isEmpty)
                ?
            SingleChildScrollView(
              child: Column(
                children: [


                  StreamBuilder<QuerySnapshot>(
                      stream: _lastEventStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if(snapshot.hasData)
                        {

                          return ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                              Restaurant resto =  Restaurant(

                                userUID: data['userUID'],
                                uid: data['uid'],
                                slogant: data['slogant'],
                                activer: data['activer'],
                                cartegory: data['cartegory'],
                                name: data['name'],
                                nameChef: data['chefName'],
                                registre_commerce: data['RCCM'],
                                like_counpteur: data['like_counpteur'],
                                date_ajout: data['date_ajout'].toString(),

                              )  ;

                              if(resto.cartegory == Chaines.CONST_EXPRESS)
                                return


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(Radius.circular(10.0) ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(data['name'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Container(
                                                  height: MediaQuery.of(context).size.height * 0.19,
                                                  width: MediaQuery.of(context).size.height * 0.25,
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
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.4,
                                                          height:MediaQuery.of(context).size.height * 0.095,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(data['slogant']
                                                                      ,overflow: TextOverflow.ellipsis,maxLines: 3,style:  GoogleFonts.ptSerif( )),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text("Chef : ", style: TextStyle(fontWeight: FontWeight.bold),),
                                                                  Text(data['chefName']
                                                                      ,overflow: TextOverflow.ellipsis,maxLines: 3,style:  GoogleFonts.ptSerif( )),

                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(right: 5),
                                                                      child: CircularPercentIndicator(
                                                                        radius: 22.0,
                                                                        lineWidth: 5.0,
                                                                        percent: 0.65,
                                                                        center: new Text("65%", style: TextStyle(fontSize: 8),),
                                                                        progressColor: Colors.green,
                                                                      ),
                                                                    ),
                                                                  ),   CircularPercentIndicator(
                                                                    radius: 22.0,
                                                                    lineWidth: 5.0,
                                                                    percent: 0.25,
                                                                    center: new Text("25%", style: TextStyle(fontSize: 8),),
                                                                    progressColor: Colors.orange,
                                                                  ),Padding(
                                                                    padding: const EdgeInsets.only(left: 5),
                                                                    child: CircularPercentIndicator(
                                                                      radius: 22.0,
                                                                      lineWidth: 5.0,
                                                                      percent: 0.1,
                                                                      center: new Text("10%", style: TextStyle(fontSize: 8),),
                                                                      progressColor: Colors.red,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                            ],
                                                          )),
                                                    ),

                                                    restaurantButtonDecouvrir(restaurant: resto),

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );

                              else
                                return Container();
                            }).toList(),
                          );

                        }

                        return  Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top:  10.0),
                            child: CupertinoActivityIndicator(
                              animating: true,
                              radius: MediaQuery.of(context).size.width *0.08,
                            ),
                          ),
                        );
                      }
                  ),

                ],
              ),
            )
                :
            SingleChildScrollView(
              child: Column(
                children: [


                  StreamBuilder<QuerySnapshot>(
                      stream: _lastEventStream,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if(snapshot.hasData)
                        {

                          return ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data!.docs.where((element) => element["searchResto"].contains(searchController.text.toLowerCase())).map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

                              Restaurant resto =  Restaurant(

                                userUID: data['userUID'],
                                uid: data['uid'],
                                slogant: data['slogant'],
                                activer: data['activer'],
                                cartegory: data['cartegory'],
                                name: data['name'],
                                nameChef: data['chefName'],
                                registre_commerce: data['RCCM'],
                                like_counpteur: data['like_counpteur'],
                                date_ajout: data['date_ajout'].toString(),

                              )  ;

                              if(resto.cartegory == Chaines.CONST_EXPRESS)
                                return


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(Radius.circular(10.0) ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(data['name'],style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Container(
                                                  height: MediaQuery.of(context).size.height * 0.19,
                                                  width: MediaQuery.of(context).size.height * 0.25,
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
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                          width: MediaQuery.of(context).size.width * 0.4,
                                                          height:MediaQuery.of(context).size.height * 0.095,
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(data['slogant']
                                                                      ,overflow: TextOverflow.ellipsis,maxLines: 3,style:  GoogleFonts.ptSerif( )),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text("Chef : ", style: TextStyle(fontWeight: FontWeight.bold),),
                                                                  Text(data['chefName']
                                                                      ,overflow: TextOverflow.ellipsis,maxLines: 3,style:  GoogleFonts.ptSerif( )),

                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.only(right: 5),
                                                                      child: CircularPercentIndicator(
                                                                        radius: 22.0,
                                                                        lineWidth: 5.0,
                                                                        percent: 0.65,
                                                                        center: new Text("65%", style: TextStyle(fontSize: 8),),
                                                                        progressColor: Colors.green,
                                                                      ),
                                                                    ),
                                                                  ),   CircularPercentIndicator(
                                                                    radius: 22.0,
                                                                    lineWidth: 5.0,
                                                                    percent: 0.25,
                                                                    center: new Text("25%", style: TextStyle(fontSize: 8),),
                                                                    progressColor: Colors.orange,
                                                                  ),Padding(
                                                                    padding: const EdgeInsets.only(left: 5),
                                                                    child: CircularPercentIndicator(
                                                                      radius: 22.0,
                                                                      lineWidth: 5.0,
                                                                      percent: 0.1,
                                                                      center: new Text("10%", style: TextStyle(fontSize: 8),),
                                                                      progressColor: Colors.red,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                            ],
                                                          )),
                                                    ),

                                                    restaurantButtonDecouvrir(restaurant: resto),

                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );

                              else
                                return Container();
                            }).toList(),
                          );

                        }

                        return  Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top:  10.0),
                            child: CupertinoActivityIndicator(
                              animating: true,
                              radius: MediaQuery.of(context).size.width *0.08,
                            ),
                          ),
                        );
                      }
                  ),

                ],
              ),
            ),

             /* ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child:  BottomHomeRestaurantExpress()),
                      );

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Text("RESTAURANT LE TRIOMPHE",style:  GoogleFonts.shizuru(fontSize: 20, fontWeight: FontWeight.w900),),
                            SizedBox(height: 10,),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.19,
                                    width: MediaQuery.of(context).size.height * 0.25,
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            height:MediaQuery.of(context).size.height * 0.085,
                                            child: Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est."
                                            ,overflow: TextOverflow.ellipsis,maxLines: 3,style:  GoogleFonts.ptSerif( ))),
                                      ),

                                      restaurantButtonDecouvrir(),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),*/


          ],

        ),
      ),

      // Hide floatinActionButton when keyboard is open
     /* floatingActionButton:   (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0) ? Container() : ElevatedButton.icon(
        icon: Icon(Icons.thumb_up, color: Colors.red,),
        label: Text(Chaines.devenir_partenaire, style: TextStyle(color: Couleurs.black),),
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                child:  PartRestauration()),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          primary: Couleurs.buttonPageRetaurantColors,
        ),
      ),*/
    );
  }

  // Widget Retaurant Button
  Widget restaurantButtonDecouvrir ({ required Restaurant restaurant}){

    return   Padding(
      padding: const EdgeInsets.all(08.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.4,
          height:  MediaQuery.of(context).size.height * 0.045,),

        child: ElevatedButton(

          onPressed: (){

              Navigator.push(
                context,

                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:  BottomHomeRestaurantExpress(restaurant: restaurant,)),
              );
          },

          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // <-- Radius
            ),
            primary: Couleurs.buttonPageRetaurantColors,
          ),
          child: Text("Découvrir", style: TextStyle(color: Colors.black),),

        ),
      ),
    );
  }
}
