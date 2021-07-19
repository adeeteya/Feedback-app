import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String result = "";
var labelColor = Colors.red, resultColor;
List<int> ratings = [];
double rating = 1;
int i = 0, total = 0;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: <String, WidgetBuilder>{'/ResultPage': (context) => ResultPage()},
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            questionsList.elementAt(i),
            style: TextStyle(fontSize: 24, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "${rating.toInt()}",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                child: Slider.adaptive(
                    value: rating,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    activeColor: labelColor,
                    label: "${rating.toInt()}",
                    onChanged: (newRating) {
                      setState(() {
                        rating = newRating;
                        switch (rating.toInt()) {
                          case 1:
                            labelColor = Colors.red;
                            break;
                          case 2:
                            labelColor = Colors.orange;
                            break;
                          case 3:
                            labelColor = Colors.amber;
                            break;
                          case 4:
                            labelColor = Colors.lightGreen;
                            break;
                          case 5:
                            labelColor = Colors.green;
                            break;
                        }
                      });
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                ratings.add(rating.toInt());
                if (i < 5) {
                  i++;
                  labelColor = Colors.red;
                  total += rating.toInt();
                  rating = 1;
                } else {
                  total += rating.toInt();
                  if (total < 11) {
                    result = "We are sorry for your inconvenience";
                    resultColor = Colors.red;
                  } else if (total < 21) {
                    result = "Hope we serve you better next time";
                    resultColor = Colors.amber;
                  } else {
                    result = "We hope you come back next time.";
                    resultColor = Colors.green;
                  }
                  Navigator.pushNamed(context, '/ResultPage');
                  setState(() {
                    i = 0;
                    rating = 1;
                    total = 0;
                    labelColor = Colors.red;
                    ratings.removeRange(0, 5);
                  });
                }
              });
            },
            child: Text("Next"),
          ),
        ])));
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank you!"),
        centerTitle: true,
        leading: SizedBox(width: 0),
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
            SizedBox(height: 20),
            InkWell(
              child: Text(
                "Restart",
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 18,
                    decoration: TextDecoration.underline),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
