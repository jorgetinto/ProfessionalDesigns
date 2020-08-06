import 'package:custom_painter/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:custom_painter/src/routes/routes.dart';
import 'package:provider/provider.dart';


class LaucherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseño en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListOpciones(),
    );
  }
}

class _ListOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme  = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (context, i) => ListTile(

        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => pageRoutes[i].page));
        },
      ), 
       
    );
  }
}

class _MenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[

            SafeArea(
              child: Container(
                width: double.infinity,
                height: 180,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text('JP', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            Expanded(
              child: _ListOpciones()
            ),

            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.blue,
                onChanged: (value)  => appTheme.darkTheme = value
              ),
            ),

            SafeArea(
              bottom: true,
              top:    false,
              right:  false,
              left:   false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                  onChanged: (value) => appTheme.customTheme = value
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}