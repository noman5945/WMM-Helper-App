import 'package:daily_helper_app/features/cheque_scan/data/models/cheque.dart';

abstract class ChequeRepository {
  Future<bool> saveCheque(Cheque cheque);
}
