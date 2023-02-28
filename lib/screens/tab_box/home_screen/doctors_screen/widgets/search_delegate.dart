import 'package:clinic_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchFields extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: TextField(
          decoration: InputDecoration(
            fillColor: ClinicColors.white,
            filled: true,
            hintText: 'Search doctor by name',
            hintStyle: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: ClinicColors.C_AFAFAF),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: ClinicColors.C_F2F2F2,
              ),
            ),
            suffixIcon: const Icon(
              Icons.search_sharp,
              color: ClinicColors.C_77789A,
            ),
          ),
        ),
      );

  @override
  double get maxExtent => 53.0;

  @override
  double get minExtent => 53.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
