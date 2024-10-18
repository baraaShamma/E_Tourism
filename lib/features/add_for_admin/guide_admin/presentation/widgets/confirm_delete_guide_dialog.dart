import 'package:e_tourism/features/add_for_admin/guide_admin/presentation/bloc/guides_admin_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void confirmDeleteGuides(BuildContext context, int idGuide) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('86'.tr()),
        content: Text('87'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('49'.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<GuidesAdminBloc>(context)
                  .add(DeleteGuide(idGuide));
              // );
              context.pop();
            },
            child: Text('79'.tr()),
          ),
        ],
      );
    },
  );
}
