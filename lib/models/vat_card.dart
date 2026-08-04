class VatCard {
  final String cardNumber;
  final String bin;
  final String businessName;
  final String issueDate;
  final String expiryDate;
  final String pdfLink;

  const VatCard({
    required this.cardNumber,
    required this.bin,
    required this.businessName,
    required this.issueDate,
    required this.expiryDate,
    required this.pdfLink,
  });
}
