import 'package:custom_painter/src/models/layout_model.dart';
import 'package:custom_painter/src/pages/laucher_tablet_page.dart';
import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/laucher_page.dart';
import 'package:provider/provider.dart';

 
void main() => runApp(
  MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value:ThemeChanger(2)),
          ChangeNotifierProvider.value(value:LayoutModel()),
        ],
        child: MyApp(),
      ),
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Diseños App',
      home: OrientationBuilder(
        builder: (context, orientation) {

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LaucherTabletPage();
          }else {
            return LaucherPage();  
          }         
        },
      )
    );
  }
}