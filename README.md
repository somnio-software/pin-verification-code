# pin_verification_code

Pin Verification Code is a Flutter library that allows you to integrate a pin verification code layout into your project.

## Usage

Lets take a look at how to use PinKeyboardCode widget:


```dart
PinKeyboardCode(
  pinLength: 6,
  onCompleted: (String enteredPin) {
    //process the enteredPin here
  },
 );
```


You give the library the size of the pin you want — 4,5 or 6. You must also provide a function to the onCompleted parameter which will be executed once the user fills the pin size. The function will provide you with the data of the entered pin.

You can also customize the enter pin screen components. More in [API Reference](https://pub.dev/documentation/pin_verification_code/latest/).
## Gallery

 ![](https://user-images.githubusercontent.com/66737000/109055326-c8852e80-76bd-11eb-9b35-4891992cb20c.gif)
 ![](https://user-images.githubusercontent.com/66737000/109055420-ece10b00-76bd-11eb-8a05-fc6d6e879fa9.gif)
 ![](https://user-images.githubusercontent.com/66737000/109049573-39751800-76b7-11eb-9078-66f32386f168.gif)
 ![](https://user-images.githubusercontent.com/66737000/109049743-5b6e9a80-76b7-11eb-8d45-9fc6853e8f5e.gif)




## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
