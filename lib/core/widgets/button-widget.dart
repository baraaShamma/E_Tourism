import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ButtonWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(top: AppSizeSp.s10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizeR.s40)),
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text(text,
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizeSp.s18)),
      ),
    );
  }
}
