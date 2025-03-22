import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Minigame());
}

// Position variables
double xPos = 0;
double yPos = 0;

// Function to generate new coin location
// void newCoin(Timer timer) async {
//   xPos = Random().nextDouble() * 250;
//   yPos = Random().nextDouble() * 425;
// }

class Minigame extends StatefulWidget {
  const Minigame({super.key});

  @override
  State<Minigame> createState() => _MinigameState();
}

class _MinigameState extends State<Minigame> {

  // Variable to store score
  int score = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          xPos = Random().nextDouble() * 250;
          yPos = Random().nextDouble() * 425;
        });
      }
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              // Score label
              Positioned(left: 20, top: 30, child: Text("SCORE: $score")),
              Positioned(
                left: xPos,
                bottom: yPos,
                child: GestureDetector(
                  onTap: () {
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
          backgroundColor: Colors.pink,
        ),
      )
    );
  }
}
  