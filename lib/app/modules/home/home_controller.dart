import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  static const operations = const ['%', '/', 'x', '-', '+', '='];
  final buffer = [0.0, 0.0];
  int bufferIndex = 0;
  String operation;
  bool wipeValue = false;
  String lastComand;

  @observable
  String value = '0';

  void apllyComand(String command) {
    if (isReplacement(command)) {
      operation = command;
      return;
    }

    if (command == 'AC') {
      allClear();
    } else if (operations.contains(command)) {
      setOperation(command);
    } else {
      addDigit(command);
    }
    lastComand = command;
  }

  isReplacement(String command) {
    return operations.contains(lastComand) &&
        operations.contains(command) &&
        lastComand != '=' &&
        command != '=';
  }

  @action
  setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (bufferIndex == 0) {
      if (!isEqualSign) {
        operation = newOperation;
        bufferIndex = 1;
        wipeValue = true;
      }
    } else {
      buffer[0] = calculate();
      buffer[1] = 0.0;
      value = buffer[0].toString();
      value = value.endsWith('.0') ? value.split('.')[0] : value;
      operation = isEqualSign ? null : newOperation;
      bufferIndex = isEqualSign ? 0 : 1;
    }
    wipeValue = true; //isEqualSign;
  }

  @action
  addDigit(String digit) {
    final isDot = digit == '.';
    final withoutZero = (value == '0' && !isDot) || wipeValue;

    if (isDot && value.contains('.') && !withoutZero) {
      return;
    }
    final emptyValue = isDot ? '0' : '';

    final currentValue = withoutZero ? emptyValue : value;
    value = currentValue + digit;
    wipeValue = false;
    buffer[bufferIndex] = double.tryParse(value) ?? 0;
  }

  @action
  allClear() {
    value = '0';
    buffer.setAll(0, [0.0, 0.0]);
    operation = null;
    bufferIndex = 0;
    wipeValue = false;
  }

  calculate() {
    switch (operation) {
      case '%':
        return buffer[0] % buffer[1];
      case '/':
        return buffer[0] / buffer[1];
      case 'x':
        return buffer[0] * buffer[1];
      case '-':
        return buffer[0] - buffer[1];
      case '+':
        return buffer[0] + buffer[1];

      default:
        return buffer[0];
    }
  }
}
