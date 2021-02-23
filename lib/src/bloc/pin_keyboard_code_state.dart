abstract class PinKeyboardCodeState {
  const PinKeyboardCodeState();
}

class PinCompleted extends PinKeyboardCodeState {
  final String pin;
  const PinCompleted(this.pin);
}

class Undefined extends PinKeyboardCodeState {
  const Undefined();
}
