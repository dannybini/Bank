import 'package:flutter/material.dart';

class CliperWidget extends StatelessWidget {
  const CliperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: BottomWaveClipper(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: <Color>[
                  Colors.blueAccent,
                  Colors.deepPurple
                ], // red to yellow
                tileMode:
                    TileMode.clamp, // repeats the gradient over the canvas
              ),
            ),
            width: size.width,
            height: size.height * .3,
          ),
        ),
        Opacity(
          opacity: .7,
          child: ClipPath(
            clipper: BottomWaveClipper(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: <Color>[
                    Colors.blueAccent,
                    Colors.deepPurple
                  ], // red to yellow
                  tileMode:
                      TileMode.clamp, // repeats the gradient over the canvas
                ),
              ),
              width: size.width,
              height: size.height * .2,
            ),
          ),
        ),
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * .1);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.7, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.1);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
