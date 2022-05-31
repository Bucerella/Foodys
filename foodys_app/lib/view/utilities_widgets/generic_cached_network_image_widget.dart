import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodys_app/utilities/utilities.dart';

///
/// This widget for generic cached network image.
///
Widget genericCachedNetworkImageNetwork(
  String imageUrl,
  BuildContext buildContext, {
  double? imageWidth,
  double? imageHeight,
}) {
  double scaleFactor =
      ScreenUtilities.getScreenWidth(buildContext) / ScreenUtilities.pWidth;
  return CachedNetworkImage(
    placeholder: (context, url) => Image.asset(
      Constants.editedGif,
    ),
    imageUrl: imageUrl,
    width: imageWidth! * scaleFactor,
    height: imageHeight! * scaleFactor,
  );
}
