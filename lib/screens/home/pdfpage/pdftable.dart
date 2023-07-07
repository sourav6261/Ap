import 'package:pdf/widgets.dart' as pw;

class PdfTable extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) => pw.UrlLink(
        destination: "url",
        child: pw.Column(children: [
          pw.Table(border: pw.TableBorder.all(), children: [
            buildRow(["S.No", "Description", "_", "Unit Price", "Total"]),
            buildRow(["S.No", "Description", "_", "_", ""]),
            buildRow(["S.No", "Description", "_", "_", ""]),
            buildRow(["S.No", "Description", "_", "_", ""]),
            buildRow(["S.No", "Description", "_", "_", ""]),
            buildRow(["S.No", "Description", "_", "_", ""]),
            buildRow(["S.No", "Description", "_", "_", ""]),
            buildRow(["S.No", "Description", "_", "_", ""]),
            buildRow(["S.No", "Description", "_", "_", ""]),
          ])
        ]),
      );
  pw.TableRow buildRow(List<String> cells) => pw.TableRow(
          children: cells.map((cell) {
        return pw.Padding(
          padding: pw.EdgeInsets.all(12),
          child: pw.Center(child: pw.Text(cell)),
        );
      }).toList());
}
