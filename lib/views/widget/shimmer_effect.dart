import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomShimmerEffect extends StatelessWidget {
  final Widget child;
  const CustomShimmerEffect({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 3), //Default value
      interval:
          const Duration(seconds: 0), //Default value: Duration(seconds: 0)
      color: Colors.white, //Default value
      colorOpacity: 0.7, //Default value
      enabled: true, //Default value
      direction: const ShimmerDirection.fromLTRB(), //Default Value
      child: child,
    );
  }
}
