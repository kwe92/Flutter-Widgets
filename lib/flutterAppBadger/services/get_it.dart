import 'package:flutter_widgets/flutterAppBadger/services/flutter_app_badger_service.dart';
import 'package:get_it/get_it.dart';

final flutterBadgerLocator = GetIt.I;

void configureFlutterBadgerDependency() {
  flutterBadgerLocator.registerSingleton<FlutterAppBadgerService>(FlutterAppBadgerService());
}
