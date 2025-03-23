import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

void nextDay(BuildContext context) {
  day++;
  hp -= 15;
  actionCount = 2;
  paymentDueDate--;
  if (hp <= 0) {
    endMessage = "Oh no...\n\nEgg starved to death because of lack of financial awareness...";
    Navigator.pushReplacementNamed(context, "/end");
  }
  else if (paymentDueDate == 0) {
    if (day == 11) {
      paymentDueDate = 2;
    }
    else {
      paymentDueDate = 3;
    }
    Navigator.pushReplacementNamed(context, "/payment");
  }
  else if (day == 14) {
    if (debt > 0 && bal > debt) {
      endMessage = "Congratulations!\n\nEgg saved enough money to pay off the rest of the debt.\n\nCan you save even more money next time?";
    }
    else if (debt > 0) {
      endMessage = "Oh no...\n\nEgg wasn't able to pay off the debt in time, and the government had to seize its home.\n\nLet's try to practice good saving and spending habits so that Egg learns how to be financially aware next time.";
    }
    Navigator.pushReplacementNamed(context, "/end");
  }
  else if (day == 7) {
    Navigator.pushReplacementNamed(context, "/stage1end");
  }
  else if (day < 14) {
    Navigator.pushReplacementNamed(context, "/event");
  }
  else {
    Navigator.pushReplacementNamed(context, "/end");
  }
}

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 55,
              child: Container(
                color: Color.fromRGBO(200, 244, 255, 1),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Day ${day + 1}", style: TextStyle(fontSize: 24, color: Color.fromRGBO(32, 90, 234, 1))),
                            ],
                          ),
                          Column(
                            children: [
                              Text("HP: $hp", style: TextStyle(fontSize: 24, color: Color.fromRGBO(32, 90, 234, 1))),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Payment due in $paymentDueDate days", style: TextStyle(fontSize: 24, color: Color.fromRGBO(32, 90, 234, 1))),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Balance: \$$bal", style: TextStyle(fontSize: 24, color: Color.fromRGBO(32, 90, 234, 1))),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text("Debt: \$$debt", style: TextStyle(fontSize: 24, color: Color.fromRGBO(32, 90, 234, 1))),
                            ],
                          ),
                        ],
                      ),
                    ],
                    // Image of pet
                    // Collection button in corner
                  ),
                ),
              )
            ),
            Expanded(
              flex: 45,
              child: Container(
                color: Color.fromRGBO(236, 192, 250, 1),
                child: Center(
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
                          child: Text("Go to the next day", style: TextStyle(fontSize: 30, color: Color.fromRGBO(32, 90, 234, 1))),
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          nextDay(context);
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
              ),
            ),
          ],
        )
      ),
    );
  }
}