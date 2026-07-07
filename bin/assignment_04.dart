import 'dart:io';

///1. Extension method to format expense amounts with currency symbol
extension CurrencyFormatter on double {
  String toCurrency() => "৳${this.toStringAsFixed(2)}";
}

///2. base class (parent class)
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
  TransportExpense(String title, double amount)
    : super(title, amount, "Transport");
}

class EntertainmentExpense extends Expense {
  EntertainmentExpense(String title, double amount)
    : super(title, amount, "Entertainment");
}

void main() {
  /// Polymorphism: Storing various subclass objects into a parent type List
  List<Expense> expenses = [];

  while (true) {
    ///printing menu
    print("\n===== Expense Tracker =====");
    print("1. Add Expense");
    print("2. View All Expenses");
    print("3. Show Total Expenses");
    print("4. Exit");

    /// user input
    stdout.write("Choose Option: ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write("\n Enter Expense Title: ");
      String title = stdin.readLineSync()!;

      stdout.write("Enter Expense Amount : ");
      double amount = double.parse(stdin.readLineSync()!);

      stdout.write("Enter Category: ");
      String category = stdin.readLineSync()!;

      if (category.toLowerCase() == 'food') {
        expenses.add(FoodExpense(title, amount));
      } else if (category.toLowerCase() == 'transport') {
        expenses.add(TransportExpense(title, amount));
      } else if (category.toLowerCase() == 'entertainment') {
        expenses.add(EntertainmentExpense(title, amount));
      } else {
        // Fallback to base class if another category is entered
        expenses.add(Expense(title, amount, category));
      }
      print("Expense Added Successfully!");
    } else if (choice == '2') {
      if (expenses.isEmpty) {
        print("\n No expenses recorded yet");
      } else {
        print("\n ======== All Expenses =======");
        for (int i = 0; i < expenses.length; i++) {
          var exp = expenses[i];

          /// using currency method
          print(
            "${i + 1}. ${exp.title} \t - ${exp.amount.toCurrency()} - ${exp.category}",
          );
        }
      }
    } else if (choice == '3') {
      /// display total expense
      double total = 0;
      for (var exp in expenses) {
        total += exp.amount;
      }
      print("\n Total Expenses: ${total.toCurrency()}");
    } else if (choice == '4') {
      /// Exit Application
      print("\n Thank you for using Expense Tracker");
      break;
    } else {
      print("Invalid choice! Please select an option between 1 and 4.");
    }
  }
}
