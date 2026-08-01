import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cardNoController = TextEditingController();
  final binController = TextEditingController();
  final nameController = TextEditingController();
  final issueDateController = TextEditingController();
  final expiryDateController = TextEditingController();
  final pdfLinkController = TextEditingController();

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
            AspectRatio(
              aspectRatio: 1.75,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/vatcard.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  if (generated)
                    Positioned(
                      right: 18,
                      bottom: 18,
                      child: Container(
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: QrImageView(
                          data: pdfLinkController.text,
                          version: QrVersions.auto,
                        ),
                      ),
                    ),

                  if (generated)
                    Positioned(
                      left: leftPix,
                      top: topPix,
                      child: Text(
                        cardNoController.text,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  if (generated)
                    Positioned(
                      left: leftPix,
                      top: topPix + 10,
                      child: Text(
                        binController.text,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  if (generated)
                    Positioned(
                      left: leftPix,
                      top: topPix + 20,
                      child: Text(
                        nameController.text,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  if (generated)
                    Positioned(
                      left: leftPix,
                      top: topPix + 30,
                      child: Text(
                        issueDateController.text,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  if (generated)
                    Positioned(
                      left: leftPix,
                      top: topPix + 40,
                      child: Text(
                        expiryDateController.text,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
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

            ElevatedButton(
              onPressed: generateCard,
              child: const Text("Generate"),
            ),
          ],
        ),
      ),
    );
  }
}
