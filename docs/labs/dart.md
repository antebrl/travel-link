# Dart

- everything you can place in a variable is an object, and every object is an instance of a class. Even numbers, functions, and null are objects.
- Future -> like promises in JavaScript
- supports [async/await](https://dart.dev/codelabs/async-await)
- no new to instantiate a new object
- single inheritance
- all classes implicitly define an interface
- supports [optional parameters](https://dart.dev/language/functions#optional-positional-parameters)
- [null safety](https://dart.dev/codelabs/null-safety)
- no protected, private by naming convention \_, default is public!
- lists look like arrays
- switch works on all types
- [try/catch/rethrow]()

## Links

- https://dart.dev/guides/language/language-tour
- https://dartpad.dev/
- https://dart.dev/codelabs/dart-cheatsheet

## Snippets

```dart
// iterable collections
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
var longWords = allWords.where((w) => w.length > 6).toList().length;
var points = <Point>[]; //List
var addresses = <String, Address>{}; //Map
var counts = <int>{}; //Set
const items = ['Salad', 'Popcorn', 'Toast', 'Lasagne'];
if (items.any((item) => item.contains('a'))) {
    print('At least one item contains "a"');
  }
if (items.every((item) => item.length >= 5)) {
    print('All items have length >= 5');
  }
var found = items.firstWhere((item) => item.length > 5);
var evenNumbers = numbers.where((number) => number.isEven);

// string interpolation
print('Hello, $name! You are ${year - birth} years old.';)

// ternary operator (short if/else)
var visibility = isPublic ? 'public' : 'private';

// lambdas
bool hasEmpty = aListOfStrings.any((s) => s.isEmpty);

// optional parameters
int sumUpToFive(int a, [int? b, String title = '']) {...}
// named parameters - are optional unless required states otherwise
void enableFlags({bool? bold, bool? hidden}) {...}
const Scrollbar({super.key, required Widget? child});

// call with
enableFlags(bold: true, hidden: false);

// class
class Point {
  double x, y;
  Point(this.x, this.y);

  static double distanceBetween(Point a, Point b) {...return...}
}
class Person {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// extension methods
extension MyFancyList<T> on List<T> {
  int get doubleLength => length * 2;
  List<T> operator -() => reversed.toList();
  List<List<T>> split(int at) => [sublist(0, at), sublist(at)];
}
extension _MyJsonHelper on Map<String, Object> {
  int? get id => this['id'] as int?;

  String? get name => this['name'] as String?;
}
var json = {
    'id': 100,
    'name': 'Dash',
  };
print("${json.name}'s ID is ${json.id}."); // Dash's ID is 100.


// records are an anonymous, immutable, aggregate type
var x = ('first', a: 2, b: true, 'last'); // bad example, do not mix unnamed with named!
// access with $n or name like a
print(x.$1) // first
print(x.a) // 2
print(x.$2); // last
```

### null safety and null aware operators

```dart
// ? execute right hand side only if not null
String? notAString = null;
print(notAString?.length?.isEven);

// ?? operator
print(nullableString ?? 'alternate');

// and ??= assignment operator, which assigns a value to a variable only if that variable is currently null:
int? a; // a = null
a ??= 3; // a = 3
a ??= 5; // a is still 3

// .. cascade: perform a sequence of operations on the same object, instead of typing querySelector?.text, querySelector?.onclick ...
querySelector('#confirm')
  ?..text = 'Confirm'
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();
```
