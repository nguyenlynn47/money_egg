import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  String textPrompt = "Would you like to shop or work?";
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(textPrompt),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (bal < 30) {
                                  textPrompt = "Insufficient funds. You have to work.";
                                }
                                else {
                                  actionCount--;
                                  Navigator.pushReplacementNamed(context, "/shop");
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(30),
                              backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                            ),
                            child: Icon(Icons.shopping_basket, size: 70, color: Color.fromRGBO(254, 76, 160, 1)),
                          ),
                          SizedBox(width: 90),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                actionCount--;
                                Navigator.pushReplacementNamed(context, "/work");
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(30),
                              backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                            ),
                            child: Icon(Icons.work, size: 70, color: Color.fromRGBO(254, 76, 160, 1)),
                          ),
                        ],
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