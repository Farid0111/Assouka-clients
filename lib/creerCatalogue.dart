import 'package:assouka_publique/page/restaurant/pageAccueilRestau.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:assouka_publique/ressources/Strings.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CreerCatalogue extends StatefulWidget {
  @override
  _CreerCatalogueState createState() => _CreerCatalogueState();
}

class _CreerCatalogueState extends State<CreerCatalogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: Text(Chaines.catalogue, style: TextStyle(color: Couleurs.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),

      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Text("CREER VOTRE CATALOGUE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Images de présentation", style: TextStyle(fontSize: 20),),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1.0,
                          spreadRadius: 1,
                          offset: Offset(0, 0.0),
                        ),
                      ]),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width-30,
                    height: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60, right: 40),
                            child: Text("Ajoutez au plus trois images", style: TextStyle(fontSize: 18),),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                              child:
                            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.drive_folder_upload, size: 100,color: Colors.green,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.drive_folder_upload, size: 100,color: Colors.green,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.drive_folder_upload, size: 100,color: Colors.green,),
                              )
                            ],
                          )
                    ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Catégories de mets", style: TextStyle(fontSize: 20),),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1.0,
                          spreadRadius: 1,
                          offset: Offset(0, 0.0),
                        ),
                      ]),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width-30,
                    height: 980,
                    child: Column(
                      children: [

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text("Titre", style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                padding: const EdgeInsets.all(5),
                                width: 300,
                                height: 40,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: '',
                                    labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 1
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text("Mets Nº1", style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 1.0,
                                        spreadRadius: 1,
                                        offset: Offset(0, 0.0),
                                      ),
                                    ]),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width-150,
                                  height: 290,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.add_box_rounded, color: Colors.green,),
                                                Text("Image", style: TextStyle(color: Colors.grey),)
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/restaurant.png',
                                                height: 70.0,
                                                width: 70.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 200,
                                              height: 40,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 200,
                                              height: 40,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 150,
                                              height: 100,
                                              child: TextFormField(
                                                keyboardType: TextInputType.multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 2
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text("Mets Nº2", style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 1.0,
                                        spreadRadius: 1,
                                        offset: Offset(0, 0.0),
                                      ),
                                    ]),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width-150,
                                  height: 290,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.add_box_rounded, color: Colors.green,),
                                                Text("Image", style: TextStyle(color: Colors.grey),)
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/restaurant.png',
                                                height: 70.0,
                                                width: 70.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 200,
                                              height: 40,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 200,
                                              height: 40,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 150,
                                              height: 100,
                                              child: TextFormField(
                                                keyboardType: TextInputType.multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 3
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text("Mets Nº3", style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 1.0,
                                        spreadRadius: 1,
                                        offset: Offset(0, 0.0),
                                      ),
                                    ]),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width-150,
                                  height: 290,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.add_box_rounded, color: Colors.green,),
                                                Text("Image", style: TextStyle(color: Colors.grey),)
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/restaurant.png',
                                                height: 70.0,
                                                width: 70.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 200,
                                              height: 40,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 200,
                                              height: 40,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              width: 150,
                                              height: 100,
                                              child: TextFormField(
                                                keyboardType: TextInputType.multiline,
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                  labelText: '',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(5)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /*
                        Row(
                          children: [
                            Text("Mets Nº2", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 1.0,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.0),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width-150,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add_box_rounded, color: Colors.green,),
                                            Text("Image", style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/restaurant.png',
                                            height: 70.0,
                                            width: 70.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 150,
                                          height: 100,
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Mets Nº3", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 1.0,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.0),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width-150,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add_box_rounded, color: Colors.green,),
                                            Text("Image", style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/restaurant.png',
                                            height: 70.0,
                                            width: 70.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 150,
                                          height: 100,
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        */
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Catégories de boissons", style: TextStyle(fontSize: 20),),
                ),
                /*
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 1.0,
                          spreadRadius: 1,
                          offset: Offset(0, 0.0),
                        ),
                      ]),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width-30,
                    height: 980,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Titre", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: 300,
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: '',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Boisson Nº1", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 1.0,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.0),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width-150,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add_box_rounded, color: Colors.green,),
                                            Text("Image", style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/restaurant.png',
                                            height: 70.0,
                                            width: 70.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 150,
                                          height: 100,
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                              Text("Boisson Nº2", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 1.0,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.0),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width-150,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add_box_rounded, color: Colors.green,),
                                            Text("Image", style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/restaurant.png',
                                            height: 70.0,
                                            width: 70.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 150,
                                          height: 100,
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Boisson Nº3", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 1.0,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.0),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width-150,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add_box_rounded, color: Colors.green,),
                                            Text("Image", style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/restaurant.png',
                                            height: 70.0,
                                            width: 70.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 150,
                                          height: 100,
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                */
                containneur(titre: "Boisson"),

                /*
                FlatButton(onPressed: (){ var route = MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PageAccueil());
                Navigator.of(context).push(route);
                }, child: Text("Suivant", style: TextStyle(fontSize: 18),), color: Colors.green,minWidth: 200,height: 40,)
*/

                Container(
                  padding: EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height:  MediaQuery.of(context).size.height * 0.08,),
                    child: ElevatedButton.icon(

                      label: Text( Chaines.suivant, style: TextStyle(color: Couleurs.black),),
                      icon: Icon(Icons.arrow_forward, color: Colors.black,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child:  PageAccueil(restaurant: null,)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Couleurs.buttonPageRetaurantColors,
                        //  primary: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget containneur({ required String titre}){
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 1.0,
              spreadRadius: 1,
              offset: Offset(0, 0.0),
            ),
          ]),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width-30,
        height: 980,
        child: Column(
          children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text("Titre", style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: '',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 1
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(titre+" Nº1", style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 1.0,
                            spreadRadius: 1,
                            offset: Offset(0, 0.0),
                          ),
                        ]),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width-150,
                      height: 290,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.add_box_rounded, color: Colors.green,),
                                    Text("Image", style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/restaurant.png',
                                    height: 70.0,
                                    width: 70.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 150,
                                  height: 100,
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 2
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(titre+" Nº2", style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 1.0,
                            spreadRadius: 1,
                            offset: Offset(0, 0.0),
                          ),
                        ]),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width-150,
                      height: 290,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.add_box_rounded, color: Colors.green,),
                                    Text("Image", style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/restaurant.png',
                                    height: 70.0,
                                    width: 70.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 150,
                                  height: 100,
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(titre+" Nº3", style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 1.0,
                            spreadRadius: 1,
                            offset: Offset(0, 0.0),
                          ),
                        ]),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width-150,
                      height: 290,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.add_box_rounded, color: Colors.green,),
                                    Text("Image", style: TextStyle(color: Colors.grey),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/restaurant.png',
                                    height: 70.0,
                                    width: 70.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 200,
                                  height: 40,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  width: 150,
                                  height: 100,
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      labelText: '',
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*
                        Row(
                          children: [
                            Text("Mets Nº2", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 1.0,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.0),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width-150,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add_box_rounded, color: Colors.green,),
                                            Text("Image", style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/restaurant.png',
                                            height: 70.0,
                                            width: 70.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 150,
                                          height: 100,
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Mets Nº3", style: TextStyle(fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 1.0,
                                      spreadRadius: 1,
                                      offset: Offset(0, 0.0),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width-150,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.add_box_rounded, color: Colors.green,),
                                            Text("Image", style: TextStyle(color: Colors.grey),)
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/images/restaurant.png',
                                            height: 70.0,
                                            width: 70.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Nom", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Prix ", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 200,
                                          height: 40,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          width: 150,
                                          height: 100,
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              labelText: '',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        */
          ],
        ),
      ),
    );
  }
}
