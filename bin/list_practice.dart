void main() {
  List<String> fruits = ["apple", "mango", "banana", "juice"];

  print("For Each Loop use");
  for (String fruit in fruits) {
    print(fruit);

    /// for each loop use
  }

  print("For Loop");
  for (int i = 0; i < fruits.length; i++) {
    print("Number of Element of list ${i}: ${fruits[i]}");
  }

  /// shortcut for each loop
  fruits.forEach((fruits) => print(fruits));

  print("Md. Hasan Al Banna");
}
