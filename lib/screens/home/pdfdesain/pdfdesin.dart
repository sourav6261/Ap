import 'dart:convert';
import 'dart:io';

import 'package:ap_enterprises/model/invoicemodel/getinvoice.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeApi extends StatefulWidget {
  const HomeApi({super.key});

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {
  List<FinalData> samplePost = [];
  gt() async {
    final pdf = generatePdf();
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              print(samplePost);
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: samplePost.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Table(border: TableBorder.all(), children: [
                          buildRow([
                            "S.No",
                            "Description",
                            "qty",
                            "Unit Price",
                            "Total"
                          ]),
                          buildRow([
                            "S.No",
                            samplePost[index].address,
                            samplePost[index].siteName,
                            samplePost[index].advancePayment.toString(),
                            samplePost[index].totalAmount.toString()
                          ]),
                          buildRow([
                            "S.No",
                            samplePost[index].address,
                            samplePost[index].siteName,
                            samplePost[index].advancePayment.toString(),
                            samplePost[index].totalAmount.toString()
                          ]),
                          buildRow([
                            "S.No",
                            samplePost[index].address,
                            samplePost[index].siteName,
                            samplePost[index].advancePayment.toString(),
                            samplePost[index].totalAmount.toString()
                          ]),
                          buildRow([
                            "S.No",
                            samplePost[index].address,
                            samplePost[index].siteName,
                            samplePost[index].advancePayment.toString(),
                            samplePost[index].totalAmount.toString()
                          ]),
                          buildRow([
                            "S.No",
                            samplePost[index].address,
                            samplePost[index].siteName,
                            samplePost[index].advancePayment.toString(),
                            samplePost[index].totalAmount.toString()
                          ]),
                          buildRow([
                            "S.No",
                            samplePost[index].address,
                            samplePost[index].siteName,
                            samplePost[index].advancePayment.toString(),
                            samplePost[index].totalAmount.toString()
                          ]),
                          buildRow([
                            "S.No",
                            samplePost[index].address,
                            samplePost[index].siteName,
                            samplePost[index].advancePayment.toString(),
                            samplePost[index].totalAmount.toString()
                          ]),
                        ]),
                        SizedBox(
                          height: 10,
                        )
                      ]);
                    });
              } else {
                print(snapshot);
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
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

  TableRow buildRow(List<String> cells) => TableRow(
          children: cells.map((cell) {
        return Padding(
          padding: EdgeInsets.all(12),
          child: Center(child: Text(cell)),
        );
      }).toList());
}

pw.Document generatePdf() {
  final pdf = pw.Document();

  // Define table headers
  final headers = ['Name', 'Address', 'Site Name', 'Advance Payment'];

  // Define table data
  final data = [
    ['John Doe', '123 Main St', 'Site A', '5000'],
    ['Jane Smith', '456 Elm St', 'Site B', '8000'],
    // Add more rows as needed
  ];

  // Create a table
  final table = pw.Table.fromTextArray(
    headers: headers,
    data: data,
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
    cellAlignment: pw.Alignment.center,
    cellStyle: pw.TextStyle(fontSize: 12),
    border: pw.TableBorder.all(),
    headerDecoration: pw.BoxDecoration(
      color: PdfColors.grey300,
    ),
    headerHeight: 30,
    cellHeight: 25,
  );

  // Add the table to the PDF document
  pdf.addPage(pw.Page(build: (pw.Context context) {
    return pw.Container(child: table);
  }));

  return pdf;
}
