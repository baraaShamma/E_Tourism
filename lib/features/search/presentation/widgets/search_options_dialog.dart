import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchOptionsDialog extends StatelessWidget {
  const SearchOptionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('54'.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('52'.tr()),
            onTap: () {
              context.pop();

              context.push('/searchByName');
            },
          ),
          ListTile(
            title: Text('43'.tr()),
            onTap: () {
              context.pop();
              context.push('/searchByDates');


            },
          ),
        ],
      ),
    );
  }
}
