import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/features/add_for_admin/tourist_programs_admin/domain/entities/tourist_program_entity.dart';
import 'package:e_tourism/link_api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListAdminTouristPrograms extends StatelessWidget {
  final List<TouristProgramAdminEntity> tourist;
  final Function(int tripId) onDelete;
  final Function(TouristProgramAdminEntity) onEdit;

  const ListAdminTouristPrograms({
    super.key,
    required this.tourist,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
      itemCount: tourist.length,
      itemBuilder: (context, index) {
        final program = tourist[index];
        return SizedBox(
          height: AppSizeH.s150,
          child: Card(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.network(AppLink.baseUrlImage + program.image),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      program.name,
                      style: TextStyle(fontSize: AppSizeSp.s19),
                    ),
                    Text(
                      program.type,
                      style: TextStyle(fontSize: AppSizeSp.s19),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                onEdit(program);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                final tripId = program.id;
                                onDelete(tripId);
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("83".tr())),
                      ))
                    ],
                  ))
            ],
          )),
        );
      },
    ));
  }
}
