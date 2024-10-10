import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_tourism/features/main_view/home/ads/domain/entities/ad_entity.dart';
import 'package:flutter/material.dart';
class CarouselSliderWidget extends StatelessWidget {
  final List<AdEntity> imageUrls;

  const CarouselSliderWidget({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              imageUrls[itemIndex].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
      options: CarouselOptions(
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
      ),
    );
  }
}