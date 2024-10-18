import 'dart:io';

import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/bloc/tourist_programs_admin__bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> _pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  }
  return null;
}

void showAddProgramDialog(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? _pickedImage;

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text('91'.tr()),
        content: SingleChildScrollView(
          child: Column(
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
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async{
                  _pickedImage = await _pickImage();
                },
                child: Text('95'.tr()),
              ),
            ],
          ),
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
                AddTouristProgram(
                  typeController.text,
                  nameController.text,
                  descriptionController.text,
                  _pickedImage!,
                ),
              );
              context.pop();
            },
            child: Text('إضافة'),
          ),
        ],
      );
    },
  );
}
