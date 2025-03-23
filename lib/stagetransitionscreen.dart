import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class StageTransitionScreen extends StatelessWidget {
  const StageTransitionScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your pet has developed its own spending habits\nand is now evolving...\nPress the star to evolve it and see its spending personality..."),
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
