import 'package:e_tourism/core/util/valid_input.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/presentation/bloc/guides_admin_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showAddGuideDialog(BuildContext context) {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text('88'.tr()),
        content: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: fNameController,
                  validator: (val) {
                    return validInput(val!, 3, 10, "", context);
                  },
                  decoration: InputDecoration(labelText: '68'.tr()),
                ),
                TextFormField(
                  controller: lNameController,
                  validator: (val) {
                    return validInput(val!, 2, 10, "", context);
                  },
                  decoration: InputDecoration(labelText: '69'.tr()),
                ),
                TextFormField(
                  controller: emailController,
                  validator: (val) {
                    return validInput(val!, 5, 30, "email", context);
                  },
                  decoration: InputDecoration(labelText: '8'.tr()),
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (val) {
                    return validInput(val!, 6, 30, "", context);
                  },
                  decoration: InputDecoration(labelText: '9'.tr()),
                ),
                TextFormField(
                  controller: passwordConfirmationController,
                  validator: (val) {
                    return validInput(val!, 6, 30, "", context);
                  },
                  decoration: InputDecoration(labelText: '70'.tr()),
                ),
                TextFormField(
                  controller: addressController,
                  validator: (val) {
                    return validInput(val!, 5, 30, "", context);
                  },
                  decoration: InputDecoration(labelText: '71'.tr()),
                ),
                TextFormField(
                  controller: mobileController,
                  validator: (val) {
                    return validInput(val!, 5, 11, "", context);
                  },
                  decoration: InputDecoration(labelText: '72'.tr()),
                ),
                const SizedBox(height: 10),
              ],
            ),
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
              var formData = _formState.currentState;
              if (formData!.validate()) {
                BlocProvider.of<GuidesAdminBloc>(context).add(
                  AddGuides(
                    fNameController.text,
                    lNameController.text,
                    emailController.text,
                    passwordController.text,
                    passwordConfirmationController.text,
                    addressController.text,
                    mobileController.text,
                  ),
                );
                context.pop();
              }
            },
            child: Text('88'.tr()),
          ),
        ],
      );
    },
  );
}
