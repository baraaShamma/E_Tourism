import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/entities/tourist_program_entity.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/bloc/tourist_programs_admin__bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showEditProgramDialog(
    BuildContext context, TouristProgramAdminEntity program) {
  final TextEditingController nameController =
      TextEditingController(text: program.name);
  final TextEditingController typeController =
      TextEditingController(text: program.type);
  final TextEditingController descriptionController =
      TextEditingController(text: program.description);

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text('96'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: '92'.tr()),
            ),
            TextFormField(
              controller: typeController,
              decoration: InputDecoration(labelText: '93'.tr()),
            ),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: '94'.tr()),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('49'.tr()),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<TouristProgramsAdminBloc>(context).add(
                UpdateTouristProgram(
                  program.id,
                  typeController.text,
                  nameController.text,
                  descriptionController.text,
                ),
              );
              context.pop();
            },
            child: Text('97'.tr()),
          ),
        ],
      );
    },
  );
}
