import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class PhotoScreen extends StatelessWidget {
  final String name;
  final String fileUrl;
  const PhotoScreen({
    Key? key,
    required this.name,
    required this.fileUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Photo: $name')),
        body: Panorama(
            child: Image.network(
          fileUrl,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Text('loading...');
          },
          errorBuilder: (a, b, c) {
            return Container(
              color: Colors.white,
            );
          },
        )));
  }
}
