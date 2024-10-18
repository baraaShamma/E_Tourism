import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/bloc/tourist_programs_admin__bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void confirmDelete(BuildContext context, int programId) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text('89'.tr()),
        content: Text('90'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('49'.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<TouristProgramsAdminBloc>(context)
                  .add(DeleteTouristProgram(programId));
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