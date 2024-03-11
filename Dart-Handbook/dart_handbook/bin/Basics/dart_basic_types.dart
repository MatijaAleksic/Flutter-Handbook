void dartBasicTypesMain() {
  basicTypes();
  collections();
  runes();
  nullables();
  symbols();
  function();
}

void basicTypes() {
  int integer = 1;
  double doub = 1.1111;

  String str = "Some string";
  bool boolean = true;

  var variable = <int>[];
}

void nullables() {
  var a = null;
}

int add(int a, int b) {
  return a + b;
}

void function() {
  Function sumFunction = add;
  int result = sumFunction(3, 4);
  print('Result: $result');
}

void runes() {
  Runes emoji = Runes('\u{1F60A}');
  String emojiString = String.fromCharCodes(emoji);
  print('Emoji: $emojiString');
}

void symbols() {
// Declaring a Symbol representing the identifier 'myFunction'
  Symbol myFunctionSymbol = #myFunction;

  // Defining a function with the identifier 'myFunction'
  void myFunction() {
    print('Hello from myFunction!');
  }

  // Retrieving the function associated with the Symbol
  Function? myFunctionRef = Function.apply(myFunction, []);
  // Function? myFunctionRef1 = Function.apply(myFunctionSymbol, []);

  // Calling the function if it's not null
  if (myFunctionRef != null) {
    myFunctionRef();
  }
}

void collections() {
  List<int> emptyIntList = <int>[];
  List<String> emptyStrList = List<String>.empty();
  List<String> fillList = List<String>.filled(3, "str");

  Map<String, int> emptyMap = <String, int>{};

  final planets = <num, String>{
    1: 'Mercury',
    2: 'Venus',
    3: 'Earth',
    4: 'Mars'
  };
  Map<int, String> filledMap = Map<int, String>.from(planets);

  Set<int> emptyHashSet = <int>{};
  Set<int> filledHashSet = <int>{1, 2, 3, 4, 4, 5, 6, 6, 6, 6, 7};

  print(filledHashSet);
}
