import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:flutter/material.dart';

class TextLinkWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function() onTap;

  const TextLinkWidget(
      {Key? key,
      required this.textOne,
      required this.textTwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          style: TextStyle(
            fontSize: AppSizeSp.s15,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: AppSizeSp.s15,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
