import 'package:flutter/material.dart';
import 'package:pin_verification_code/src/bloc/pin_keyboard_code_bloc.dart';

class UndoButton extends StatelessWidget {
  final Color iconColor;
  final PinKeyboardCodeBloc bloc;

  const UndoButton({this.bloc, this.iconColor});

  void _onTap() => bloc.onNumberTapped(null);

  @override
  Widget build(BuildContext context) => StreamBuilder<String>(
        stream: bloc.pin,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
            snapshot.hasData && snapshot.data.length > 0
                ? GestureDetector(
                    onTap: _onTap,
                    child: Icon(
                      Icons.backspace,
                      color: iconColor ?? Colors.black,
                      size: 18.0,
                    ),
                  )
                : SizedBox(),
      );
}
