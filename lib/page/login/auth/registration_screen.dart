import 'package:assouka_publique/page/login/auth/login_screen.dart';
import 'package:assouka_publique/page/login/model/user_model.dart';
import 'package:assouka_publique/page/login/utilities/firebase_utils.dart';
import 'package:assouka_publique/ressources/Colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email, _password, _name, _mobile;

  var _formkey = GlobalKey<FormState>();

  bool autoValidate = false;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("S'enregistrer", style: TextStyle(color: Colors.black),),
        backgroundColor: Couleurs.buttonPageRetaurantColors,
        //backgroundColor: Colors.lightGreenAccent,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (item) {
                            return item!.length > 0 ? null : "Enter valid Name";
                          },
                          onChanged: (item) {
                            setState(() {
                              _name = item;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              labelText: "Name",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          validator: (item) {
                            return item!.length < 10
                                ? "Enter valid Mobile"
                                : null;
                          },
                          onChanged: (item) {
                            setState(() {
                              _mobile = item;
                            });
                          },
                       /*   inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],*/
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              labelText: "Mobile Number",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (item) {
                            return item!.contains("@")
                                ? null
                                : "Enter valid Email";
                          },
                          onChanged: (item) {
                            setState(() {
                              _email = item;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Email",
                              labelText: "Email",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          validator: (item) {
                            return item!.length > 6
                                ? null
                                : "Password must be 6 characters";
                          },
                          onChanged: (item) {
                            setState(() {
                              _password = item;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.lightGreenAccent,
                            onPressed: () {
                              signup();
                            },
                            child: Text(
                              "S'enregister",
                            ),
                            textColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()));
                              },
                              child: Text("Se connecter ici")),
                          alignment: Alignment.centerRight,
                        )
                      ],
                    )),
              ),
            ),
    );
  }

  void signup() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      setState(() {
        autoValidate = false;
      });
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        // sign up
        postUserDataToDb();
      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  void postUserDataToDb() async {
    setState(() {
      isLoading = true;
    });

    //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    User? firebaseUser = FirebaseAuth.instance.currentUser;

    UserModel userModel = new UserModel();
    userModel.email = _email;
    userModel.name = _name;
    userModel.mobileNumber = _mobile;
    userModel.uid = firebaseUser!.uid;

    // await FireStore.instance
    //     .collection("user")
    //     .document(firebaseUser.uid)
    //     .setData(userModel.toMap());

    await FirebaseFirestore.instance
        .collection("user")
        .doc(firebaseUser.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Register Success");

  //  await FirebaseUtils.updateFirebaseToken();

    sendVerificationEmail();

    setState(() {
      isLoading = false;
    });
  }

  void sendVerificationEmail() async {
    //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser!.sendEmailVerification();

    Fluttertoast.showToast(
        msg: "email verifcation link has sent to your email.");

   /* Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
        (Route<dynamic> route) => false);*/


  }
}
