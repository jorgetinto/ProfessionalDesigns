import 'package:custom_painter/src/theme/theme.dart';
import 'package:custom_painter/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;
    return Scaffold(
      body: HeaderWave(color:  accentColor)
    );
  }
}