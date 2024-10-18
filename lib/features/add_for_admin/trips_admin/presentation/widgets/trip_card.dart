import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/domain/entities/admin_trip.dart';
import 'package:e_tourism/features/add_for_admin/trips_admin/presentation/bloc/admin_trips_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TripCard extends StatefulWidget {
  final Trip trip;

  const TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  _TripCardState createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // Call API to upload image here
      _uploadImage(widget.trip.id, _image!);
    }
  }

  Future<void> _uploadImage(int tripId, File image) async {
    BlocProvider.of<AdminTripsBloc>(context)
        .add(UploadTripImageEvent(image: image, tripId: tripId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "93".tr(),
                style: TextStyle(fontSize: AppSizeSp.s19),
              ),
              Text(
                widget.trip.touristProgram.type,
                style: TextStyle(fontSize: AppSizeSp.s19),
              ),
              Text(
                "92".tr(),
                style: TextStyle(fontSize: AppSizeSp.s19),
              ),
              Text(
                widget.trip.touristProgram.name,
                style: TextStyle(fontSize: AppSizeSp.s19),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "38".tr(),
                style: TextStyle(fontSize: AppSizeSp.s19),
              ),
              Text(
                widget.trip.price,
                style: TextStyle(fontSize: AppSizeSp.s19),
              ),
              Text(
                "40".tr(),
                style: TextStyle(fontSize: AppSizeSp.s19),
              ),
              Text(
                widget.trip.tripDate,
                style: TextStyle(fontSize: AppSizeSp.s19),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    BlocProvider.of<AdminTripsBloc>(context)
                        .add(DeleteTripEvent(id: widget.trip.id));
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: _pickImage, // Open gallery to pick an image
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
