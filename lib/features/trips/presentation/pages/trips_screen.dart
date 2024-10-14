import 'package:e_tourism/features/trips/presentation/bloc/trips_bloc.dart';
import 'package:e_tourism/features/trips/presentation/widgets/list_trips_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرحلات المتوفرة'),
      ),
      body: BlocListener<TripsBloc, TripsState>(
          listener: (context, state) {
            if (state is TripRegisteredSuccess) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is TripRegisterFailure) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: BlocBuilder<TripsBloc, TripsState>(
            builder: (context, state) {
              if (state is TripsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TripsLoaded) {
                final trips = state.trips;
                if (trips.isEmpty) {
                  return Center(child: Text('No trips available.'));
                } else {
                  return ListTripsWidget(
                    trip: trips,
                    onSubscribe: (tripId) {
                      _showSubscriptionDialog(context, tripId);
                    },
                  );
                }
              } else if (state is TripsError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return Center(child: Text('Unexpected State'));
              }
            },
          ),
        ),
    );
  }

  void _showSubscriptionDialog(BuildContext context, int tripId) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('تأكيد الاشتراك'),
          content: Text('هل أنت متأكد أنك تريد الاشتراك في الرحلة؟'),
          actions: [
            TextButton(
              child: Text('إلغاء'),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: Text('تأكيد'),
              onPressed: () {
                BlocProvider.of<TripsBloc>(context)
                    .add(RegisterForTripEvent(tripId: tripId));
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
