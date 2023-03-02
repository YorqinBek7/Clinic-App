import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../blocs/listen_pin_categories/listen_pin_categories_bloc.dart';

class SelectCategories extends SliverPersistentHeaderDelegate {
  final Widget child;

  SelectCategories({required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (overlapsContent) {
      BlocProvider.of<ListenPinCategsBloc>(context)
          .add(ListenPinCategsManager(true));
    }
    return child;
  }

  @override
  double get maxExtent => 55.0;

  @override
  double get minExtent => 55.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
