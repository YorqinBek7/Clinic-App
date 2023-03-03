import 'package:clinic_app/cubits/select_day/select_day_cubit.dart';
import 'package:clinic_app/cubits/select_hour/select_hour_cubit.dart';
import 'package:clinic_app/screens/tab_box/global_widgets/appbar_back_button.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectDayCubit(),
        ),
        BlocProvider(
          create: (context) => SelectHourCubit(),
        ),
      ],
      child: const BookAppointmentView(),
    );
  }
}

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          appBarBackButton(Platform.isAndroid, context),
          Spacer(),
        ],
        title: Text('Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '10 June, Monday',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
            ),
            SizedBox(
              height: 10.0,
            ),
            BlocBuilder<SelectDayCubit, int>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () =>
                          BlocProvider.of<SelectDayCubit>(context).selectDay(0),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: state == 0
                              ? ClinicColors.C_0F9B7B
                              : ClinicColors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: ClinicColors.white,
                              ),
                              child: Icon(
                                Icons.sunny,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Morning',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: state == 0
                                        ? ClinicColors.white
                                        : ClinicColors.C_AFAFAF,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => BlocProvider.of<SelectDayCubit>(context)
                            .selectDay(1),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: state == 1
                                ? ClinicColors.C_0F9B7B
                                : ClinicColors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: ClinicColors.white,
                                ),
                                child: Icon(
                                  Icons.mode_night,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Evening',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: state == 1
                                          ? ClinicColors.white
                                          : ClinicColors.C_AFAFAF,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Wrap(
              children: List.generate(
                10,
                (index) => BlocBuilder<SelectHourCubit, int>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () => BlocProvider.of<SelectHourCubit>(context)
                          .selectHour(index),
                      child: Container(
                        margin: EdgeInsets.only(right: 5.0, top: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: state == index
                              ? ClinicColors.C_0F9B7B
                              : ClinicColors.white,
                        ),
                        width: 80.0,
                        height: 47.0,
                        child: Center(
                          child: Text(
                            '9:00 AM',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: state == index
                                      ? ClinicColors.white
                                      : ClinicColors.C_AFAFAF,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
