import 'package:ekko_cli/core/sample.dart';

class NavigationSample extends Sample {
  @override
  String get content => '''import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/screens.dart';
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
