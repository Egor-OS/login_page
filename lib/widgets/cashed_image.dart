import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.contain,
    super.key,
  });
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const CircularProgressIndicator(),
      // errorWidget: (context, url, error) => const Icon(Icons.error),
      errorWidget: (context, url, error) => _buildErrorWidget(context, error),
    );
  }

  Widget _buildErrorWidget(BuildContext context, dynamic err) {
    return IconButton(
      onPressed: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => Text(err.toString()),
          onPop: () => print(err.toString()),
          direction: PopoverDirection.bottom,
          backgroundColor: Colors.grey.withOpacity(0.5),
          // width: 200,
          // height: 400,
          // arrowHeight: 15,
          // arrowWidth: 30,
        );
      },
      icon: const Icon(Icons.error),
    );
  }
}
