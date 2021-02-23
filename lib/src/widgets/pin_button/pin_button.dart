import 'package:flutter/material.dart';
import 'package:pin_verification_code/pin_button_decoration.dart';

class PinButton extends StatelessWidget {
  final VoidCallback onTap;
  final EdgeInsets margin;
  final String number;
  final Color color;
  final PinButtonDecoration pinButtonDecoration;

  const PinButton({
    @required this.number,
    @required this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.color,
    this.pinButtonDecoration,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: margin,
          decoration: BoxDecoration(
            color: pinButtonDecoration?.backgroundColor ?? Colors.transparent,
            border:
                pinButtonDecoration?.border ?? Border.all(color: Colors.black),
            shape: BoxShape.circle,
          ),
          child: Text(
            number,
            style: TextStyle(
              color: pinButtonDecoration?.textColor ?? Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
}
