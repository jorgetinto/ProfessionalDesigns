import 'package:custom_painter/src/theme/theme.dart';
import 'package:custom_painter/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final childrens = [
      Expanded(child: MiSlideshow()),
      Expanded(child: MiSlideshow()),
    ];

    return Scaffold(
      body: (isLarge)   
              ? Column(children: childrens,)
              : Row(children: childrens,)
    );
  }
}

class MiSlideshow extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
      puntosArriba: false,
      colorPrimario: ( appTheme.darkTheme ) ? accentColor : Color(0xffFF5A7E),
      colorSecundario: Colors.grey,
      bulletPrimario: 12,
      bulletSecundario: 10,      
    );
  }
}
