import 'package:apexmsenscalc/models/banner_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class BannerWithIndicator extends StatefulWidget {
  final List<BannerModel> data;

  const BannerWithIndicator({Key? key, required this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BannerWithIndicatorState();
  }
}

class _BannerWithIndicatorState extends State<BannerWithIndicator> {
  int _current = 0;
  late List<Widget> imageSliders;
  @override
  void initState() {
    imageSliders = widget.data
        .map((item) => Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: item.image,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                Shimmer.fromColors(
                          highlightColor: Colors.transparent,
                          baseColor: Colors.transparent,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              child: AspectRatio(
                                aspectRatio: 21 / 9,
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ],
                  )),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 21 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.data.map((url) {
          int index = widget.data.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
