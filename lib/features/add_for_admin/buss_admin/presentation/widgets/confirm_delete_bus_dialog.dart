import 'package:e_tourism/features/add_for_admin/buss_admin/presentation/bloc/buss_admin_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void confirmDeleteBus(BuildContext context, int busId) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('77'.tr()),
        content: Text('78'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('49'.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<BussAdminBloc>(context)
                  .add(DeleteBus(busId));
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