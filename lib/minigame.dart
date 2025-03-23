import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

void main() {
  runApp(const MinigameScreen());
}

// Position variables
double xPos = Random().nextDouble() * 250;
double yPos = Random().nextDouble() * 425;

class MinigameScreen extends StatefulWidget {
  const MinigameScreen({super.key});

  @override
  State<MinigameScreen> createState() => _MinigameScreenState();
}

class _MinigameScreenState extends State<MinigameScreen> {

  // Variable to store score
  int score = 0;
  Timer? timer;

  @override
  void initState() {
    Timer(Duration(seconds: 10), () {
      bal += score;
      if (actionCount == 1) {
        Navigator.pushReplacementNamed(context, "/actions");
      }
      else {
        Navigator.pushReplacementNamed(context, "/next");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              // Score label
              Positioned(
                left: 20,
                top: 30,
                child: Text("SCORE: $score",
                  style: TextStyle(fontSize: 24, color: Color.fromRGBO(32, 90, 234, 1)),)),
              Positioned(
                left: xPos,
                bottom: yPos,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      xPos = Random().nextDouble() * 250;
                      yPos = Random().nextDouble() * 425;
                    });
                    // Update score/income
                    score = score + 10;
                  },
                  child: Image.asset('assets/coin.png',
                    fit: BoxFit.cover,
                    height: 80,
                  ),
                ),
              ),
            ]
          ),
          backgroundColor: Color.fromRGBO(200, 244, 255, 1),
        ),
      )
    );
  }
}
  