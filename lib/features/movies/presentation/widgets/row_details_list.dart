import 'package:flutter/material.dart';
import 'package:prueba_tecnica/config/constants/themes/data/CustomColors.dart';

class RowDetailsList extends StatelessWidget {
  final String title;
  final List<String> items;

  const RowDetailsList({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            margin: const EdgeInsets.only(right: 10),
            child: Text(
              title,
              style: TextStyle(
                  color: customColors!.textTitleColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Text(
              items.join(', '),
              maxLines: null,
              style: const TextStyle(
                  color: Color(0xff869199),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0),
            ),
          ),
        ],
      ),
    );
  }
}
