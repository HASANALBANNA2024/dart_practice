import 'dart:io';

/// 1. Extension Method to format expense amounts with currency symbol
extension CurrencyFormatter on double {
  String toCurrency() => "৳${this.toStringAsFixed(2)}";
}

/// 2. Base Class (Parent Class)
class Expense {
  String title;
  double amount;
  String category;

  Expense(this.title, this.amount, this.category);
}

/// 3. Subclasses demonstrating Inheritance
class FoodExpense extends Expense {
  FoodExpense(String title, double amount) : super(title, amount, "Food");
}

class TransportExpense extends Expense {
  TransportExpense(String title, double amount) : super(title, amount, "Transport");
}

class EntertainmentExpense extends Expense {
  EntertainmentExpense(String title, double amount) : super(title, amount, "Entertainment");
}

void main() {
  /// Polymorphism: Storing various subclass objects into a parent type List
  List<Expense> expenses = [];

  while (true) {
    /// Printing Menu based on the screenshot format
    print("\n===== Expense Tracker =====");
    print("1. Add Expense");
    print("2. View All Expenses");
    print("3. Show Total Expenses");
    print("4. Exit");
    stdout.write("Choose Option: ");

    String? choice = stdin.readLineSync();

    if (choice == '1') {
      /// ---- Add Expense ----
      stdout.write("Enter Expense Title: ");
      String title = stdin.readLineSync()!;

      stdout.write("Enter Expense Amount: ");
      double amount = double.parse(stdin.readLineSync()!);

      print("Enter Category (1 for Food, 2 for Transport, 3 for Entertainment): ");
      String catChoice = stdin.readLineSync()!;

      /// Creating specific objects based on user input
      if (catChoice == '1') {
        expenses.add(FoodExpense(title, amount));
      } else if (catChoice == '2') {
        expenses.add(TransportExpense(title, amount));
      } else if (catChoice == '3') {
        expenses.add(EntertainmentExpense(title, amount));
      } else {
        /// Fallback to base class if category is unspecified
        expenses.add(Expense(title, amount, "General"));
      }
      print("Expense Added Successfully!");

    } else if (choice == '2') {
      /// ---- View All Expenses ----
      if (expenses.isEmpty) {
        print("No expenses recorded yet.");
      } else {
        print("\n===== All Expenses =====");
        for (int i = 0; i < expenses.length; i++) {
          var exp = expenses[i];
          /// Using the Extension Method (.toCurrency()) here
          print("${i + 1}. ${exp.title} \t - ${exp.amount.toCurrency()} - ${exp.category}");
        }
      }

    } else if (choice == '3') {
      /// ---- Show Total Expenses ----
      double total = 0;
      for (var exp in expenses) {
        total += exp.amount;
      }
      print("Choose Option: 3");
      print("Total Expenses: ${total.toCurrency()}");

    } else if (choice == '4') {
      /// ---- Exit Application ----
      print("Choose Option: 4");
      print("Thank you for using Expense Tracker!");
      break;
    } else {
      print("Invalid choice! Please select between 1 and 4.");
    }
  }
}