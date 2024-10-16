import 'package:e_tourism/features/search/presentation/bloc/search_bloc.dart';
import 'package:e_tourism/features/search/presentation/widgets/list_trips_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchByDatesScreen extends StatefulWidget {
  const SearchByDatesScreen({super.key});

  @override
  _SearchByDatesScreenState createState() => _SearchByDatesScreenState();
}

class _SearchByDatesScreenState extends State<SearchByDatesScreen> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('43'.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDatePicker(
              context: context,
              selectedDate: _startDate,
              label: '44'.tr(),
              onDateSelected: (date) => setState(() => _startDate = date),
            ),
            _buildDatePicker(
              context: context,
              selectedDate: _endDate,
              label: '45'.tr(),
              onDateSelected: (date) => setState(() => _endDate = date),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchTrips,
              child: Text('46'.tr()),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocListener<SearchBloc, SearchState>(
                listener: (context, state) {
                  if (state is TripRegisteredSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  } else if (state is TripRegisterFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchLoadedByDate) {
                      final trips = state.trips;
                      return trips.isEmpty
                          ? const Center(child: Text('No trips available.'))
                          : ListTripsWidget(
                              trip: trips,
                              onSubscribe: (tripId) {
                                _showSubscriptionDialog(context, tripId);
                              },
                            );
                    } else if (state is SearchError) {
                      return Center(child: Text('حدث خطأ: ${state.message}'));
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _searchTrips() {
    if (_startDate != null && _endDate != null) {
      String startDate = _startDate!.toIso8601String().split('T')[0];
      String endDate = _endDate!.toIso8601String().split('T')[0];

      BlocProvider.of<SearchBloc>(context).add(
        SearchByDatesEvent(
          startDate,
          endDate,
        ),
      );
    }
  }

  void _showSubscriptionDialog(BuildContext context, int tripId) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('47'.tr()),
          content: Text('48'.tr()),
          actions: [
            TextButton(
              child: Text('49'.tr()),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: Text('50'.tr()),
              onPressed: () {
                BlocProvider.of<SearchBloc>(context)
                    .add(RegisterForTripEvent(tripId: tripId));
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDatePicker({
    required BuildContext context,
    required DateTime? selectedDate,
    required String label,
    required Function(DateTime) onDateSelected,
  }) {
    return ListTile(
      title: Text(
        selectedDate == null
            ? label
            : '51'.tr() + '${selectedDate.toLocal()}'.split(' ')[0],
      ),
      trailing: const Icon(Icons.calendar_today),
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
        );
        if (date != null) onDateSelected(date);
      },
    );
  }
}
