class Stack<Type> {
  final _list = <Type>[];
  void push(Type value) => _list.add(value);
  Type pop() => _list.removeLast();
  Type get peek => _list.last;
  bool get isEmpty => _list.isEmpty;

  @override
  String toString() => _list.toString();
}

void main() {
  final myStack = Stack<String>();
  myStack.push('hello');
  myStack.push('second');
  myStack.push('third');
  while (!myStack.isEmpty) {
    print(myStack.pop());
  }
}
