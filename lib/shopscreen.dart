import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String textPrompt = "Do you want to buy food or a new toy?";
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
                      Image.network(typeImage, scale: scale),
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                          child: Text(textPrompt, textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Color.fromRGBO(32, 90, 234, 1))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if ((bal - 30) >= 0) {
                                  hp += 25;
                                  if (hp > 100) {
                                    hp = 100;
                                  }
                                  bal -= 30;
                                  if (actionCount == 1) {
                                    Navigator.pushReplacementNamed(context, "/actions");
                                  }
                                  else {
                                    Navigator.pushReplacementNamed(context, "/next");
                                  }
                                }
                                else {
                                  print("You do not have enough to buy food");
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(30),
                              backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                            ),
                            child: Icon(Icons.lunch_dining, size: 70, color: Color.fromRGBO(254, 76, 160, 1)),
                          ),
                          SizedBox(width: 120),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if ((bal - 40) >= 0) {
                                  bal -= 40;
                                  buyCount++;
                                  // add toy to collection
                                  if (actionCount == 1) {
                                    Navigator.pushReplacementNamed(context, "/actions");
                                  }
                                  else {
                                    Navigator.pushReplacementNamed(context, "/next");
                                  }
                                }
                                else {
                                  textPrompt = "Insufficient funds.\nYou can only buy food.";
                                  print("You do not have enough to buy a toy");
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(30),
                              backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                            ),
                            child: Icon(Icons.toys, size: 70, color: Color.fromRGBO(254, 76, 160, 1)),
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