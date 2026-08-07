import 'dart:io';

import 'package:daily_helper_app/features/cheque_scan/data/models/cheque.dart';
import 'package:daily_helper_app/features/cheque_scan/presentation/providers/scan_state.dart';
import 'package:flutter/material.dart';

class ChequeScanProvider extends ChangeNotifier {
  ScanState state = ScanState.idle;
  File? image;

  Cheque? cheque;

  Future<void> setImage(File file) async {
    image = file;
    state = ScanState.preview;
    notifyListeners();
  }

  void clearImage() {
    image = null;
    notifyListeners();
  }

  void openCamera() {
    state = ScanState.cameraOpen;
    notifyListeners();
  }

  void previewImage(String path) {
    cheque = Cheque(
      chequeNumber: '',
      bankName: '',
      accountName: '',
      amount: '',
      date: '',
      imagePath: path,
    );
    state = ScanState.preview;
    notifyListeners();
  }

  void startProcessing() {
    state = ScanState.processing;

    notifyListeners();
  }

  void review(Cheque detectedCheque) {
    cheque = detectedCheque;

    state = ScanState.review;

    notifyListeners();
  }

  void redo() {
    state = ScanState.cameraOpen;

    notifyListeners();
  }

  void save() {
    state = ScanState.saving;

    notifyListeners();
  }

  void complete() {
    state = ScanState.completed;

    notifyListeners();
  }

  void cancel() {
    state = ScanState.cancelled;

    notifyListeners();
  }
}
