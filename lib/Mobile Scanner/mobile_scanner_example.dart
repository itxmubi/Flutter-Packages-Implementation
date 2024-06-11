import 'package:flutter/material.dart';

import 'bar_code_scanner_controller.dart';
import 'barcode_scanner_listview.dart';
import 'barcode_scanner_overlay.dart';
import 'barcode_scanner_pageview.dart';
import 'barcode_scanner_simple.dart';
import 'barcode_scanner_window.dart';
import 'barcode_scanner_zoom.dart';
import 'barcodescanner_returning_image.dart';

class MobileScannerExample extends StatelessWidget {
  const MobileScannerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerSimple(),
                  ),
                );
              },
              child: const Text('MobileScanner Simple'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerListView(),
                  ),
                );
              },
              child: const Text('MobileScanner with ListView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithController(),
                  ),
                );
              },
              child: const Text('MobileScanner with Controller'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithScanWindow(),
                  ),
                );
              },
              child: const Text('MobileScanner with ScanWindow'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerReturningImage(),
                  ),
                );
              },
              child: const Text(
                'MobileScanner with Controller (returning image)',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerWithZoom(),
                  ),
                );
              },
              child: const Text('MobileScanner with zoom slider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BarcodeScannerPageView(),
                  ),
                );
              },
              child: const Text('MobileScanner pageView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BarcodeScannerWithOverlay(),
                  ),
                );
              },
              child: const Text('MobileScanner with Overlay'),
            ),
          ],
        ),
      ),
    );
  }
}
