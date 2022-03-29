import 'package:assouka_publique/page/login/auth/forgot_pasword.dart';
import 'package:assouka_publique/page/login/auth/registration_screen.dart';
import 'package:assouka_publique/page/login/utilities/firebase_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;

  var _formkey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text("Connexion", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightGreenAccent,
      ),*/
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
                              hintText: "Entrez votre Password",
                              labelText: "Mots de passe",
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
                              login();
                            },
                            child: Text(
                              "Connecter",
                            ),
                            textColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.lightGreenAccent,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegistrationScreen()));
                            },
                            child: Text(
                              "S'enregister",
                            ),
                            textColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Text("Mots de passe oublié ?")),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ForgotPasswordScreen()));
                          },
                        )
                      ],
                    )),
              ),
            ),
    );
  }

  void login() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((user) async {
        // sign up
        setState(() {
          isLoading = false;
        });

        Fluttertoast.showToast(msg: "Login Success");

      //  await FirebaseUtils.updateFirebaseToken();

        /*
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
            (Route<dynamic> route) => false);
        */

      }).catchError((onError) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "error " + onError.toString());
      });
    }
  }
}
