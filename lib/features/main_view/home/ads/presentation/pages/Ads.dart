import 'package:e_tourism/core/widgets/button-widget.dart';
import 'package:e_tourism/core/widgets/loading_widget.dart';
import 'package:e_tourism/features/main_view/home/ads/presentation/bloc/ads_bloc.dart';
import 'package:e_tourism/features/main_view/home/ads/presentation/widgets/carousel_slider_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ads extends StatelessWidget {
  const Ads({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<AdsBloc, AdsState>(
        builder: (context, state) {
          if (state is AdsLoading) {
            return const LoadingWidget();
          } else if (state is AdsLoaded) {
            return CarouselSliderWidget(imageUrls: state.ads);

          } else if (state is AdsError) {
            return Center(child: ButtonWidget(
              text: "24".tr(),
              onPressed: (){
                context.read<AdsBloc>().add(FetchAdsEvent());
              },
            ));
          }
          return const Center(child: Text('No Ads'));
        },
      ),
    );
  }
}
