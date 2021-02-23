import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_verification_code/src/bloc/pin_keyboard_code_state.dart';
import 'package:pin_verification_code/src/models/keyboard.dart';
import 'package:pin_verification_code/src/models/number_button.dart';
import 'package:pin_verification_code/src/models/undo_button.dart';

class PinKeyboardCodeBloc extends Cubit<PinKeyboardCodeState> {
  static final keyboard = Keyboard(
    [
      NumberButton(1),
      NumberButton(2),
      NumberButton(3),
      NumberButton(4),
      NumberButton(5),
      NumberButton(6),
      NumberButton(7),
      NumberButton(8),
      NumberButton(9),
      null,
      NumberButton(0),
      UndoButton('Delete')
    ],
  );

  final int _maxPinLength;
  final _numberController = StreamController<String>.broadcast();
  final _pinController = StreamController<String>.broadcast();
  String _pin = '';

  Stream<String> get pin => _pinController.stream;

  void onNumberTapped(String number) {
    _numberController.sink.add(number);
  }

  PinKeyboardCodeBloc(this._maxPinLength) : super(const Undefined()) {
    _numberController.stream.listen((number) => _buildPin(number));
  }

  void _buildPin(String number) {
    if (number == null) {
      _pin = _pin.length <= 1 ? '' : _pin.substring(0, _pin.length - 1);
    } else {
      if (_pin.length == _maxPinLength) {
        emit(PinCompleted(_pin));
        _pin = '';
      } else {
        _pin = _pin + number;
        if (_pin.length == _maxPinLength) {
          emit(PinCompleted(_pin));
          _pin = '';
        }
      }
    }
    _pinController.sink.add(_pin);
  }

  @override
  Future<void> close() async {
    await _pinController.close();
    await _numberController.close();
    return super.close();
  }
}
