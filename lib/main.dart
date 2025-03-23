import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/start",
      routes: {
        "/start": (context) => const StartScreen(),
        "/htp": (context) => const InstructionScreen(),
        "/event": (context) => EventScreen(),
        "/actions": (context) => ActionScreen(),
        "/shop": (context) => ShopScreen(),
        //"/work": (context) => 
        "/next": (context) => NextScreen(),
        "/stage1end": (context) => const StageTransitionScreen(),
        "/evolved": (context) => const EvolvedScreen(),
        "/end": (context) => const EndScreen(),
      },
    );
  }
}

// Stats
int day = 0; // Do + 1
int hp = 50;
int bal = 150;
int debt = 1000;
int paymentDueDate = 3;
int actionCount = 2;

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 90, 234, 1),
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
                shape: CircleBorder(),
                padding: EdgeInsets.all(50),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                foregroundColor: Color.fromRGBO(254, 254, 91, 1),
              ),
              child: Text("HOW TO PLAY", style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 76, 160, 1)),),
            ),
          ],
        ),
      ),
    );
  }
}

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 90, 234, 1),
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

var eventText = ["A homeless person asks Egg for \$10. Does Egg give it to them?", "Egg is craving something sweet. Does Egg treat themselves?", "Egg picks up sewing as a hobby. Should Egg buy a \$20 starter kit?"];
var eventEffects = [-10, -10, -20];

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => EventScreenState();
}

class EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 55,
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
              )
            ),
            Expanded(
              flex: 45,
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Text(
                              eventText[day],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30, color: Color.fromRGBO(32, 90, 234, 1)),
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
                                bal += eventEffects[day];
                                Navigator.pushReplacementNamed(context, "/actions");
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
          ],
        )
      ),
    );
  }
}

class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 55,
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
              )
            ),
            Expanded(
              flex: 45,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (bal < 30) {
                            print("You cannot buy anything");
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
                          // Navigator.pushReplacementNamed(context, "/work");
                          // over there we do bal += moneyEarned;
                          if (actionCount == 1) {
                            Navigator.pushReplacementNamed(context, "/actions");
                          }
                          else {
                            Navigator.pushReplacementNamed(context, "/next");
                          }
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
              ),
            ),
          ],
        )
      ),
    );
  }
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 55,
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
              )
            ),
            Expanded(
              flex: 45,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // food
                    // error checking
                    // toy
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if ((bal - 30) >= 0) {
                            hp = (hp + 25) % 101;
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
                    SizedBox(width: 90),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if ((bal - 40) >= 0) {
                            bal -= 40;
                            // add toy to collection
                            if (actionCount == 1) {
                              Navigator.pushReplacementNamed(context, "/actions");
                            }
                            else {
                              Navigator.pushReplacementNamed(context, "/next");
                            }
                          }
                          else {
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
              ),
            ),
          ],
        )
      ),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 192, 250, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You must pay $ today./$ is due today. If you do not pay, $60 will be added to your debt amount.
            // buttons
          ],
        ),
      ),
    );
  }
}

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 192, 250, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // new screen for items you bought
            // increment counter type of button
          ],
        ),
      ),
    );
  }
}

void nextDay(BuildContext context) {
  day++;
  hp -= 15;
  actionCount = 2;
  if (paymentDueDate-- == -1) {
    paymentDueDate = 3;
  }
  if (hp <= 0) {
    Navigator.pushReplacementNamed(context, "/end");
  }
  if (day == 6) {
    Navigator.pushReplacementNamed(context, "/stage1end");
  }
  else if (day < 14) {
    Navigator.pushReplacementNamed(context, "/event");
    // update all stats on screen
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
              )
            ),
            Expanded(
              flex: 45,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        nextDay(context);
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
            ),
          ],
        )
      ),
    );
  }
}

class StageTransitionScreen extends StatelessWidget {
  const StageTransitionScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your pet has developed its own spending habits\nand is now evolving...\nPress 'EVOLVE' to see its spending personality..."),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/evolved");
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(50),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
              ),
              child: Icon(Symbols.star_shine, size: 110, color: Color.fromRGBO(254, 76, 160, 1)),
            ),
          ],
        ),
      ),
    );
  }
}

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

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 90, 234, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // String that changes to display correct ending message
          ],
        ),
      ),
    );
  }
}