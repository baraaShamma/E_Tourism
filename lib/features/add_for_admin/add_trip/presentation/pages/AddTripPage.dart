import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_tourism/Config/injection_container.dart';
import 'package:e_tourism/Config/navigation/app_route.dart';
import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:e_tourism/core/util/snackbar_message.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/domain/entities/admin_trip_entities.dart';
import 'package:e_tourism/features/add_for_admin/add_trip/presentation/bloc/admin_add_trip_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTripPage extends StatefulWidget {
  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tripDateController = TextEditingController();

  int? _selectedTouristProgramId;
  int? _selectedBusId;
  int? _selectedGuideId;
  String? _price;
  String? _maxCapacity;

  List<double> _getCustomItemsHeights(List items) {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(90);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(90);
      }
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('100'.tr()),
      ),
      body: BlocListener<AdminAddTripBloc, AdminAddTripState>(
        listener: (context, state) {
          if (state is AdminAddTripAdded) {
            context.pop();
            context.pushReplacementNamed(
              RoutesNames.adminTripsScreen,
            );
            return SnackBarMessage()
                .showSuccessSnackBar(message: "101".tr(), context: context);
          }
        },
        child: BlocBuilder<AdminAddTripBloc, AdminAddTripState>(
          builder: (context, state) {
            if (state is AdminAddTripLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AdminAddDataLoaded) {
              // Use the loaded programs
              return Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    SizedBox(
                      height: AppSizeH.s100,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2<int>(
                          hint: Text(
                            "102".tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          buttonStyleData: ButtonStyleData(
                            height: AppSizeH.s90,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            padding: EdgeInsets.only(left: 14, right: 14),
                            customHeights:
                                _getCustomItemsHeights(state.programs),
                          ),
                          items: state.programs
                              .map((program) => DropdownMenuItem<int>(
                                  value: program.id,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${"92".tr()} ",
                                            style: TextStyle(
                                                fontSize: AppSizeSp.s18),
                                          ),
                                          Text(
                                            program.name,
                                            style: TextStyle(
                                                fontSize: AppSizeSp.s18),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${"93".tr()} ",
                                            style: TextStyle(
                                                fontSize: AppSizeSp.s18),
                                          ),
                                          Text(
                                            program.type,
                                            style: TextStyle(
                                                fontSize: AppSizeSp.s18),
                                          ),
                                        ],
                                      ),
                                      const Divider(height: 2),
                                    ],
                                  )))
                              .toList(),
                          onChanged: (value) => setState(() {
                            _selectedTouristProgramId = value;
                          }),
                          validator: (value) =>
                              value == null ? '103'.tr() : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizeH.s100,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2<int>(
                        
                          buttonStyleData: ButtonStyleData(
                            height: AppSizeH.s90,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            padding: EdgeInsets.only(left: 14, right: 14),
                            customHeights:
                            _getCustomItemsHeights(state.programs),
                          ),
                          hint: Text(
                            "104".tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          items: state.buses
                              .map((bus) => DropdownMenuItem(
                              value: bus.id,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "80".tr(),
                                        style: TextStyle(
                                            fontSize: AppSizeSp.s18),
                                      ),
                                      Text(
                                        bus.busType,
                                        style: TextStyle(
                                            fontSize: AppSizeSp.s18),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "81".tr(),
                                        style: TextStyle(
                                            fontSize: AppSizeSp.s18),
                                      ),
                                      Text(
                                        bus.seatCount.toString(),
                                        style: TextStyle(
                                            fontSize: AppSizeSp.s18),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    height: 2,
                                  ),
                                ],
                              )))
                              .toList(),
                          onChanged: (value) => setState(() {
                            _selectedBusId = value;
                          }),
                          validator: (value) => value == null ? '105'.tr() : null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizeH.s100,
                      child:  DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2<int>(
                          buttonStyleData: ButtonStyleData(
                            height: AppSizeH.s90,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            padding: EdgeInsets.only(left: 14, right: 14),
                            customHeights:
                            _getCustomItemsHeights(state.programs),
                          ),
                          hint: Text(
                            "106".tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          items: state.guides
                              .map((guide) => DropdownMenuItem(
                            value: guide.id,
                            child: Text(
                              "${guide.firstName} ${guide.lastName}",
                              style: TextStyle(fontSize: AppSizeSp.s18),
                            ),
                          ))
                              .toList(),
                          onChanged: (value) => setState(() {
                            _selectedGuideId = value;
                          }),
                          validator: (value) => value == null ? '107'.tr() : null,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: '38'.tr()),
                      onSaved: (value) => _price = value,
                      validator: (value) => value!.isEmpty ? '108'.tr() : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: '39'.tr()),
                      onSaved: (value) => _maxCapacity = value,
                      validator: (value) => value!.isEmpty ? '109'.tr() : null,
                    ),
                    TextFormField(
                      controller: tripDateController,
                      decoration: InputDecoration(labelText: '40'.tr()),
                      readOnly: true,
                      validator: (value) => value!.isEmpty ? '110'.tr() : null,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            tripDateController.text =
                                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          BlocProvider.of<AdminAddTripBloc>(context).add(
                            AddTrip(
                              tripEntity: AdminTripEntity(
                                  tripDate: tripDateController.text,
                                  busId: _selectedBusId!,
                                  guideId: _selectedGuideId!,
                                  maxCapacity: int.parse(_maxCapacity!),
                                  price: int.parse(_price!),
                                  programId: _selectedTouristProgramId!),
                              // tripDate: _tripDate!,
                            ),
                          );
                        }
                      },
                      child: Text('100'.tr()),
                    ),
                  ],
                ),
              );
            } else if (state is AdminAddTripError) {
              return Center(child: Text(state.message));
            }

            return Container(); // Or handle other states
          },
        ),
      ),
    );
  }
}
