import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/firebase_options.dart';
import 'package:travel_link/src/utils/theme/theme.dart';

import 'src/routing/app_router.dart';
import 'src/utils/helpers/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Initialize FirebaseS
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.darkTheme, //.darkTheme
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.loc.appTitle,
      // localizationsDelegates:
      //   AppLocalizations.localizationsDelegates,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],

      supportedLocales: AppLocalizations.supportedLocales,
      // use to find missing semantics
      // showSemanticsDebugger: true,
    );
  }
}
