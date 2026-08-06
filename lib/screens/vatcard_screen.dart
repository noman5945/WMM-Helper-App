import 'package:daily_helper_app/services/export_service.dart';
import 'package:daily_helper_app/services/storage_service.dart';
import 'package:daily_helper_app/widgets/vat_card_preview.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class VatcardScreen extends StatefulWidget {
  const VatcardScreen({super.key});

  @override
  State<VatcardScreen> createState() => _VatcardScreen();
}

class _VatcardScreen extends State<VatcardScreen> {
  final cardNoController = TextEditingController();
  final binController = TextEditingController();
  final nameController = TextEditingController();
  final issueDateController = TextEditingController();
  final expiryDateController = TextEditingController();
  final pdfLinkController = TextEditingController();
  final ScreenshotController screenshotController = ScreenshotController();

  bool generated = false;
  double leftPix = 167;
  double topPix = 60;
  double customfontSize = 10;
  FontWeight fontWeight = FontWeight.normal;

  @override
  void dispose() {
    cardNoController.dispose();
    binController.dispose();
    nameController.dispose();
    issueDateController.dispose();
    expiryDateController.dispose();
    pdfLinkController.dispose();

    super.dispose();
  }

  void generateCard() {
    setState(() {
      generated = true;
    });
  }

  void resetForm() {
    cardNoController.clear();
    binController.clear();
    nameController.clear();
    issueDateController.clear();
    expiryDateController.clear();
    pdfLinkController.clear();

    setState(() {
      generated = false;
    });
  }

  Future<void> exportCard() async {
    try {
      final path = await ExportService.exportAsPng(screenshotController);
      final saved = await StorageService.saveImage(path);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            saved ? "Saved to gallery!" : "PNG created but gallery save failed",
          ),
        ),
      );
      resetForm();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Widget buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("VAT Card Generator")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Screenshot(
              controller: screenshotController,
              child: VatCardPreview(
                generated: generated,
                cardNo: cardNoController.text,
                bin: binController.text,
                businessName: nameController.text,
                issueDate: issueDateController.text,
                expiryDate: expiryDateController.text,
                pdfLink: pdfLinkController.text,
                leftPix: leftPix,
                topPix: topPix,
                customFontSize: customfontSize,
                fontWeight: fontWeight,
              ),
            ),
            const SizedBox(height: 20),

            buildField("Card Number", cardNoController),

            buildField("BIN", binController),

            buildField("Business Name", nameController),

            buildField("Issue Date", issueDateController),

            buildField("Expiry Date", expiryDateController),

            buildField("PDF File Link", pdfLinkController),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: generateCard,
                    child: const Text("Generate"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: exportCard,
                    child: const Text("Save PNG"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
