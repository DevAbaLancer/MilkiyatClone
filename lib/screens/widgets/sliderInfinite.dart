import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderInfinite extends StatelessWidget {
  final List<String> urlList;
  const SliderInfinite({Key? key, required this.urlList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200),
      items: urlList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: CachedNetworkImage(
                imageUrl: i,
                imageBuilder: (context, imageProvider) => Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
