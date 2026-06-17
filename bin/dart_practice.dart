import 'dart:io';

void main() {
  print('--- Simple Dart CLI Calculator ---');

  // Taking first number as input
  stdout.write('Enter first number: ');
  double? num1 = double.tryParse(stdin.readLineSync()!);

  // Taking operator as input
  stdout.write('Enter operator (+, -, *, /): ');
  String? operator = stdin.readLineSync();

  // Taking second number as input
  stdout.write('Enter second number: ');
  double? num2 = double.tryParse(stdin.readLineSync()!);

  // Validation to ensure numbers were entered
  if (num1 == null || num2 == null) {
    print('Error: Please enter valid numbers.');
    return;
  }

  // Performing calculation based on operator
  switch (operator) {
    case '+':
      print('Result: ${num1 + num2}');
      break;
    case '-':
      print('Result: ${num1 - num2}');
      break;
    case '*':
      print('Result: ${num1 * num2}');
      break;
    case '/':
      if (num2 != 0) {
        print('Result: ${num1 / num2}');

        print("Welcom message");
      } else {
        print('Error: Division by zero is not allowed.');
      }
      break;
    default:
      print('Error: Invalid operator.');
  }
}
