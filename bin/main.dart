import 'dart:convert';
import 'dart:io';
import 'parser.dart';
import 'html_builder.dart';
import 'file_writer.dart';

void main(List<String> args) {
  List<String> hrefs = new List<String>();
  const String url = "https://www.dartlang.org/guides/language/language-tour";
  HttpClient client = new HttpClient();
  client.getUrl(Uri.parse(url))
    .then((HttpClientRequest request) {
      print('Make request: ${request.toString()}');
      return request.close();
    })
    .then((HttpClientResponse response) {
      response.transform(UTF8.decoder)
        .listen((html) {
          hrefs.addAll(parseHrefs(html));
        }, onDone: () {
          String clearHtml = buildHTML(hrefs);
          writeToFile(clearHtml);
        });
    });
}
