import 'package:ekko_cli/core/sample.dart';

class NavigationSample extends Sample {
  @override
  String get content => '''import 'package:get_server/get_server.dart';

import '../../presentation/endpoints.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';


class Nav {
  static List<GetPage> routes = [
  ];
}''';

  @override
  bool get overwrite => false;

  @override
  String get path => 'lib/infrastructure/navigation/navigation.dart';
}
