import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: <String, WidgetBuilder>{'/ResultPage': (context) => ResultPage()},
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var result = "";
var resultColor;
List<int> ratings = [];
double rating = 1;
int i = 0, total = 0;

class _HomeState extends State<Home> {
  List<String> questionsList = [
    "How do you like our service?",
    "How do you appreciate the sanitization?",
    "How was the sound quality?",
    "How was the lighting?",
    "How likely are you to recommend us to your friends?",
    "How likely are you to come back here?"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feedback App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                questionsList.elementAt(i),
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 0,
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${rating.toInt()}",
                    style: TextStyle(fontSize: 24),
                  ),
                  Slider.adaptive(
                      value: rating,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: "${rating.toInt()}",
                      onChanged: (newRating) {
                        setState(() => rating = newRating);
                      }),
                ],
              ),
              SizedBox(
                width: 0,
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ratings.add(rating.toInt());
                    if (i < 5) {
                      i++;
                      total += rating.toInt();
                      rating = 1;
                    } else {
                      if (total < 10) {
                        result = "We are sorry for your inconvenience";
                        resultColor = Colors.red;
                      } else if (total < 20) {
                        result = "Hope we serve you better next time";
                        resultColor = Colors.yellow;
                      } else {
                        result = "We hope you come back next time.";
                        resultColor = Colors.green;
                      }
                      Navigator.pushNamed(context, '/ResultPage');
                    }
                  });
                },
                child: Text("Next"),
              ),
            ],
          ),
        ));
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank you"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$result",
              style: TextStyle(
                  color: resultColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 0, height: 20),
            ElevatedButton(
                onPressed: () {
                  i = 0;
                  ratings.removeRange(0, 5);
                  total = 0;
                  Navigator.pop(context);
                },
                child: Text("Restart"))
          ],
        ),
      ),
    );
  }
}
