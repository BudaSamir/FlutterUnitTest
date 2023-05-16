import 'package:unit_test_ex1/calculator.dart';
import 'package:test/test.dart';

void main() {
  test("Add Method Should Return 5, If The Input are 3 and 2", (() {
    // Triple A

    // Arrange
    final cal = Calculator();
    const num1 = 3;
    const num2 = 2;
    const expectResult = 5;

    // Act
    final result = cal.add(num1, num2);

    // Assert
    // actual = test result , matcher = expectResult
    expect(result, expectResult);
  }));

  test("DividBy method should Return 5, If The Input Was 10 and 2 ", (() {
    // Triple A

    // Arrange (Tools = What i will use in testing)
    final cal = Calculator();
    const num1 = 10;
    const num2 = 2;
    const expectResult = 5;

    // Act ( TestOn = What i will Testing )
    final result = cal.dividBy(num1, num2);

    // Assert (Result Comparison )
    expect(result, expectResult);
  }));

  test("DivideBy Method Should Throw an Exception if num2 is 0", (() {
    // Triple A

    // Arrange
    final cal = Calculator();
    const num1 = 10;
    const num2 = 0;
    final expectResult = throwsA(isA<Exception>());

    // Act
    result() => cal.dividBy(num1, num2);

    // Assert
    expect(result, expectResult);
  }));
}
