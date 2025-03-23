import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String textPrompt = "You must pay \$250.\nIf you don't pay, you get a late fee of \$30.";
  @override
  Widget build (BuildContext context) {
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
                                child: Text(textPrompt, textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Color.fromRGBO(32, 90, 234, 1))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (bal >= 250) {
                                    bal -= 200;
                                    debt -= 200;
                                    Navigator.pushReplacementNamed(context, "/event");
                                  }
                                  else {
                                    textPrompt = "Insufficient funds. You cannot make a payment.";
                                    print("You do not have enough to pay your debt");
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(30),
                                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                              ),
                              child: Text("Pay", style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 76, 160, 1))),
                            ),
                            SizedBox(width: 120),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  debt += 30;
                                  Navigator.pushReplacementNamed(context, "/event");
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(30),
                                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                              ),
                              child: Text("Don't Pay", style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 76, 160, 1))),
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