import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;

  CustomButtonSocial({
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.grey.shade50,
      ),
      child: FlatButton(
        onPressed: onPress as void Function()?,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: Container(
          child: Row(
            children: [
              Image.asset(imageName),
              SizedBox(
                width: 50,
              ),
              CustomText(
                text: text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
