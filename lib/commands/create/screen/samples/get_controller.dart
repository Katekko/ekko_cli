import 'package:get_cli/core/sample.dart';
import 'package:meta/meta.dart';

class ControllerSample extends Sample {
  String _path;
  String _fileName;
  ControllerSample({@required String path, @required String fileName}) {
    _path = path;
    _fileName = fileName;
  }

  @override
  Future<String> get content async => '''import 'package:get/get.dart';

class $_fileName extends GetxController {
  //TODO: Implement $_fileName
  
  final count = 0.obs;
  void increment() => count.value++;
}
''';

  @override
  bool get overwrite => false;

  @override
  String get path => _path;
}
