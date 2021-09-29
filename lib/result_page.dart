import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int total;
  const ResultPage({Key? key, required this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thank you!"),
        centerTitle: true,
        leading: Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (total < 10) ? 'wow' : 'none',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: (total < 10) ? Colors.red : Colors.blue,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: const Text(
                "Restart",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
