import 'package:e_tourism/features/search/domain/entities/search_trip_entity.dart';
import 'package:e_tourism/link_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListTripsByNameWidget extends StatelessWidget {
  final List<SearchTripEntity> trips;

  const ListTripsByNameWidget({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        return Column(
          children: [
            ListTile(
              title: Text(trip.touristProgram.name),
              subtitle: Text(trip.price),
              leading: trip.touristProgram.image != null
                  ? Image.network(
                      AppLink.baseUrlImage + trip.touristProgram.image!)
                  : Container(width: 50, height: 50, color: Colors.grey),
              onTap: () {
                context.push(
                    '/touristProgramsDetailScreen/${trip.touristProgramId}');
              },
            ),
            const SizedBox(height: 5),
            const Divider(height: 4),
          ],
        );
      },
    );
  }
}
