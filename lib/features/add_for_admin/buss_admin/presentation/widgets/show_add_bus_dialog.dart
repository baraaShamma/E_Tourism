import 'package:e_tourism/features/add_for_admin/buss_admin/presentation/bloc/buss_admin_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showAddBusDialog(BuildContext context) {
  final TextEditingController busNumberController = TextEditingController();
  final TextEditingController typeBusController = TextEditingController();
  final TextEditingController seatCountController = TextEditingController();

  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: Text('83'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: busNumberController,
              decoration: InputDecoration(labelText: '82'.tr()),
            ),
            TextFormField(
              controller: typeBusController,
              decoration: InputDecoration(labelText: '80'.tr()),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: seatCountController,
              decoration: InputDecoration(labelText: '81'.tr()),
            ),
            const SizedBox(height: 10),
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
              BlocProvider.of<BussAdminBloc>(context).add(
                AddBus(
                  busNumberController.text,
                  typeBusController.text,
                  seatCountController.text,
                ),
              );
              context.pop();
            },
            child: Text('84'.tr()),
          ),
        ],
      );
    },
  );
}
