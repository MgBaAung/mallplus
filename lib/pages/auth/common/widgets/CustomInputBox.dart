import 'package:flutter/material.dart';

class CustomInputBox extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? iconData;
  final ImageProvider? image;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final TextInputType? type;
  final bool isprefixtext;
  final String? prefixtext;

  CustomInputBox(this.label, this.hint,
      {this.iconData, this.image, this.controller, this.validator, this.type, required this.isprefixtext,this.prefixtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(

            hintText: hint,
            prefixIcon: isprefixtext ? prefixtext != null? Container(width: 30,height:30,child:Center(child:Text(prefixtext!))):Container(width:30,height:30,child: Center(child:Text("")),)  : iconData != null
                ? Icon(iconData, color: Colors.grey[600])
                : (image != null
                    ? ImageIcon(image, color: Colors.grey[600])
                    : null),
            prefixStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
            filled: true,
            fillColor: Colors.grey[200],
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
