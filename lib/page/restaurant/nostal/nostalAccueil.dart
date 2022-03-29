import 'package:assouka_publique/Data/caroussel.dart';
import 'package:assouka_publique/model/restaurant.dart';
import 'package:assouka_publique/page/restaurant/nostal/metsNostal.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class AccueilNostal extends StatefulWidget {
  @override
  _AccueilNostalState createState() => _AccueilNostalState();
}

class _AccueilNostalState extends State<AccueilNostal> {
  final Stream<QuerySnapshot> _lastEventStream = FirebaseFirestore.instance.collection(Chaines.restaurant_Collection).orderBy("timestamp", descending: true).limit(30).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        //    title: Text("", style: TextStyle(color: Couleurs.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Resto nostal", style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold),),
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

                              Restaurant resto = new Restaurant(

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

                              if(resto.cartegory == Chaines.CONST_NOSTAL)
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
                                                          height:MediaQuery.of(context).size.height * 0.085,
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
           /* Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){

                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child:  MetsNostal()),
                        //    child:  Partenariat2()),
                      );


                    },
                    child:

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20),
                      child: Container(
                        child: Column(
                          children: [


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
                                  SizedBox(width: 05,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/2.2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text("NOM DU PARTICULIER",maxLines: 3,overflow: TextOverflow.ellipsis, style:  GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.w900),),
                                        Text("Parakou est une ville du nord benin,Parakou est une ville du nord benin,Parakou est une ville du nord beninParakou est une ville du nord beninParakou est une ville du nord benin Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est."
                                            ,overflow: TextOverflow.ellipsis,maxLines: 4,style:  GoogleFonts.aBeeZee()),


                                      ],
                                    ),
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
              ),
            ),*/
          ],
        ),
      ),
    );
  }
  Widget restaurantButtonDecouvrir ({ required Restaurant restaurant}){

    return   Padding(
      padding: const EdgeInsets.all(08.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width * 0.4,
          height:  MediaQuery.of(context).size.height * 0.06,),

        child: ElevatedButton(

          onPressed: (){

            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child:  MetsNostal(restaurant: restaurant,)),
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
