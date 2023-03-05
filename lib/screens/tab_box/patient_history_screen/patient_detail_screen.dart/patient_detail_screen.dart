import 'package:clinic_app/cubits/select_age/select_age_cubit.dart';
import 'package:clinic_app/cubits/select_gender/select_gender_cubit.dart';
import 'package:clinic_app/screens/tab_box/global_widgets/appbar_back_button.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectGenderCubit(),
        ),
        BlocProvider(
          create: (context) => SelectAgeCubit(),
        ),
      ],
      child: const PatientDetailView(),
    );
  }
}

class PatientDetailView extends StatelessWidget {
  const PatientDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme _textStyle = Theme.of(context).textTheme;

    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: [
            appBarBackButton(Platform.isAndroid, context),
            const Spacer(),
            Text('Patient details', style: _textStyle.displayLarge),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                _titles(Icons.person_outline, 'Name', _textStyle),
                const TextField(
                  decoration: InputDecoration(
                    constraints:
                        BoxConstraints(maxHeight: 30.0, minHeight: 30.0),
                    isCollapsed: true,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _titles(Icons.calendar_month, 'Select your age range or type',
                    _textStyle),
                const SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<SelectAgeCubit, int>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        ClinicConstants.ages.length,
                        (index) => GestureDetector(
                          onTap: () => BlocProvider.of<SelectAgeCubit>(context)
                              .tryToSelectAge(index),
                          child: Container(
                            height: 93.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: state == index
                                  ? ClinicColors.C_0F9B7B
                                  : ClinicColors.white,
                            ),
                            child: Center(
                              child: Text(
                                ClinicConstants.ages[index],
                                style: _textStyle.displayMedium!.copyWith(
                                  color: state == index
                                      ? ClinicColors.white
                                      : ClinicColors.C_0F9B7B,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _titles(Icons.local_phone_outlined, 'Phone', _textStyle),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  style: _textStyle.displaySmall!
                      .copyWith(color: ClinicColors.C_787A91, fontSize: 17.0),
                  decoration: InputDecoration(
                    constraints:
                        const BoxConstraints(maxHeight: 30.0, minHeight: 20.0),
                    isCollapsed: true,
                    prefixIcon: Text(
                      '+998',
                      style: _textStyle.displaySmall!.copyWith(
                          color: ClinicColors.C_787A91, fontSize: 17.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _titles(Icons.people, 'Gender', _textStyle),
                const SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<SelectGenderCubit, bool>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        _checkButtons(context, state, _textStyle, true, 'Male'),
                        const SizedBox(
                          width: 40.0,
                        ),
                        _checkButtons(
                            context, !state, _textStyle, false, 'Female')
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Write your problem',
                  style: _textStyle.displaySmall,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const TextField(
                  maxLength: null,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, ClinicRoutes.patientSavedScreen),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            height: 62.0,
            decoration: BoxDecoration(
              color: ClinicColors.C_0F9B7B,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'Continue',
                style: _textStyle.displaySmall!
                    .copyWith(color: ClinicColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _checkButtons(BuildContext context, bool state, TextTheme textStyle,
      bool isMale, String title) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => BlocProvider.of<SelectGenderCubit>(context)
              .tryToSelectGender(isMale),
          child: Icon(
            Icons.check_circle,
            color: state ? ClinicColors.C_0F9B7B : ClinicColors.C_AFAFAF,
          ),
        ),
        Text(
          title,
          style: textStyle.displaySmall!,
        ),
      ],
    );
  }

  Row _titles(IconData icon, String title, TextTheme textStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: ClinicColors.C_787A91,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          title,
          style: textStyle.displaySmall,
        ),
      ],
    );
  }
}
