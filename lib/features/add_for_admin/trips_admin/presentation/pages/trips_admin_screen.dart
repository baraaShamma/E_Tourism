import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/util/snackbar_message.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/presentation/bloc/admin_trips_bloc.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/presentation/widgets/trip_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:intl/intl.dart';

class TripsAdminScreen extends StatefulWidget {
  const TripsAdminScreen({super.key});

  @override
  _TripsAdminScreenState createState() => _TripsAdminScreenState();
}

class _TripsAdminScreenState extends State<TripsAdminScreen> {
  bool _showExpiredTrips = false; // Checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('33'.tr())),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('99'.tr()),
            value: _showExpiredTrips,
            onChanged: (bool? value) {
              setState(() {
                _showExpiredTrips = value ?? false;
              });
              BlocProvider.of<AdminTripsBloc>(context).add(LoadTripsEvent());
            },
          ),
          Expanded(
            child: BlocConsumer<AdminTripsBloc, AdminTripsState>(
              listener: (context, state) async {
                if (state is TripImageUploadedState) {
                  return SnackBarMessage().showSuccessSnackBar(
                      message: "98".tr(), context: context);

                }
              },
              builder: (context, state) {
                return BlocBuilder<AdminTripsBloc, AdminTripsState>(
                  builder: (context, state) {
                    if (state is TripLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is TripLoadedState) {
                      final today = DateFormat('yyyy-MM-dd', 'en_US')
                          .format(DateTime.now());
                      final filteredTrips = _showExpiredTrips
                          ? state.trips
                              .where(
                                  (trip) => trip.tripDate.compareTo(today) < 0)
                              .toList()
                          : state.trips;

                      return ListView.builder(
                        itemCount: filteredTrips.length,
                        itemBuilder: (context, index) {
                          return TripCard(trip: filteredTrips[index]);
                        },
                      );
                    } else if (state is TripErrorState) {
                      return Center(child: Text(state.message));
                    } else {
                      return Container();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          context.pushNamed(RoutesNames.adminAddTripsScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
