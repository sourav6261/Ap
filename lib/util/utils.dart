import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../model/invoicemodel/getinvoice.dart';

List<FinalData> samplePost = [];
Future<Uint8List> generatePdf(final PdfPageFormat format) async {
  final doc = pw.Document(title: "Flutter ");
  final logoImage = pw.MemoryImage(
      (await rootBundle.load("assets/AP.png")).buffer.asUint8List());

  final footerImage = pw.MemoryImage(
      (await rootBundle.load("assets/Wallpaper.jpeg")).buffer.asUint8List());

  final font = await rootBundle.load("assets/AP.png");

  final ttf = pw.Font.ttf(font);

  final pageTheme = await _myPageThime(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      header: (final context) => pw.Image(
        alignment: pw.Alignment.topLeft,
        logoImage,
        fit: pw.BoxFit.contain,
        width: 180,
      ),
      footer: (final context) => pw.Image(
        footerImage,
        fit: pw.BoxFit.scaleDown,
      ),
      build: (final context) => [
        pw.Container(
          padding: pw.EdgeInsets.only(left: 30, bottom: 20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Bill From", style: pw.TextStyle()),
                      pw.SizedBox(
                        height: 10,
                      ),
                      pw.Text("Amit Jaware"),
                      pw.Text("Daund dist ,pune"),
                      pw.Text("Phone no: 8007777185"),
                      pw.Text("Email: Amitjaware@gmail.com"),
                    ],
                  ),
                  pw.SizedBox(height: 70),
                ],
              ),
            ],
          ),
        ),
        // pw.Center(child: PdfTable())
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Table(children: [
              // for (var i = 0; i < reportedItems.length; i++)
              pw.TableRow(children: [
                for (var i = 0; i < samplePost.length; i++)
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text("S.No", style: pw.TextStyle(fontSize: 6)),
                        pw.Divider(thickness: 1)
                      ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text("Description", style: pw.TextStyle(fontSize: 6)),
                      pw.Divider(thickness: 1)
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text("qty", style: pw.TextStyle(fontSize: 6)),
                      pw.Divider(thickness: 1)
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text('Unit Price', style: pw.TextStyle(fontSize: 6)),
                      pw.Divider(thickness: 1)
                    ]),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text('Totale', style: pw.TextStyle(fontSize: 6)),
                      pw.Divider(thickness: 1)
                    ])
              ])
            ])
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<List<FinalData>> getData() async {
  final response = await http.get(Uri.parse(
      'https://server-dot-sanjoli-sarees-387012.el.r.appspot.com/getInvoice'));
  var d = response.body;
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (Map<String, dynamic> index in data) {
      samplePost.add(FinalData.fromJson(index));
    }
    return samplePost;
  } else {
    return samplePost;
  }
}

Future<pw.PageTheme> _myPageThime(PdfPageFormat format) async {
  final logoImage = pw.MemoryImage(
      (await rootBundle.load("assets/AP.png")).buffer.asUint8List());
  return pw.PageTheme(
    margin: const pw.EdgeInsets.symmetric(
        horizontal: 1 * PdfPageFormat.cm, vertical: 0.5 * PdfPageFormat.cm),
    textDirection: pw.TextDirection.ltr,
    orientation: pw.PageOrientation.portrait,
    buildBackground: (final context) => pw.FullPage(
      ignoreMargins: true,
      child: pw.Watermark(
        angle: 20,
        child: pw.Opacity(
          opacity: 0.5,
          child: pw.Image(
              alignment: pw.Alignment.center, logoImage, fit: pw.BoxFit.cover),
        ),
      ),
    ),
  );
}

Future saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
) async {
  final bytes = await build(pageFormat);
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/document.pdf');
  print('save as file${file.path}...........');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Doc Printed ")));
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Doc Shared ")));
}
