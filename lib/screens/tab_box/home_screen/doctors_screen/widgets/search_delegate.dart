import 'package:flutter/material.dart';
import '../../../global_widgets/custom_search_field.dart';

class SearchFields extends SliverPersistentHeaderDelegate {
  final TextEditingController controller;
  SearchFields({required this.controller});

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: CustomSearchField(
          hintText: 'Search doctor by name',
          controller: controller,
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
