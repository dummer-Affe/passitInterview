import 'package:flutter/material.dart';
import 'package:passit/product/widgets/context_updater.dart';
import 'package:url_strategy/url_strategy.dart';

import '/core/states/app_settings/app_settings.dart';
import '/core/states/app_user/app_user.dart';
import 'core/init/navigation/navigation.dart';
import 'view/tracker/register_login_tracker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppUser.init;
  AppSettings.init();
  await AppSettings.instance.setup();
  RegistrationTracker.init;
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ContextUpdater(child: child!),
    );
  }
}
