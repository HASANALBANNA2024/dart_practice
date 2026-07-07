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
