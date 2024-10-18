import 'package:e_tourism/features/search/presentation/bloc/search_bloc.dart';
import 'package:e_tourism/features/search/presentation/widgets/list_trips_by_name_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchByNameScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchByNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('52'.tr()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '53'.tr(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchByNameEvent(_searchController.text));
                  },
                ),
              ),
              onFieldSubmitted: (value) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchByNameEvent(_searchController.text));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  return ListTripsByNameWidget(trips: state.trips);
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
