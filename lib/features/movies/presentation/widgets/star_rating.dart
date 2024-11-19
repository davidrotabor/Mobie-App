import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double percentage;
  final int maxStars;
  final double starSize;
  final Color filledColor;
  final Color unfilledColor;

  const StarRating({
    super.key,
    required this.percentage,
    this.maxStars = 5,
    this.starSize = 19,
    this.filledColor = const Color(0xffd3ae09),
    this.unfilledColor = const Color.fromRGBO(211, 174, 9, 0.4),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        double starFill = (percentage / 10 * maxStars) - index;
        starFill = starFill.clamp(0.0, 1.0);
        return Stack(
          children: [
            Icon(
              Icons.star,
              size: starSize,
              color: unfilledColor,
            ),
            ClipRect(
              clipper: _StarClipper(starFill),
              child: Icon(
                Icons.star_rounded,
                size: starSize,
                color: filledColor,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillPercentage;

  _StarClipper(this.fillPercentage);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fillPercentage, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
