import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/custom_shimmer.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return const AspectRatio(
            aspectRatio: 2.6 / 4,
            child: CustomShimmer(radius: 10),
          );
        },
        errorWidget: (context, url, error) {
          return const Icon(
            FontAwesomeIcons.circleExclamation,
            size: 50,
          );
        },
      ),
    );
  }
}
