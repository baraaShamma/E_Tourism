import 'package:e_tourism/features/add_for_admin/guide_admin/presentation/bloc/guides_admin_bloc.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/presentation/widgets/confirm_delete_guide_dialog.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/presentation/widgets/list_admin_guides.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/presentation/widgets/show_add_guide_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminGuidesScreen extends StatelessWidget {
  const AdminGuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('85'.tr())),
      body: BlocBuilder<GuidesAdminBloc, GuidesAdminState>(
        builder: (context, state) {
          if (state is GuidesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GuidesLoaded) {
            return ListAdminGuides(
              guides: state.guides,
              onDelete: (guideId) {
                confirmDeleteGuides(context, guideId);
              },
              onEdit: (programs) {},
            );
          } else if (state is GuidesError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No guides available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddGuideDialog(context);
        },
      ),
    );
  }
}
