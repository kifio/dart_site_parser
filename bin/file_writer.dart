import 'dart:io';

void writeToFile(String html) {
  print('Write to file');
  File languageDart = new File('language_dart.html');

  languageDart.exists().then((exists) {
    if (exists) {
      print('Delete old file');
      languageDart.delete();
    }
  });

  languageDart.create().then((file) {
    print('Write to file');
    file.writeAsString(html).then((_) {
      print('All content was successfully writen');
      exit(0);
    });
  });
}
