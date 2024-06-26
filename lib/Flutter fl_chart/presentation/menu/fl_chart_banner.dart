import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_assets.dart';

class FlChartBanner extends StatelessWidget {
  const FlChartBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;

      final imageSize = maxWidth / 5.14;
      final space = maxWidth / 16.0;
      final textWidth = maxWidth / 2.8;

      return Row(
        children: [
          SizedBox(
            width: imageSize,
          ),
          Image.asset(
            AppAssets.flChartLogoIcon,
            width: imageSize,
            height: imageSize,
          ),
          SizedBox(
            width: space,
          ),
          SvgPicture.asset(
            AppAssets.flChartLogoText,
            width: textWidth,
          ),
        ],
      );
    });
  }
}
