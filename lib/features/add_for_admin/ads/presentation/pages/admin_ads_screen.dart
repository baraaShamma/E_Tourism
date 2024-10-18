import 'package:e_tourism/core/constant/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/admin_ads_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminAdsScreen extends StatelessWidget {
  const AdminAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('111'.tr())),
      body: BlocBuilder<AdminAdsBloc, AdminAdsState>(
        builder: (context, state) {
          if (state is AdminAdsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AdminAdsLoaded) {
            return ListView.builder(
              itemCount: state.ads.length,
              itemBuilder: (context, index) {
                final ad = state.ads[index];
                return Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: AppSizeH.s150,
                          child: Image.network(
                            ad.imageUrl,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                          )),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<AdminAdsBloc>().add(DeleteAd(ad.id));
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is AdminAdsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pickedFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (pickedFile != null) {
            context.read<AdminAdsBloc>().add(AddAd(pickedFile.path));
          }
        },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
