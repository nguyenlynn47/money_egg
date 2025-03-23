import 'package:flutter/material.dart';
import 'package:money_egg/main.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 117, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Text(endMessage, textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Color.fromRGBO(254, 76, 160, 1))),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                day = 0; // Do + 1
                hp = 50;
                bal = 150;
                debt = 1000;
                paymentDueDate = 3;
                actionCount = 2;
                saveCount = 0;
                buyCount = 0;
                type = "";
                typeImage = "https://i.imgur.com/iKhDk7N.png";
                scale = 2;   
                Navigator.pushReplacementNamed(context, "/start");
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(25),
                backgroundColor: Color.fromRGBO(255, 255, 117, 1),
              ),
              child: Text("Play Again", style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 76, 160, 1)),),
            ),
          ],
        ),
      ),
    );
  }
}