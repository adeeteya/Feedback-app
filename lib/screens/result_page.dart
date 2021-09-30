import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int total;
  const ResultPage({Key? key, required this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mountain_bg.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Thank you for your Feedback',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: (_size.width > _size.height)
                            ? _size.width * 0.02
                            : _size.height * 0.02,
                        horizontal: (_size.width > _size.height)
                            ? _size.height * 0.3
                            : _size.width * 0.3)),
                child: const Text(
                  "Restart",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
