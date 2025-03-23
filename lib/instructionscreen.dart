import 'package:flutter/material.dart';

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(63, 117, 255, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text("Welcome to Money Egg!\n\nYou must teach a young creature named Egg who has mysteriously accrued \$1000 in debt.\n\nYour goal is to help Egg pay off its debt over the course of 14 days, while keeping Egg healthy. Make sure to feed Egg so its health doesn't decline.\n\nYou must pay \$250 at the end of every 3 days. If you don't pay, you get a late fee added to your debt.\n\nFor the first week, you will make all financial decisions for Egg. Each day you can shop or work up to 2 times. Be aware of your financial decisions as Egg's financial personality will develop based on those decisions.\n\nAfter a week, Egg will mature and start making its own financial decisions.\n\nWill Egg become an impulse spender or spend wisely? It's up to you!\n\nGood luck!", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, color: Color.fromRGBO(254, 76, 160, 1))),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/event");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(25),
                  backgroundColor: Color.fromRGBO(255, 255, 117, 1),
                ),
                child: Text("Start", style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 76, 160, 1)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}