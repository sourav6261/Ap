import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class UelText extends pw.StatelessWidget {
  late final String text;
  late final String url;
  UelText({required this.text, required this.url});
  @override
  pw.Widget build(final pw.Context context) => pw.UrlLink(
        destination: url,
        child: pw.Text(
          text,
          style: pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.black,
          ),
        ),
      );
}
