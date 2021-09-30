import 'package:feedback_app/smiley_controller.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class EmojiAnimation extends StatefulWidget {
  final String animationString;
  const EmojiAnimation({Key? key, this.animationString = '1-'})
      : super(key: key);
  @override
  State<EmojiAnimation> createState() => _EmojiAnimationState();
}

class _EmojiAnimationState extends State<EmojiAnimation> {
  final SmileyController _smileyController = SmileyController();

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'assets/happiness_emoji.flr',
      animation: widget.animationString,
      controller: _smileyController,
    );
  }
}
