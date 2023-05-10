import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: AppTextStyle.latoSmallGrey,
        ),
        Text(
          value,
          style: AppTextStyle.latoSmallBlack,
        ),
      ],
    );
  }
}
