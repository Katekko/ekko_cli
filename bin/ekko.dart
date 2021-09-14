import 'package:ekko_cli/ekko_cli.dart';

Future<void> main(List<String> arguments) async {
  final command = EkkoCli(arguments).findCommand();
  if (command.validate()) {
    await command.execute();
  }
}
