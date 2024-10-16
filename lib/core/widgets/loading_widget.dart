import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: AppSizeH.s50,
          width: 30,
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
