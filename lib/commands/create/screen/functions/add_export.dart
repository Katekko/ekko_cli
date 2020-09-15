import 'dart:io';

import 'package:meta/meta.dart';

import 'replace_as_expected.dart';

Future<void> addExport({
  @required String path,
  @required String line,
}) async {
  File _file = File(replaceAsExpected(path: path));
  if (!await _file.exists()) {
    await _file.create(recursive: true);
    await _file.writeAsString(line);
    return;
  }
  List<String> lines = await _file.readAsLines();

  if (lines.length > 1) {
    if (lines.contains(line)) {
      return;
    }
    while (lines.last.isEmpty) {
      lines.removeLast();
    }
  }

  lines.add(line);

  lines.sort();

  await _file.writeAsStringSync(lines.join('\n'));
}
