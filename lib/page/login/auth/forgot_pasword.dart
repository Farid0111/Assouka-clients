import 'package:assouka_publique/ressources/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mot de passe oublié", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        backgroundColor: Couleurs.buttonPageRetaurantColors,
        //backgroundColor: Colors.lightGreenAccent,
      ),

     /* appBar: AppBar(
        title: Text("Mot de passe oublié" ,style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        //    title: Text("", style: TextStyle(color: Couleurs.black),),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),*/

      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter Email",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Couleurs.buttonPageRetaurantColors,
                onPressed: () {
                  resetPassword(context);
                },
                child: Text(
                  "Réinitialiser le mot de passe",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (editController.text.length == 0 || !editController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: editController.text);
    Fluttertoast.showToast(
        msg:
            "Reset password link has sent your mail please use it to change the password.");
    Navigator.pop(context);
  }
}
