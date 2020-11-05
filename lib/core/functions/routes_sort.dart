List<String> routesSort(List<String> lines) {
  var routes = <String>[];
  var lines2 = <String>[];
  lines2.addAll(lines);
  lines2.forEach((line) {
    if (line.contains('static const')) {
      routes.add('$line');
      lines.remove(line);
    }
  });
  routes.sort();
  lines.insertAll(lines.length - 1, routes);
  return lines;
}
