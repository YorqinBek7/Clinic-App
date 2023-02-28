import 'package:clinic_app/blocs/listen_pin_categories/listen_pin_categories_bloc.dart';
import 'package:clinic_app/screens/tab_box/global_widgets/appbar_back_button.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;
import 'widgets/search_delegate.dart';
import 'widgets/select_categ_delegate.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListenPinCategsBloc(),
      child: const DoctorsScreenView(),
    );
  }
}

class DoctorsScreenView extends StatefulWidget {
  const DoctorsScreenView({super.key});

  @override
  State<DoctorsScreenView> createState() => _DoctorsScreenViewState();
}

class _DoctorsScreenViewState extends State<DoctorsScreenView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: appBarBackButton(Platform.isAndroid, context),
              ),
              const Spacer(),
              Text(
                'Doctors',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 18.0),
          ),
          SliverPersistentHeader(
            delegate: SearchFields(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 18.0),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SelectCategories(
              child: BlocBuilder<ListenPinCategsBloc, ListenPinCategsState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                      color:
                          BlocProvider.of<ListenPinCategsBloc>(context).isPinned
                              ? ClinicColors.scaffoldColor
                              : null,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => setState(() => currentIndex = index),
                        child: Container(
                          height: 52.0,
                          padding: EdgeInsets.symmetric(horizontal: 22.0),
                          margin: EdgeInsets.only(
                            left: index == 0 ? 25.0 : 10.0,
                            right: index == 10 - 1 ? 25.0 : 0.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: currentIndex == index
                                ? ClinicColors.C_0F9B7B
                                : ClinicColors.white,
                          ),
                          child: const Center(
                            child: Text('Cardic'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 18.0),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  height: 110.0,
                  decoration: BoxDecoration(
                    color: ClinicColors.white,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: ClinicColors.C_AFAFAF,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dr. Mahmud Nik Hasan',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '100k views',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Cardialcast - Dhara Medical College Hospital',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
