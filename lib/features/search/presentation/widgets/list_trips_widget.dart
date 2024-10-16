import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_tourism/core/widgets/button-widget.dart';
import 'package:e_tourism/features/search/domain/entities/search_trip_by_date_entity.dart';
import 'package:e_tourism/features/trips/presentation/bloc/trips_bloc.dart';
import 'package:e_tourism/link_api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListTripsWidget extends StatelessWidget {
  final List<SearchTripByDateEntity> trip;
  final Function(int tripId) onSubscribe;

  const ListTripsWidget({
    super.key,
    required this.trip,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          itemCount: trip.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                trip[i].images.isNotEmpty
                    ? _buildImageSlider(trip[i].images)
                    : Text("34".tr()),
                const SizedBox(height: 16),
                Text("35".tr() + trip[i].busType,
                    style: TextStyle(fontSize: 16)),
                Text(
                    "${"36".tr()}${trip[i].guide.fName} ${trip[i].guide.lName}",
                    style: TextStyle(fontSize: 16)),
                Text("37".tr() + trip[i].guide.mobile,
                    style: TextStyle(fontSize: 16)),
                Text("38".tr() + trip[i].price, style: TextStyle(fontSize: 16)),
                Text("39".tr() + trip[i].maxCapacity.toString(),
                    style: TextStyle(fontSize: 16)),
                Text("40".tr()+trip[i].tripDate,
                    style: TextStyle(fontSize: 16)),
                ButtonWidget(
                    text: "41".tr(),
                    onPressed: () {
                      final tripId = trip[i].id;
                      DateTime today = DateTime.now();
                      DateTime todayDate =
                          DateTime(today.year, today.month, today.day);
                      String tripDateString = trip[i].tripDate;
                      DateTime tripDate = DateTime.parse(tripDateString);
                      if (tripDate.isAfter(todayDate)) {
                        onSubscribe(tripId);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar( SnackBar(
                          content: Text(
                            "42".tr(),
                            style:const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.redAccent,
                        ));
                      }
                    }),
                const Divider(
                  height: 10,
                )
              ],
            );
          }),
    );
  }

  Widget _buildImageSlider(List<String> images) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: images.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Image.network(
                AppLink.baseUrlImage + imageUrl,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

}
