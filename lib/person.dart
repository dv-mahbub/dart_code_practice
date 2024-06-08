class Person {
  String name;
  Person(this.name);
}

class Person2 {
  const Person2(this.name);

  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
