import 'package:assouka_publique/backend/splash.dart';
import 'package:assouka_publique/page/restaurant/pageRestaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*void main() {
  runApp(const MyApp());
}*/


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
  // initializeDateFormatting().then((_) => runApp(MyApp()));

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });

/*
      // Crash analytique
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(true);


 */
      // Firestor
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      FirebaseApp secondaryApp = Firebase.app();
      firestore = FirebaseFirestore.instanceFor(app: secondaryApp);

      // All other platforms.
      FirebaseFirestore.instance.settings =
          Settings(persistenceEnabled: true);


    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    // Flutter init
    initializeFlutterFire();

    // changeStatusColor(Colors.red);
    // Change Status Bar Colors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //  statusBarColor: Colors.yellow
      //  statusBarColor: Couleurs.corlor_app_green
    ));


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Flutter init

    // Show error message if initialization failed
    if(_error) {
      // return Container(child: SomethingWentWrong());
      return Container(color: Colors.white,child: SomethingWentWrong());
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      //  return Container(child: Loading());
      return Container(color: Colors.white ,child: Loading()
      );
    }




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASSOUKA',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: Splash(),
     // home: PageRestaurantEx(),
    );
  }

  Widget SomethingWentWrong() {
    print ("Firebase init Error");
    return (Container());
  }

  Widget Loading() {
    print ("Firebase init en cours");
    return (Container());
  }
}



