import 'package:flutter/material.dart';
import 'package:pin_verification_code/pin_step_decoration.dart';
import 'package:pin_verification_code/src/bloc/pin_keyboard_code_bloc.dart';
import 'package:pin_verification_code/src/widgets/pin_step_indicator/circle_step_indicator.dart';

class PinStepIndicator extends StatelessWidget {
  final PinKeyboardCodeBloc bloc;
  final int pinLength;
  final PinStepDecoration decoration;

  const PinStepIndicator({
    @required this.bloc,
    @required this.pinLength,
    this.decoration,
  });

  Color _getColor(bool active) => active
      ? decoration?.onDoneBackgroundColor ?? Colors.black
      : decoration?.onLeftBackgroundColor ?? Colors.white;

  Widget _stepIndicator(int currentStep) => StreamBuilder<String>(
        initialData: '',
        stream: bloc.pin,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          final lastNumber = snapshot.data.length - 1;
          final isCurrentStep = snapshot.data.length - 1 == currentStep;
          return isCurrentStep
              ? Text(
                  snapshot.data[lastNumber],
                  style: TextStyle(
                    color: decoration?.numberColor ?? Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                  ),
                )
              : CircleStepIndicator(
                  border: decoration?.border ?? Border.all(color: Colors.grey),
                  color: _getColor(snapshot.data.length > currentStep),
                );
        },
      );

  List<Widget> _buildIndicators() {
    final _indicators = List<Widget>();
    for (var i = 0; i < pinLength; i++) {
      _indicators.add(_stepIndicator(i));
      if (i < pinLength - 1) {
        _indicators.add(SizedBox(width: 20.0));
      }
    }
    return _indicators;
  }

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: 35.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildIndicators(),
        ),
      );
}
