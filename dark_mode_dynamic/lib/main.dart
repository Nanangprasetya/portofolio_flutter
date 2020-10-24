import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dark_mode_dynamic/page/city.dart';
import 'package:dark_mode_dynamic/page/dialog.dart';
import 'package:dark_mode_dynamic/page/theme_color_page.dart';
import 'package:dark_mode_dynamic/page/home.dart';
import 'package:dark_mode_dynamic/page/not_found.dart';
import 'package:dark_mode_dynamic/util/custom_route_util.dart';
import 'package:dark_mode_dynamic/util/theme_util.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final saveThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(adaptiveTheme: saveThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode adaptiveTheme;

  const MyApp({Key key, this.adaptiveTheme}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeUtil.lightThemeData,
      dark: ThemeUtil.darkThemeData,
      initial: adaptiveTheme ?? AdaptiveThemeMode.light,
      builder: (theme, darktheme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          darkTheme: darktheme,
          home: HomePage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/home':
                return CustomRouteUtil(
                  builder: (context) => HomePage(),
                );
              case '/theme':
                return CustomRouteUtil(
                  builder: (context) => ColorThemePage(),
                );
              case '/city':
                return CustomRouteUtil(
                  builder: (context) => CityPage(),
                );
              case '/dialog':
                return CustomRouteUtil(
                  builder: (context) => DialogPage(),
                );
              default:
                return CustomRouteUtil(
                  builder: (context) => NotFound(),
                );
            }
          },
        );
      },
    );
  }
}
