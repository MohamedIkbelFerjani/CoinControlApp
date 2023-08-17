import 'package:flutter/material.dart';
import 'package:CoinControl/screens/widgets/modals/transaction.dart';

class TransactionData extends ChangeNotifier {
  List<Transaction> transactions = [];

  void addTask(String newTransactionTitle, String NewTransactionbud,
      String NewTransactionType) {
    transactions.add(Transaction(
        name: newTransactionTitle,
        budget: NewTransactionbud,
        type: NewTransactionType));
    notifyListeners();
  }

  void updateTask(Transaction transaction) {
    transaction.doneChange();
    notifyListeners();
  }

  void deleteTask(Transaction transaction) {
    transactions.remove(transaction);
    notifyListeners();
  }

  double calculateBalance() {
    double income = 0;
    double expenses = 0;

    for (var transaction in transactions) {
      double amount = double.tryParse(transaction.budget) ??
          0; // Convert budget to a double, default to 0 if parsing fails

      if (transaction.type == 'income') {
        income += amount;
      } else if (transaction.type == 'expense') {
        expenses += amount;
      }
    }

    return income - expenses;
  }

  // Method to calculate the total income
  double calculateTotalIncome() {
    double totalIncome = 0;

    for (var transaction in transactions) {
      if (transaction.type == 'income') {
        double amount = double.tryParse(transaction.budget) ?? 0;
        totalIncome += amount;
      }
    }

    return totalIncome;
  }

  // Method to calculate the total expenses
  double calculateTotalExpenses() {
    double totalExpenses = 0;

    for (var transaction in transactions) {
      if (transaction.type == 'expense') {
        double amount = double.tryParse(transaction.budget) ?? 0;
        totalExpenses += amount;
      }
    }

    return totalExpenses;
  }
}
