import 'package:flutter/material.dart';

import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:animated_background/animated_background.dart';

class Background extends StatefulWidget {
  const Background(this.particleColor, {Key? key}) : super(key: key);
  final Color particleColor;
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBackground(
          child: Container(),
          vsync: this,
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: widget.particleColor,
            ),
          ),
        ),
        GlassContainer(
          blur: 5,
          border: 0,
        ),
      ],
    );
  }
}
