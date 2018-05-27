List<String> parseHrefs(String html) {
  List<String> results = new List<String>();
  const pattern = r'<a href.*\/a>';
  RegExp exp = new RegExp(pattern);
  Iterable<Match> matches = exp.allMatches(html);
  for (Match match in matches) {
    String href = match.group(0);
    String link = getLink(href);
    if (link != null) {
      results.add(link);
    }
  }
  print('Parse ${results.length} hrefs');
  return results;
}

String getLink(String href) {

  const hrefAttr = 'href="';
  const http = 'http';
  const fragment = '#';
  const url = 'https://www.dartlang.org';

  if (href.startsWith(fragment)) {
    return null;
  } else {
    return href.contains(http)
      ? href
      : href.replaceAll(hrefAttr,'$hrefAttr$url');
  }
}
