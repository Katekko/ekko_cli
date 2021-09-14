import 'dart:io';

import 'package:ekko_cli/commands/create/app/screen/samples/get_routes.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/functions/replace_as_expected.dart';
import 'package:ekko_cli/core/functions/routes_sort.dart';
import 'package:recase/recase.dart';

import 'add_navigation.dart';

Future<void> addRoute(String nameRoute) async {
  File routesFile = File(
    replaceAsExpected(path: 'lib/infrastructure/navigation/routes.dart'),
  );

  if (!await routesFile.exists()) {
    await RouteSample(initial: nameRoute.snakeCase.toUpperCase()).create();
  }

  List<String> lines = await routesFile.readAsLines();
  String line =
      '''\n\tstatic const ${nameRoute.snakeCase.toUpperCase()} = '/${nameRoute.snakeCase.toLowerCase().replaceAll('_', '-')}';''';
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

  routesSort(lines);

  routesFile.writeAsStringSync(lines.join('\n'));
  LogService.success('$nameRoute route created successfully.');

  await addNavigation(nameRoute);
}
