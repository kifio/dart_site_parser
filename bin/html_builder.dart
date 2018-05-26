String buildHTML(List<String> hrefs) {

  const String htmlTop =
   '''
  <!DOCTYPE html>
  <html>
  <body>
  ''';

  const String htmlBottom =
  '''
  </body>
  </html>
  ''';

  StringBuffer stringBuffer = new StringBuffer();

  stringBuffer.write(htmlTop);
  stringBuffer.writeAll(hrefs, '<br />');
  stringBuffer.write(htmlBottom);

  print('Html was created!');

  return stringBuffer.toString();
}
