import 'package:assouka_publique/Data/caroussel.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsADessert.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsAEntree.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsAResistants.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsBApperitif.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsBResistants.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsGAmuseBouche.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsGApperitif.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsGDessert.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsGEntree.dart';
import 'package:assouka_publique/page/restaurant/evenementiel/selectionMetsGResistants.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class DetailsEvennement extends StatefulWidget {
  @override
  _DetailsEvennementState createState() => _DetailsEvennementState();
}

class _DetailsEvennementState extends State<DetailsEvennement> {
  static ValueNotifier<String> enteredValue = ValueNotifier('');
  String foos = 'One';

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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        //  color: Colors.green[100],
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width-MediaQuery.of(context).size.width/4,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Recherche des mets',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(5)),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Couleurs.buttonPageRetaurantColors,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                //  topRight: Radius.circular(5.0),
                                //  bottomRight: Radius.circular( 5.0),
                                bottomLeft: Radius.circular( 5.0)

                            )
                        ),

                      ),
                      Container(child: Icon(Icons.search),
                        width: 40, height: 50,// color: Colors.green[100],
                        decoration: BoxDecoration(
                            color: Couleurs.buttonPageRetaurantColors,
                            borderRadius: BorderRadius.only(
                              //  topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular( 5.0),
                              //  bottomLeft: Radius.circular( 5.0)

                            )
                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  ComplicatedImageDemo(),
                  ValueListenableBuilder(valueListenable: enteredValue,
                      builder: (BuildContext context, String newValue, Widget? child){
                    return Text(newValue,);
                  }),
                  Row(
                    children: [

                      Container(margin: EdgeInsets.all(10.0),child: Text("Anniversaire", style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold),)),
                    ],
                  ),

           

                  // Gold
                  ExpansionTile(
                    title: Text(
                      'Gold',style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsGAmuseBouche()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Amuse Bouche",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsGApperitif()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Appéritif",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsGEntree()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Entrée",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                  context,
                                  PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child:  SelectionMetsGResistant()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Résistant",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsGDessert()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Déssert",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),


                  // Argent
                  ExpansionTile(
                    title: Text(
                      'Argent',style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                    children: <Widget>[
                      ListTile(
                        title: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsAEntree()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Entrée",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsAResistant()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Résistant",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsADessert()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Déssert",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  // Bronze
                  ExpansionTile(
                    title: Text(
                      'Bronze',style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                    children: <Widget>[
                      ListTile(
                        title: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsBApperitif()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Apéritif",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child:  SelectionMetsBResistant()),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35 ,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0) //                 <--- border radius here
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/amuseBouche.jpeg"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("Résistant",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                                                  ],
                                                ),
                                                Text("La question des amuse-bouches est plus essentielle qu'elle n'en a l'air...")
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),


                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          /*        new AppExpansionTile(
                      key: expansionTile,
                      title: new Text(this.foos),
                      backgroundColor: Theme
                          .of(context)
                          .accentColor
                          .withOpacity(0.025),
                      children: <Widget>[
                        new ListTile(
                          title: const Text('One'),
                          onTap: () {
                            setState(() {
                              this.foos = 'One';
                              expansionTile.currentState!.collapse();
                            });
                          },
                        ),
                        new ListTile(
                          title: const Text('Two'),
                          onTap: () {
                            setState(() {
                              this.foos = 'Two';
                              expansionTile.currentState!.collapse();
                            });
                          },
                        ),
                        new ListTile(
                          title: const Text('Three'),
                          onTap: () {
                            setState(() {
                              this.foos = 'Three';
                              expansionTile.currentState!.collapse();
                            });
                          },
                        ),
                      ]
                  ),
                  new AppExpansionTile(
                      key: expansionTileD,
                      title: new Text(this.foos),
                      backgroundColor: Theme
                          .of(context)
                          .accentColor
                          .withOpacity(0.025),
                      children: <Widget>[
                        new ListTile(
                          title: const Text('One'),
                          onTap: () {
                            setState(() {
                              this.foos = 'One';
                              expansionTileD.currentState!.collapse();
                            });
                          },
                        ),
                        new ListTile(
                          title: const Text('Two'),
                          onTap: () {
                            setState(() {
                              this.foos = 'Two';
                              expansionTileD.currentState!.collapse();
                            });
                          },
                        ),
                        new ListTile(
                          title: const Text('Three'),
                          onTap: () {
                            setState(() {
                              this.foos = 'Three';
                              expansionTileD.currentState!.collapse();
                            });
                          },
                        ),
                      ]
                  ),*/
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

const Duration _kExpand = const Duration(milliseconds: 200);

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    Key? key,
     this.leading,
    required this.title,
    required this.backgroundColor,
     this.onExpansionChanged,
    this.children: const <Widget>[],
     this.trailing,
    this.initiallyExpanded: false,
  })
      : assert(initiallyExpanded != null),
        super(key: key);

  final Widget? leading;
  final Widget title;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color backgroundColor;
  final Widget? trailing;
  final bool initiallyExpanded;

  @override
  AppExpansionTileState createState() => new AppExpansionTileState();
}

class AppExpansionTileState extends State<AppExpansionTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _easeOutAnimation;
  late CurvedAnimation _easeInAnimation;
  late ColorTween _borderColor;
  late ColorTween _headerColor;
  late ColorTween _iconColor;
  late ColorTween _backgroundColor;
  late Animation<double> _iconTurns;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(duration: _kExpand, vsync: this);
    _easeOutAnimation = new CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _easeInAnimation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = new ColorTween();
    _headerColor = new ColorTween();
    _iconColor = new ColorTween();
    _iconTurns = new Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation);
    _backgroundColor = new ColorTween();

    _isExpanded = PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded)
      _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    _setExpanded(true);
  }

  void collapse() {
    _setExpanded(false);
  }

  void toggle() {
    _setExpanded(!_isExpanded);
  }

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded)
          _controller.forward();
        else
          _controller.reverse().then<void>((void value) {
            setState(() {
              // Rebuild without widget.children.
            });
          });
        PageStorage.of(context)?.writeState(context, _isExpanded);
      });
      if (widget.onExpansionChanged != null) {
        widget.onExpansionChanged!(_isExpanded);
      }
    }
  }

  Widget _buildChildren (BuildContext context, Widget child) {
    final Color borderSideColor = _borderColor.evaluate(_easeOutAnimation) ?? Colors.transparent;
    final Color? titleColor = _headerColor.evaluate(_easeInAnimation);

    return new Container(
      decoration: new BoxDecoration(
          color: _backgroundColor.evaluate(_easeOutAnimation) ?? Colors.transparent,
          border: new Border(
            top: new BorderSide(color: borderSideColor),
            bottom: new BorderSide(color: borderSideColor),
          )
      ),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme.merge(
            data: new IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
            child: new ListTile(
              onTap: toggle,
              leading: widget.leading,
              title: new DefaultTextStyle(
                style: Theme
                    .of(context)
                    .textTheme
                    .subhead!
                    .copyWith(color: titleColor),
                child: widget.title,
              ),
              trailing: widget.trailing ?? new RotationTransition(
                turns: _iconTurns,
                child: const Icon(Icons.expand_more),
              ),
            ),
          ),
          new ClipRect(
            child: new Align(
              heightFactor: _easeInAnimation.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.subhead!.color
      ..end = theme.accentColor;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColor.end = widget.backgroundColor;

    final bool closed = !_isExpanded && _controller.isDismissed;
    return new AnimatedBuilder(
      animation: _controller.view,
     // builder: _buildChildre is Widget,
      builder: (BuildContext context, Widget? child) {
        final Color borderSideColor = _borderColor.evaluate(_easeOutAnimation) ?? Colors.transparent;
      final Color? titleColor = _headerColor.evaluate(_easeInAnimation);

      return new Container(
        decoration: new BoxDecoration(
            color: _backgroundColor.evaluate(_easeOutAnimation) ?? Colors.transparent,
            border: new Border(
              top: new BorderSide(color: borderSideColor),
              bottom: new BorderSide(color: borderSideColor),
            )
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconTheme.merge(
              data: new IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
              child: new ListTile(
                onTap: toggle,
                leading: widget.leading,
                title: new DefaultTextStyle(
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead!
                      .copyWith(color: titleColor),
                  child: widget.title,
                ),
                trailing: widget.trailing ?? new RotationTransition(
                  turns: _iconTurns,
                  child: const Icon(Icons.expand_more),
                ),
              ),
            ),
            new ClipRect(
              child: new Align(
                heightFactor: _easeInAnimation.value,
                child: child,
              ),
            ),
          ],
        ),
      ); },
      child: closed ? null : new Column(children: widget.children),
    );
  }
}
*/
