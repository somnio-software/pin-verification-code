import 'package:flutter/material.dart';
import 'package:pin_verification_code/pin_button_decoration.dart';
import 'package:pin_verification_code/src/bloc/pin_keyboard_code_bloc.dart';
import 'package:pin_verification_code/src/models/number_button.dart';
import 'package:pin_verification_code/src/models/undo_button.dart' as Model;
import 'package:pin_verification_code/src/widgets/pin_button/pin_button.dart';
import 'package:pin_verification_code/src/widgets/pin_button/undo_button.dart';

class PinKeyboard extends StatelessWidget {
  final PinKeyboardCodeBloc bloc;
  final PinButtonDecoration pinButtonDecoration;
  final Color undoButtonColor;

  const PinKeyboard({
    @required this.bloc,
    this.pinButtonDecoration,
    this.undoButtonColor,
  });

  void _onButtonTapped(NumberButton btn) =>
      bloc.onNumberTapped(btn.number.toString());

  Widget _buildItem(BuildContext context, int index) {
    final key = PinKeyboardCodeBloc.keyboard.buttons[index];
    switch (key.runtimeType) {
      case NumberButton:
        return PinButton(
          pinButtonDecoration: pinButtonDecoration,
          onTap: () => _onButtonTapped(key),
          number: (key as NumberButton).number.toString(),
        );
      case Model.UndoButton:
        return UndoButton(
          bloc: bloc,
          iconColor: undoButtonColor,
        );
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
            crossAxisSpacing: 0.0,
          ),
          itemCount: PinKeyboardCodeBloc.keyboard.buttons.length,
          itemBuilder: _buildItem,
        ),
      );
}
