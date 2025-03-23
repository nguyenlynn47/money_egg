import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

var eventText = ["A homeless person asks Egg for \$10. Does Egg give it to them?", "Egg is craving something sweet. Does Egg treat themselves?", "Egg picks up sewing as a hobby. Should Egg buy a \$20 starter kit?", "Egg wants to buy a \$10 book at the book fair. Does Egg buy it?", "Someone stole a tire from the bike Egg rides to school. Does Egg replace it for \$20?", "There’s a bake sale at Egg’s school. Does Egg buy a cookie for \$5?", "Egg’s favorite band is having a concert. Tickets are \$15. Does Egg attend?", "Egg’s friend is short \$5 for their lunch. Does Egg cover for them?", "Egg wants to join the volleyball club. The fee is \$25. Does Egg join the club?", "Someone wants \$10 in exchange for a mystery box. Does Egg buy it?", "The smell of freshly baked bread entices Egg. Does Egg buy an \$8 loaf?", "Egg wants new shoes. They cost \$60. Does Egg buy it?", "The state fair is on Friday and Egg’s friends are going. Tickets are \$10. Does Egg go?", "The LSU vs. Alabama football game is on Saturday. Does Egg buy a \$60 ticket?"];
var eventEffects = [-10, -10, -20, -10, -20, -5, -15, -5, -25, -10, -8, -60, -10, -60];

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => EventScreenState();
}

class EventScreenState extends State<EventScreen> {
  String textPrompt = eventText[day];
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
                    children: [
                      Expanded(
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
                                child: Text(
                                  textPrompt,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30, color: Color.fromRGBO(32, 90, 234, 1)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(
                        height: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (bal < eventEffects[day].abs()) {
                                    textPrompt = "Insufficient funds. You can't afford this.";
                                  }
                                  else {
                                    bal += eventEffects[day];
                                    buyCount++;
                                    Navigator.pushReplacementNamed(context, "/actions");
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(30),
                                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                              ),
                              child: Icon(Icons.check, size: 70, color: Color.fromRGBO(254, 76, 160, 1)),
                            ),
                            SizedBox(width: 120),
                            ElevatedButton(
                              onPressed: () {
                                saveCount++;
                                Navigator.pushReplacementNamed(context, "/actions");
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(30),
                                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                              ),
                              child: Icon(Icons.close, size: 70, color: Color.fromRGBO(254, 76, 160, 1)),
                            ),
                          ],
                        ),
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