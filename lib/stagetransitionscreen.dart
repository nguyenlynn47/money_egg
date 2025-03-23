import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:money_egg/main.dart';

class StageTransitionScreen extends StatelessWidget {
  const StageTransitionScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 117, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Text("Your pet has developed its own spending habits and is now evolving...\n\nPress the star to evolve it and see its spending personality...", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Color.fromRGBO(254, 76, 160, 1))),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (buyCount > saveCount) {
                  scale = 3;
                  type = "Spender!\n\nEgg is now a compulsive spender and is irresponsible with its money.";
                  typeImage = "https://i.imgur.com/QBlTSZF.png";
                }
                else if (saveCount > buyCount) {
                  scale = 3;
                  type = "Saver!\n\nEgg is now a responsible saver and knows how to budget.";
                  typeImage = "https://i.imgur.com/JqwA9bj.png";
                }
                else {
                  scale = 3;
                  type = "Saver!\n\nEgg is now a responsible saver and knows how to budget.";
                  typeImage = "https://i.imgur.com/JqwA9bj.png";
                }
                Navigator.pushReplacementNamed(context, "/evolved");
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(40),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
              ),
              child: Icon(Symbols.star_shine, size: 150, color: Color.fromRGBO(254, 76, 160, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
