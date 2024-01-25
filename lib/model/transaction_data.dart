class TransactionData {
  final bool checked;
  final String title;
  final String date;
  final String description;
  final String amount;
  final String status;

  TransactionData({
    this.checked = false,
    required this.title,
    required this.date,
    required this.description,
    required this.amount,
    required this.status,
  });


}


List <TransactionData>transactionDataDetails = [
  TransactionData(
      title: "Elevate Agency",
      date: "2 Oct 2023",
      description: "Monthly Salary",
      amount: "+\$1,500.0",
      status: "Success"),

];