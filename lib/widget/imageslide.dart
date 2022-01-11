import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
class SlideImages extends StatefulWidget {
  SlideImages({Key? key}) : super(key: key);

  @override
  _SlideImagesState createState() => _SlideImagesState();
}

class _SlideImagesState extends State<SlideImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left:  0.0,
          top: 0.0,
          right: 0.0,
          bottom: 0.0),
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 2.0,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        shrinkWrap: true,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Carousel(
                boxFit: BoxFit.cover,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1500),
                dotSize: 8,
                dotIncreaseSize: 01.4,
                dotIncreasedColor: Colors.green ,
                dotColor: Colors.white,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                dotHorizontalPadding: 40,

                images: [
                  NetworkImage(
                      'https://th.bing.com/th/id/R.5d9b909ed5da85f5f4d71e49f0644341?rik=I2vXgRTVk%2biBow&pid=ImgRaw&r=0'),
                  NetworkImage(
                      'https://cdn.pixabay.com/photo/2019/04/30/10/31/sea-4168234_960_720.jpg'),
                  NetworkImage(
                      'https://cdn.pixabay.com/photo/2020/03/25/02/31/rolls-4965915_960_720.jpg'),
                  NetworkImage(
                      'https://cdn.pixabay.com/photo/2021/03/28/03/56/viet-phuc-6130178_960_720.jpg'),
                  NetworkImage(
                      'https://cdn.pixabay.com/photo/2021/08/22/08/10/hoi-an-6564496_960_720.jpg'),
                  NetworkImage(
                      'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
