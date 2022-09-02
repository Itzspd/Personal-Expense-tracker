class Transaction {
  final String Id;
  final String title;
  final double amount;
  DateTime date;

  Transaction(
      {required this.Id,
      required this.title,
      required this.amount,
      required this.date});
}
