import 'package:flutter/material.dart';

void goToStage2(BuildContext context) {
  Navigator.pushReplacementNamed(context, "/event");
}

class EvolvedScreen extends StatelessWidget {
  const EvolvedScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                goToStage2(context);
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(50),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
              ),
              child: Icon(Icons.arrow_forward, size: 110, color: Color.fromRGBO(254, 76, 160, 1)),
            ),
          ],
        ),
      ),
    );
  }
}