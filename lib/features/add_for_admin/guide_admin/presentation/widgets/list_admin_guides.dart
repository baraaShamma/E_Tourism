import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/features/add_for_admin/buss_admin/domain/entities/buss_entity.dart';
import 'package:e_tourism/features/add_for_admin/guide_admin/domain/entities/guide_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListAdminGuides extends StatelessWidget {
  final List<GuidesAdminEntity> guides;
  final Function(int tripId) onDelete;
  final Function(BussAdminEntity) onEdit;

  const ListAdminGuides({
    super.key,
    required this.guides,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
      itemCount: guides.length,
      itemBuilder: (context, index) {
        final guide = guides[index];
        return SizedBox(
          height: AppSizeH.s140,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${"68".tr()}:  ${guide.fName}",
                        style: TextStyle(fontSize: AppSizeSp.s17),
                      ),
                      Text(
                        "${"8".tr()}: ${guide.email}",
                        style: TextStyle(fontSize: AppSizeSp.s17),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 4,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${"69".tr()}: ${guide.lName}",
                        style: TextStyle(fontSize: AppSizeSp.s17),
                      ),
                      Text(
                        "${"72".tr()}: ${guide.mobile}",
                        style: TextStyle(fontSize: AppSizeSp.s17),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 4,
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
                                  final tripId = guide.id;
                                  onDelete(tripId);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    ));
  }
}
