import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stimassign/core/core_services/navigation_provider.dart';
import 'package:stimassign/core/route/routes.dart';
import 'package:stimassign/core/utils/theme/theme_provider.dart';
import 'package:stimassign/data/providers/login_provider.dart';

import 'core/utils/dimensions.dart';

Future<void> main() async {



  runApp(
      const ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeNotifier = ref.watch(themeNotifierProvider);
    ref.read(loginViewModelProvider.notifier).loadUser();
    Dimensions.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      navigatorKey: ref.watch(navigationProvider).navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.homeScreen,
    );
  }




}
