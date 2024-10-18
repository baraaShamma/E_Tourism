import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/entities/buss_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListAdminBuss extends StatelessWidget {
  final List<BussAdminEntity> tourist;
  final Function(int tripId) onDelete;
  final Function(BussAdminEntity) onEdit;

  const ListAdminBuss({
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
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${"80".tr()} ${program.bus_type}",
                      style: TextStyle(fontSize: AppSizeSp.s19),
                    ),
                    Text(
                      "${"81".tr()} ${program.seat_count.toString()}",
                      style: TextStyle(fontSize: AppSizeSp.s19),
                    ),
                    Text(
                      "${"82".tr()} ${program.bus_number.toString()}",
                      style: TextStyle(fontSize: AppSizeSp.s19),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                    ],
                  ))
            ],
          )),
        );
      },
    ));
  }
}
