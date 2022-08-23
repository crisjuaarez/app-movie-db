import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage(
    this.url, {
    Key? key,
    required this.height,
    this.width = double.infinity,
  }) : super(key: key);

  final String url;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
    // return Image.network(
    //   url,
    //   height: height,
    //   width: width,
    //   fit: BoxFit.cover,
    //   loadingBuilder: (_, child, progress) => AnimatedSwitcher(
    //     duration: const Duration(milliseconds: 350),
    //     child: progress?.cumulativeBytesLoaded == progress?.expectedTotalBytes
    //         ? child
    //         : Container(
    //             width: width,
    //             height: height,
    //             color: Colors.transparent,
    //             child: const Center(
    //               child: CircularProgressIndicator.adaptive(),
    //             ),
    //           ),
    //   ),
    // );
  }
}
