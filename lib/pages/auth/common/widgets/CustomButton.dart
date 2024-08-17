import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  VoidCallback? press;

  CustomButton(this.text, this.press);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xffC51A1B), // background color
          onPrimary: Colors.white, // foreground color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // border radius
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
