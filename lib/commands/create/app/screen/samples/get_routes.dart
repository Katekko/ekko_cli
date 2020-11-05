import 'package:ekko_cli/core/sample.dart';
import 'package:meta/meta.dart';

class RouteSample extends Sample {
  String _initial;
  RouteSample({@required String initial}) {
    _initial = initial;
  }

  @override
  String get content => '''
class Routes {
  static Future<String> get initialRoute async {
    return $_initial;
  }
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => 'lib/infrastructure/navigation/routes.dart';
}
