import 'package:dart_application/person.dart';
import 'package:dart_application/initial_test.dart' as initial_test;

void main(List<String> arguments) {
  print('Hello world: ${initial_test.calculate()}!');

  final hasan = Person('Hasan');
  print('First assigned name: ${hasan.name}');

  print('1st simple comparison: ${hasan == Person('Hasan')}');

  final mahbub = Person2('Mahbub');
  print('Second assigned name: ${mahbub.name}');
  print('2nd comparison: ${mahbub == Person2('Mahbub')}');
}
