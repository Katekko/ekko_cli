import 'package:ekko_cli/ekko_cli.dart';

mixin CreateMixin {
  final _args = EkkoCli.arguments;

  bool get withOn => _args.length > 3 && _args[3] == 'on';
  String get on => EkkoCli.arguments[4];

  String get name {
    return _args[1].split(':')[1];
  }
}
