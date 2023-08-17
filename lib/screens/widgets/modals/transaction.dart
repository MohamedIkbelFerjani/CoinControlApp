class Transaction {
  final String name;
  final String budget;
  final String type;
  bool isDone;
  Transaction(
      {required this.name,
      this.isDone = false,
      required this.budget,
      required this.type});
  void doneChange() {
    isDone = !isDone;
  }
}
