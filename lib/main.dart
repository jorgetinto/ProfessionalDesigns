import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/laucher_page.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => new ThemeChanger(1),
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Diseños App',
      home: LaucherPage()
    );
  }
}