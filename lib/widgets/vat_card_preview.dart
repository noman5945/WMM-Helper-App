import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VatCardPreview extends StatelessWidget {
  final bool generated;

  final String cardNo;
  final String bin;
  final String businessName;
  final String issueDate;
  final String expiryDate;
  final String pdfLink;

  final double leftPix;
  final double topPix;
  final double customFontSize;
  final FontWeight fontWeight;

  const VatCardPreview({
    super.key,
    required this.generated,
    required this.cardNo,
    required this.bin,
    required this.businessName,
    required this.issueDate,
    required this.expiryDate,
    required this.pdfLink,
    required this.leftPix,
    required this.topPix,
    required this.customFontSize,
    required this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/vatcard.png", fit: BoxFit.contain),
          ),

          if (generated)
            Positioned(
              right: 38,
              bottom: 17,
              child: Container(
                width: 70,
                height: 70,
                color: Colors.white,
                child: QrImageView(data: pdfLink, version: QrVersions.auto),
              ),
            ),

          if (generated)
            Positioned(
              left: leftPix,
              top: topPix,
              child: Text(
                cardNo,
                style: TextStyle(
                  fontSize: customFontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),

          if (generated)
            Positioned(
              left: leftPix,
              top: topPix + 10,
              child: Text(
                bin,
                style: TextStyle(
                  fontSize: customFontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),

          if (generated)
            Positioned(
              left: leftPix,
              top: topPix + 20,
              child: Text(
                businessName,
                style: TextStyle(
                  fontSize: customFontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),

          if (generated)
            Positioned(
              left: leftPix,
              top: topPix + 30,
              child: Text(
                issueDate,
                style: TextStyle(
                  fontSize: customFontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),

          if (generated)
            Positioned(
              left: leftPix,
              top: topPix + 40,
              child: Text(
                expiryDate,
                style: TextStyle(
                  fontSize: customFontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
