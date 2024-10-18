
import 'package:e_tourism/features/add_for_admin/buss_admin/presentation/bloc/buss_admin_bloc.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/presentation/widgets/confirm_delete_bus_dialog.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/presentation/widgets/list_admin_buss.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/presentation/widgets/show_add_bus_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBussScreen extends StatelessWidget {
  const AdminBussScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('75'.tr())),
      body: BlocListener<BussAdminBloc, BussAdminState>(
        listener: (context, state) {},
        child: BlocBuilder<BussAdminBloc, BussAdminState>(
          builder: (context, state) {
            if (state is BussLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BussLoaded) {
              return ListAdminBuss(
                tourist: state.buss,
                onDelete: (busId) {
                  confirmDeleteBus(context, busId);
                },
                onEdit: (programs) {
                },
              );
            } else if (state is BussError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('76'.tr()));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddBusDialog(context);
        },
      ),
    );
  }
}
