import 'package:flutter/material.dart';
import 'package:ghaleb_1/sabet/sabet.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Barcode extends StatefulWidget {
  const Barcode({super.key});

  @override
  State<Barcode> createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SabetHa.primary,
        title: const Text("Scan a Plant"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/8.png',
                height: 400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 40,
                width: 240,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SabetHa.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () async {
                    var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(
                          appBarTitle: "Scan a Flower to have it's information",
                          isShowFlashIcon: true,
                          scanType: ScanType.defaultMode,
                        ),
                      ),
                    );
                    setState(() {
                      if (res is String) {
                        result = res;
                      }
                    });
                  },
                  child: const Text(
                    'Open Scanner',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ),
            ),
            result != '' && result != '-1'
                ? Text('Barcode Result: $result')
                : const Text('')
          ],
        ),
      ),
    );
  }
}
