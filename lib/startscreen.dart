import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 117, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game Title Image
            // Egg picture
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/htp");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(25),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                foregroundColor: Color.fromRGBO(254, 254, 91, 1),
              ),
              child: Text("How to Play", style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 76, 160, 1)),),
            ),
          ],
        ),
      ),
    );
  }
}