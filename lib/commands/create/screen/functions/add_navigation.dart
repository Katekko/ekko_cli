import 'dart:io';

import 'package:ekko_cli/common/utils/logger/logger.dart';
import 'package:ekko_cli/core/functions/replace_as_expected.dart';
import 'package:recase/recase.dart';

import '../samples/get_navigation.dart';

Future<void> addNavigation(String name) async {
  File navigationFile = File(
    replaceAsExpected(path: 'lib/infrastructure/navigation/navigation.dart'),
  );

  if (!await navigationFile.exists()) {
    await NavigationSample().create();
  }

  var lines = navigationFile.readAsLinesSync();

  while (lines.last.isEmpty) {
    lines.removeLast();
  }
  if (lines.last.trim() != '}') {
    lines.last = lines.last.replaceAll('}', '');
    lines.add('}');
  }
  int indexStartNavClass = lines.indexWhere(
    (line) => line.contains('class Nav'),
  );
  int index =
      lines.indexWhere((element) => element.contains('];'), indexStartNavClass);
  if (lines[index].trim() != '];') {
    lines[index] = lines[index].replaceAll('];', '');
    index++;
    lines.insert(index, '  ];');
  }

  lines.insert(index, '''    GetPage(
      name: Routes.${name.snakeCase.toUpperCase()},
      page: () => ${name.pascalCase}Screen(),
      binding: ${name.pascalCase}ControllerBinding(),
    ),    ''');

  navigationFile.writeAsStringSync(lines.join('\n'));
  LogService.success('${name.pascalCase} navigation added successfully.');
}
