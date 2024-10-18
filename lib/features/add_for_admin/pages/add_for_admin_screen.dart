import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddForAdminScreen extends StatelessWidget {
  const AddForAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s22, vertical: AppSizeH.s20),
              child: Row(
                children: [
                  Icon(Icons.trip_origin, color: Colors.blue, size: AppSizeH.s25),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("البرامج السياحية",
                      style: TextStyle(
                          color: Colors.black, fontSize: AppSizeSp.s20)),
                ],
              ),
            ),
            onTap: () async {
              context.push(RoutesPaths.adminTouristProgramsScreen,);
            },
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s22, vertical: AppSizeH.s20),
              child: Row(
                children: [
                  Icon(Icons.bus_alert_sharp, color: Colors.blue, size: AppSizeH.s25),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("الحافلات",
                      style: TextStyle(
                          color: Colors.black, fontSize: AppSizeSp.s20)),
                ],
              ),
            ),
            onTap: () async {
              context.push(RoutesPaths.adminBussScreen,);
            },
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s22, vertical: AppSizeH.s20),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.blue, size: AppSizeH.s25),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("المرشدين السياحين",
                      style: TextStyle(
                          color: Colors.black, fontSize: AppSizeSp.s20)),
                ],
              ),
            ),
            onTap: () async {
              context.push(RoutesPaths.adminGuidesScreen,);
            },
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizeW.s22, vertical: AppSizeH.s20),
              child: Row(
                children: [
                  Icon(Icons.track_changes_sharp, color: Colors.blue, size: AppSizeH.s25),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("الرحلات",
                      style: TextStyle(
                          color: Colors.black, fontSize: AppSizeSp.s20)),
                ],
              ),
            ),
            onTap: () async {
              context.push(RoutesPaths.adminTripsScreen,);

            },
          ),
        ],
      ),
    );
  }
}
