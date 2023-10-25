import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class DownloadPdf extends StatelessWidget {
  const DownloadPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}








class Timings{
  String? checkin;
  String? checkout;
  
  Timings({
    required this.checkin,
    required this.checkout,
    });
}



class PdfService {
  Future<void> printCustomersPdf(List<Timings> data) async {
    //Create a new PDF document
    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();
    
    //Define number of columns in table
    grid.columns.add(count: 5);
    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = "checkin";
    header.cells[1].value = "checkout";
    //Add header style
    header.style = PdfGridCellStyle(
      backgroundBrush: PdfBrushes.lightGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );

    //Add rows to grid
    for (final customer in data) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = customer.checkin;
      row.cells[1].value = customer.checkout;
    }
    //Add rows style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 10, right: 3, top: 4, bottom: 5),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );
    
    //Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));    
    List<int> bytes = await document.save();
  
    //Download document
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "report.pdf")
      ..click();

    //Dispose the document
    document.dispose();
  }
}




