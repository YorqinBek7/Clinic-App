import 'package:clinic_app/screens/tab_box/global_widgets/appbar_back_button.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:clinic_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io' show Platform;

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final TextTheme _textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          appBarBackButton(Platform.isAndroid, context),
          Spacer(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _doctorTitleView(context, _textStyle),
            SizedBox(
              height: 15.0,
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .74,
                  decoration: BoxDecoration(
                    color: ClinicColors.C_0F9B7B,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(41.0),
                      topRight: Radius.circular(41.0),
                    ),
                  ),
                ),

                // ABOUT DOCTOR VIEW,
                Positioned(
                  top: 114.0,
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    padding: EdgeInsets.only(top: 25.0),
                    decoration: BoxDecoration(
                      color: ClinicColors.scaffoldColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(41.0),
                        topRight: Radius.circular(41.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _customMediumText(_textStyle, 'About doctor'),
                          SizedBox(
                            height: 10.0,
                          ),
                          _customSmallText(
                            _textStyle,
                            'Dr.Mahmud Nik is the top most Cardiologistspecialist in Dhaka Medical Collage Hospitalal Dhaka. He achived several awards for hiswonderful contirbution his own field. He isavalibe for private consultation.',
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          _customMediumText(_textStyle, 'Working time'),
                          SizedBox(
                            height: 5.0,
                          ),
                          _customSmallText(
                              _textStyle, 'Mon - Fri 09.00 AM - 08:00 PM'),
                          Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: TextButton(
                              onPressed: () => {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'June',
                                    style: _textStyle.displayMedium!.copyWith(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // DAYS OF MONTH,
                          SizedBox(
                            height: 90.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () =>
                                    setState(() => _currentIndex = index),
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: index == 0 ? 20.0 : 10.0,
                                    right: index == 6 ? 20.0 : 0.0,
                                  ),
                                  height: 90.0,
                                  width: 66.0,
                                  decoration: BoxDecoration(
                                    color: _currentIndex == index
                                        ? ClinicColors.C_0F9B7B
                                        : ClinicColors.white,
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Monday',
                                        style:
                                            _textStyle.displayMedium!.copyWith(
                                          color: _currentIndex == index
                                              ? ClinicColors.white
                                              : ClinicColors.C_AFAFAF,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                      Text(
                                        '10',
                                        style:
                                            _textStyle.displayMedium!.copyWith(
                                          color: _currentIndex == index
                                              ? ClinicColors.white
                                              : ClinicColors.C_AFAFAF,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          /// BOTTOM BUTTONS
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2.5),
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: ClinicColors.C_DEECEC,
                                  ),
                                  height: 64.0,
                                  child: Icon(
                                    Icons.favorite,
                                    color: ClinicColors.C_0F9B7B,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(context,
                                        ClinicRoutes.bookAppoinmentScreen),
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.5),
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: ClinicColors.C_0F9B7B,
                                      ),
                                      height: 64.0,
                                      child: Center(
                                        child: Text(
                                          'Book Appointment',
                                          style: _textStyle.displayMedium!
                                              .copyWith(
                                            color: ClinicColors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 34.0,
                  left: 25.0,
                  right: 25.0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        _doctorAchievments(context, ClinicIcons.people,
                            _textStyle, '1000+', 'Patient'),
                        Spacer(),
                        _doctorAchievments(context, ClinicIcons.medal,
                            _textStyle, '5 years', 'Experience'),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding _customMediumText(TextTheme _textStyle, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(
        text,
        style: _textStyle.displayMedium!.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Padding _customSmallText(TextTheme _textStyle, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Text(
        text,
        style: _textStyle.displayMedium!.copyWith(
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
        ),
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Row _doctorAchievments(
    BuildContext context,
    String icon,
    TextTheme textStyle,
    String title,
    String subtitle,
  ) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ClinicColors.C_1FB091,
          ),
          child: SvgPicture.asset(icon),
        ),
        SizedBox(
          width: 18.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textStyle.displaySmall!.copyWith(
                color: ClinicColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
            Text(
              subtitle,
              style: textStyle.displaySmall!.copyWith(
                color: ClinicColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding _doctorTitleView(BuildContext context, TextTheme textStyle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 100.0,
        child: Row(
          children: [
            Container(
              height: 98.0,
              width: 94.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: ClinicColors.C_AFAFAF,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'Dr. Mahmud Nik',
                      style: textStyle.displayMedium!.copyWith(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 2,
                    child: Text(
                      'Cardiologist - Dhaka Medical Collage Hospital',
                      style: textStyle.displayMedium!.copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
