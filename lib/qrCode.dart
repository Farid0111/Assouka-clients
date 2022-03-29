import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
 final _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logo/arr.jpeg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
            //  color: Colors.black
          ),

          elevation: 0.0,
          backgroundColor: Colors.transparent,

        ),
        body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 220),
              child: Column(
                children: [
                  Text("Capturez votre code", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: Colors.white),),
                  Text("Veuillez faire la capture de votre code QR", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),

            Screenshot(
              controller: _screenshotController,
              child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        QrImage(
                          data: "123456789000000",
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                        Text(
                          'Votre preuve de payement',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: TextButton(
                child: Text('Prendre une capture'),
                onPressed: _takeScreenshot,
              ),
            )
          ],
        ),
        ),
      ),
    );
  }

 void _takeScreenshot() async {
   final imageFile = await _screenshotController.capture();
   Share.shareFiles(['${imageFile}/image.jpg'], text: "Shared from #SexyFlutterApp");
 }
}
