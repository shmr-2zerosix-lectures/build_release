import 'package:flutter_test/flutter_test.dart';
import 'package:build_release/main.dart';

void main() {
  test('test initial value', () {
    final controller = CounterController();

    expect(controller.value, equals(0));
  });

  test('test increment value', () {
    final controller = CounterController();

    controller.increment();

    expect(controller.value, equals(1));
  });

  test('test decrement value', () {
    final controller = CounterController();

    controller.decrement();

    expect(controller.value, equals(-1));
  });

  test('test inceremnt + decrement value', () {
    final controller = CounterController();

    controller.increment();
    controller.increment();
    controller.increment();
    controller.increment();
    controller.increment();
    controller.increment();
    controller.increment();

    controller.decrement();
    controller.decrement();
    controller.decrement();

    expect(controller.value, equals(4));
  });
}
