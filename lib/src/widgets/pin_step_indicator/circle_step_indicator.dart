import 'package:flutter/material.dart';

class CircleStepIndicator extends StatelessWidget {
  final Border border;
  final Color color;
  const CircleStepIndicator({@required this.border, @required this.color});
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: border,
          shape: BoxShape.circle,
          color: color,
        ),
        height: 10.0,
        width: 10.0,
      );
}
