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
  List<Expense> expense = [];

  while (true) {
    ///printing menu
    print("\n===== Expense Tracker =====");
    print("1. Add Expense");
    print("2. View All Expenses");
    print("3. Show Total Expenses");
    print("4. Exit");
  }
}
