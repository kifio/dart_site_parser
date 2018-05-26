List<String> parseHrefs(String html) {
  List<String> results = new List<String>();
  const pattern = r'<a href.*\/a>';
  RegExp exp = new RegExp(pattern);
  Iterable<Match> matches = exp.allMatches(html);
  for (Match match in matches) {
    String href = match.group(0);
    results.add(getFormattedHref(href));
  }
  print('Parse ${results.length} hrefs');
  return results;
}

String getFormattedHref(String href) {
  const hrefAttr = 'href="';
  const http = 'http';
  const url = 'https://www.dartlang.org ';
  String result = href.contains(http)
    ? href
    : href.replaceAll(hrefAttr,'$hrefAttr$url');
  // print(result);
  return result;
}
