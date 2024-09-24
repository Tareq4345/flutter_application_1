import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/notification_services.dart';

class ImageSlider extends StatefulWidget {
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
   NotificationService notificationService = NotificationService();

  final List<String> imgList = [
    'https://i.pinimg.com/736x/66/b7/f6/66b7f6e5ad85cdfeab3459f2b5480407.jpg',
    'https://i.pinimg.com/736x/66/b7/f6/66b7f6e5ad85cdfeab3459f2b5480407.jpg',
    'https://i.pinimg.com/736x/66/b7/f6/66b7f6e5ad85cdfeab3459f2b5480407.jpg',
  ];
  
  @override
  void initState() {
    super.initState();
    notificationService.init();
    notificationService.showImageNotification(imgList);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Slider')),
      body: CarouselSlider(
        options: CarouselOptions(autoPlay: true),
        items: imgList.map((item) {
          return Container(
            child: Center(
              child: Image.network(item, fit: BoxFit.cover, width: 1000),
            ),
          );
        }).toList(),
      ),
    );
  }
}
