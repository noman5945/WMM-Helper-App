import 'package:daily_helper_app/features/cheque_scan/data/models/cheque.dart';

class ChequeParserService {
  Cheque parse(String text, String imagePath) {
    return Cheque(
      chequeNumber: '',
      bankName: '',
      accountName: '',
      amount: '',
      date: '',
      imagePath: imagePath,
    );
  }
}
