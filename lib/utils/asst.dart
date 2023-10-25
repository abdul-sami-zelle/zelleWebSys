import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PlatformAwareAssetImage extends StatelessWidget {
  String? asset;
  String? package;
   PlatformAwareAssetImage({
    Key? key,
   required this.asset,
   required this.package,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image.network(
        'assets/${package == null ? '' : 'packages/$package/'}$asset',
      );
    }

    return Image.asset(
      asset!,
      package: package,
    );
  }
}