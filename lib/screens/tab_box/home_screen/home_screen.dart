import 'package:clinic_app/screens/tab_box/global_widgets/custom_search_field.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:clinic_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _searchTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme _textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 44.0,
            height: 44.0,
            margin: EdgeInsets.only(left: 20.0, top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: ClinicColors.C_AFAFAF,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mahmudul',
                style: _textStyle.displaySmall,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Find your suitable doctor here',
                style: _textStyle.displaySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ClinicIcons.notif,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomSearchField(
                hintText: 'Search doctor, categories, top a...',
                controller: _searchTextField,
              ),
            ),
            SizedBox(
              height: 26.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Specialist',
                  style: _textStyle.displaySmall!.copyWith(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            _doctorCategoriesView(_textStyle),
            SizedBox(
              height: 20.0,
            ),
            _suggestionView(_textStyle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top doctors',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 21.0),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(
                        context, ClinicRoutes.doctorsScreen),
                    child: Text('View all'),
                  ),
                ],
              ),
            ),
            _doctorsView(_textStyle),
            SizedBox(
              height: 5.0,
            )
          ],
        ),
      ),
    );
  }

  SizedBox _doctorsView(TextTheme _textStyle) {
    return SizedBox(
      height: 193.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 135.0,
          margin: EdgeInsets.only(
            left: index == 0 ? 20.0 : 14.0,
            right: index == 10 - 1 ? 20.0 : 0.0,
          ),
          decoration: BoxDecoration(
            color: ClinicColors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 130.0,
                width: 116.0,
                decoration: BoxDecoration(
                  color: ClinicColors.C_AFAFAF,
                  borderRadius: BorderRadius.circular(22.0),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Flexible(
                child: Text(
                  'Dr. Mahmud N',
                  style: _textStyle.displayMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  ),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Flexible(
                child: Text(
                  'Heart Serigon',
                  style: _textStyle.displaySmall!.copyWith(fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _suggestionView(TextTheme _textStyle) {
    return SizedBox(
      height: 123.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: ClinicColors.white),
              margin: EdgeInsets.only(
                left: index == 0 ? 20.0 : 14.0,
                right: index == 10 - 1 ? 20.0 : 0.0,
              ),
              height: 123.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'Cardio Issues?',
                      style: Theme.of(context).textTheme.displayMedium,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 250.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 51.5,
                          width: 2.0,
                          color: ClinicColors.C_0F9B7B,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          child: Text(
                            "For cardio patent here can easliy contact with doctor. Can chat &live chat.",
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: index == 10 - 1 ? 20.0 : 0.0,
              child: Container(
                height: 24.0,
                width: 47.0,
                decoration: BoxDecoration(
                  color: ClinicColors.C_0F9B7B,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    '100\$',
                    style: _textStyle.displaySmall!.copyWith(
                      color: ClinicColors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _doctorCategoriesView(TextTheme _textStyle) {
    return SizedBox(
      height: 141.0,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 141.0,
          margin: EdgeInsets.only(
            left: index == 0 ? 20.0 : 14.0,
            right: index == 5 - 1 ? 20.0 : 0.0,
          ),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ClinicColors.C_AFAFAF,
          ),
          width: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  'Cardio Specialist',
                  style: _textStyle.displaySmall!.copyWith(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: ClinicColors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              Flexible(
                child: Text(
                  '27 Doctors',
                  style: _textStyle.displaySmall!.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: ClinicColors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
