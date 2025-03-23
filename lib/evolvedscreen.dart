import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

void goToStage2(BuildContext context) {
  Navigator.pushReplacementNamed(context, "/event");
}

class EvolvedScreen extends StatelessWidget {
  const EvolvedScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 117, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(typeImage, scale: 3),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Text("Egg has evolved into a $type", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Color.fromRGBO(254, 76, 160, 1))),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                goToStage2(context);
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(30),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
              ),
              child: Icon(Icons.arrow_forward, size: 90, color: Color.fromRGBO(254, 76, 160, 1)),
            ),
          ],
        ),
      ),
    );
  }
}