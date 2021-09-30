import 'dart:ui';

import 'package:feedback_app/screens/result_page.dart';
import 'package:feedback_app/widgets/emoji_animation.dart';
import 'package:feedback_app/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

import '../models/question.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _questionIndex = 0;
  double _rating = 1;
  String animationString = '1-';

  Widget questionsWidget() {
    return Text(
      questions[_questionIndex].question,
      style: const TextStyle(fontSize: 24, color: Colors.orangeAccent),
      textAlign: TextAlign.center,
    );
  }

  Widget sliderWidget() {
    return Slider.adaptive(
        value: _rating,
        min: 1,
        max: 5,
        divisions: 4,
        activeColor: Colors.orangeAccent,
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
        });
  }

  Widget nextButton() {
    return TextButton(
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
        primary: Colors.orangeAccent,
      ),
    );
  }

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
          child: ResponsiveWidget(
            mobileWidget: Container(
              height: _size.height * 0.6,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Container(
                          height: _size.height * 0.4,
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          color: Colors.white.withOpacity(0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    questionsWidget(),
                                    sliderWidget(),
                                  ],
                                ),
                              ),
                              nextButton(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: _size.height * 0.2,
                      width: _size.width * 0.5,
                      child: EmojiAnimation(animationString: animationString),
                    ),
                  ),
                ],
              ),
            ),
            desktopWidget: Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Row(
                  children: [
                    Flexible(
                      child: EmojiAnimation(
                        animationString: animationString,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          questionsWidget(),
                          sliderWidget(),
                          nextButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
