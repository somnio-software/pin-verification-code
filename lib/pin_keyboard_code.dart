import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_verification_code/pin_button_decoration.dart';
import 'package:pin_verification_code/pin_step_decoration.dart';
import 'package:pin_verification_code/src/bloc/pin_keyboard_code_bloc.dart';
import 'package:pin_verification_code/src/bloc/pin_keyboard_code_state.dart';
import 'package:pin_verification_code/src/widgets/pin_keyboard/pin_keyboard.dart';
import 'package:pin_verification_code/src/widgets/pin_step_indicator/pin_step_indicator.dart';

class PinKeyboardCode extends StatefulWidget {
  final int pinLength;
  final void Function(String) onCompleted;
  final PinStepDecoration pinStepIndicatorDecoration;
  final PinButtonDecoration pinKeyboardButtonDecoration;
  final Color removeButtonColor;

  const PinKeyboardCode({
    @required this.pinLength,
    @required this.onCompleted,
    this.pinStepIndicatorDecoration,
    this.pinKeyboardButtonDecoration,
    this.removeButtonColor,
  });

  @override
  _PinKeyboardCodeState createState() => _PinKeyboardCodeState();
}

class _PinKeyboardCodeState extends State<PinKeyboardCode> {
  PinKeyboardCodeBloc _bloc;

  @override
  void initState() {
    _bloc = PinKeyboardCodeBloc(widget.pinLength);
    super.initState();
  }

  void _blocListener(BuildContext context, PinKeyboardCodeState state) {
    if (state is PinCompleted) widget.onCompleted(state.pin);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocListener<PinKeyboardCodeBloc, PinKeyboardCodeState>(
      cubit: _bloc,
      listener: _blocListener,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: width * 0.1,
        ),
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinStepIndicator(
              bloc: _bloc,
              pinLength: widget.pinLength,
              decoration: widget.pinStepIndicatorDecoration,
            ),
            SizedBox(height: height * 0.06),
            PinKeyboard(
              bloc: _bloc,
              pinButtonDecoration: widget.pinKeyboardButtonDecoration,
              undoButtonColor: widget.removeButtonColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
