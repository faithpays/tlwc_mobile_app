import 'package:flutter/material.dart';

class ImageTop extends StatelessWidget {
  const ImageTop({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 3.5,
      width: width,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage("images/home.jpeg"), fit: BoxFit.cover),
        //border: Border.all(color: Colors.blueAccent)
      ),
      // child: Text("My Awesome Border"),
    );
  }
}
