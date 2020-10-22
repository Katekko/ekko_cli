import 'dart:io';

import 'package:ekko_cli/commands/create/screen/samples/get_routes.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:recase/recase.dart';

import 'add_navigation.dart';
import 'replace_as_expected.dart';

Future<void> addRoute(String nameRoute) async {
  File routesFile = File(
    replaceAsExpected(path: 'lib/infrastructure/navigation/routes.dart'),
  );

  if (!await routesFile.exists()) {
    await RouteSample(initial: nameRoute.snakeCase.toUpperCase()).create();
  }

  List<String> lines = await routesFile.readAsLines();
  String line =
      '''\n\tstatic const ${nameRoute.snakeCase.toUpperCase()} = \'/${nameRoute.snakeCase.toLowerCase().replaceAll('_', '-')}\';''';
  if (lines.contains(line)) {
    return;
  }

  while (lines.last.isEmpty) {
    lines.removeLast();
  }

  if (lines.last.trim() != '}') {
    lines.last = lines.last.replaceAll('}', '');
    lines.add('}');
  }

  lines.add(line);

  _routesSort(lines);

  await routesFile.writeAsStringSync(lines.join('\n'));
  LogService.success('${nameRoute} route created successfully.');

  await addNavigation(nameRoute);
}

List<String> _routesSort(List<String> lines) {
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
