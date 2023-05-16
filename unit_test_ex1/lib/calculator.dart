class Calculator {
  int add(int x, int y) {
    final result = x + y;
    return result;
  }

  int dividBy(int x, int y) {
    if (y == 0) throw Exception();
    final result = x ~/ y;
    return result;
  }
}
