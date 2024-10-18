import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/bloc/tourist_programs_admin__bloc.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/widgets/confirm_delete_dialog.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/widgets/list_admin_tourist_programs.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/widgets/show_add_program_dialog.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/presentation/widgets/show_edit_program_dialog.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminTouristProgramsScreen extends StatelessWidget {
  const AdminTouristProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('25'.tr())),
      body: BlocListener<TouristProgramsAdminBloc, TouristProgramsAdminState>(
        listener: (context, state) {},
        child: BlocBuilder<TouristProgramsAdminBloc, TouristProgramsAdminState>(
          builder: (context, state) {
            if (state is TouristProgramsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TouristProgramsLoaded) {
              return ListAdminTouristPrograms(
                tourist: state.programs,
                onDelete: (tripId) {
                  confirmDelete(context, tripId);
                },
                onEdit: (programs) {
                  showEditProgramDialog(context, programs);
                },
              );
            } else if (state is TouristProgramsError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No programs available'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddProgramDialog(context);
        },
      ),
    );
  }
}
