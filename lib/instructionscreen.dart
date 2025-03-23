import 'package:flutter/material.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 117, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // How to Play/Objectives
            // Instructions
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/event");
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(50),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
              ),
              child: Text("START", style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 76, 160, 1)),),
            ),
          ],
        ),
      ),
    );
  }
}