import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/features/main_view/my_trips/domain/entities/my_trip.dart';
import 'package:e_tourism/features/main_view/my_trips/presentation/bloc/my_trips_bloc.dart';
import 'package:e_tourism/link_api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            instance<MyTripsBloc>()..add(LoadRegisteredTripsEvent()),
        child: BlocBuilder<MyTripsBloc, MyTripsState>(
          builder: (context, state) {
            if (state is TripsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TripsLoaded) {
              return ListView.builder(
                itemCount: state.trips.length,
                itemBuilder: (context, index) {
                  final trip = state.trips[index];
                  return TripCard(trip: trip);
                },
              );
            } else if (state is TripsError) {
              return Center(child: Text('${state.message}'));
            } else {
              return Center(child: Text('No trips available'));
            }
          },
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final MyTrip trip;

  const TripCard({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 200),
            items: trip.images.map((imageUrl) {
              return Image.network(AppLink.baseUrlImage + imageUrl);
            }).toList(),
          ),
          ListTile(
            title: Text("63".tr()+trip.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${"64".tr()} ${trip.description}"),
                Text("${"60".tr()} ${trip.guide.fName} ${trip.guide.lName}"),
                Text("${"61".tr()} ${trip.busType}"),
                Text("${"62".tr()} ${trip.tripDate}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
