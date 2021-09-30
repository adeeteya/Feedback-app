import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileWidget;
  final Widget desktopWidget;
  const ResponsiveWidget(
      {Key? key, required this.mobileWidget, required this.desktopWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 768) {
        return desktopWidget;
      } else {
        return mobileWidget;
      }
    });
  }
}
