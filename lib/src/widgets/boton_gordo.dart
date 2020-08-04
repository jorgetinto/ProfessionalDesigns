import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {

  final IconData icon;
  @required final String texto;
  final Color color1;
  final Color color2;
  @required final Function onPress;

  const BotonGordo({
    this.icon = FontAwesomeIcons.circle, 
    this.texto, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey,  
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onPress,
        child: Stack(
        children: <Widget>[

          _BotonGordoBackground(icon: this.icon, color1: this.color1, color2: this.color2),
          
          Row(
            children: <Widget>[

              SizedBox(height: 100, width: 40,),

              FaIcon(this.icon, size: 40, color: Colors.white),

              SizedBox(width: 20,),

              Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 18),)),
              
              FaIcon(FontAwesomeIcons.chevronRight, size: 40, color: Colors.white),
              
              SizedBox(width: 40,),
            ],
          )

        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  _BotonGordoBackground({
    this.icon = FontAwesomeIcons.circle, 
    this.color1 = Colors.grey, 
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),        
          child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                      this.icon, 
                      size: 120, 
                      color: Colors.white.withOpacity(0.2),
                    )
            )
          ],
        ),
      ),

      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black.withOpacity(0.2), 
                      offset: Offset(2, 3), 
                      blurRadius: 10
            )
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: <Color> [
              this.color1,
              this.color2,
            ]
          )
      ),
    );
  }
}