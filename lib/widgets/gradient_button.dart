import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? fun;
  final String text;
  const GradientButton({Key? key, required this.fun, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,

            colors: <Color>[
              Colors.blueAccent,
              Colors.deepPurple
            ], // red to yellow
            tileMode: TileMode.decal, // repeats the gradient over the canvas
          ),
        ),
        child: MaterialButton(
            onPressed: fun,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )));
  }
}
