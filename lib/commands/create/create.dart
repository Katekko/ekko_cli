import 'package:ekko_cli/ekko_cli.dart';

mixin CreateMixin {
  final _args = EkkoCli.arguments;

  bool get withOn => _args.length > 2 && _args[2] == 'on';
  String get on => EkkoCli.arguments[3];

  bool get hasName => _args[1].split(':').length > 1;
  String get name => _args[1].split(':')[1];
}
