class Cheque {
  final String chequeNumber;
  final String bankName;
  final String accountName;
  final String amount;
  final String date;

  final String imagePath;

  const Cheque({
    required this.chequeNumber,
    required this.bankName,
    required this.accountName,
    required this.amount,
    required this.date,
    required this.imagePath,
  });

  Cheque copyWith({
    String? chequeNumber,
    String? bankName,
    String? accountName,
    String? amount,
    String? date,
    String? imagePath,
  }) {
    return Cheque(
      chequeNumber: chequeNumber ?? this.chequeNumber,
      bankName: bankName ?? this.bankName,
      accountName: accountName ?? this.accountName,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
