import 'dart:ui';

import 'package:feedback_app/smiley_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'models/question.dart';
import 'package:feedback_app/result_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _questionIndex = 0;
  double _rating = 1;
  String animationString = '1-';
  final SmileyController _smileyController = SmileyController();
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_image.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            height: _size.height * 0.6,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                            child: Container(
                              height: 80,
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: FlareActor(
                          'assets/happiness_emoji.flr',
                          animation: animationString,
                          controller: _smileyController,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questions[_questionIndex].question,
                          style: const TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Slider.adaptive(
                            value: _rating,
                            min: 1,
                            max: 5,
                            divisions: 4,
                            activeColor: Colors.blue,
                            label: "${_rating.toInt()}",
                            onChanged: (newRating) {
                              setState(() {
                                if (newRating > _rating) {
                                  animationString = '${newRating.toInt()}+';
                                } else {
                                  animationString = '${newRating.toInt()}-';
                                }
                                _rating = newRating;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (_questionIndex < 5) {
                        setState(() {
                          questions[_questionIndex].rating = _rating.toInt();
                          _questionIndex++;
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              total: total(questions),
                            ),
                          ),
                        );
                        setState(() {
                          _questionIndex = 0;
                        });
                      }
                    },
                    child: const Text('Next',
                        style: TextStyle(fontSize: 24, letterSpacing: 1.5)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                      primary: Colors.white,
                      minimumSize: const Size(double.infinity, 0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
