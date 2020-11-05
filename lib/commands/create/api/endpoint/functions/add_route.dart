import 'dart:io';

import 'package:ekko_cli/commands/create/api/endpoint/samples/route.dart';
import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/functions/replace_as_expected.dart';
import 'package:ekko_cli/core/functions/routes_sort.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

import 'add_navigation.dart';

Future<void> addRoute({@required String nameRoute, @required String on}) async {
  final routesFile = File(
    replaceAsExpected(path: 'lib/infrastructure/navigation/routes.dart'),
  );

  if (!await routesFile.exists()) {
    await RouteSample(initial: nameRoute.snakeCase.toUpperCase()).create();
  }

  List<String> lines = await routesFile.readAsLines();
  final line =
      '''\n\tstatic const ${nameRoute.snakeCase.toUpperCase()} = \'/$on/${nameRoute.snakeCase.toLowerCase().replaceAll('_', '-')}\';''';
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

  await routesFile.writeAsStringSync(lines.join('\n'));
  LogService.success('${nameRoute} route created successfully.');

  await addNavigation(nameRoute);
}
