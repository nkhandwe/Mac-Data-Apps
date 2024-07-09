import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
      ),
      body: PDFView(
        filePath: "https://www.africau.edu/images/default/sample.pdf",
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (pages) {
          setState(() {
            pages = pages;
            isReady = true;
          });
        },
        onError: (error) {
          if (kDebugMode) {
            print(error.toString());
          }
        },
        onPageError: (page, error) {
          if (kDebugMode) {
            print('$page: ${error.toString()}');
          }
        },
        onViewCreated: (PDFViewController pdfViewController) {
          _controller.complete(pdfViewController);
        },
        onPageChanged: (int? page, int? total) {
          if (kDebugMode) {
            print('page change: $page/$total');
          }
        },
      ),
    );
  }
}
