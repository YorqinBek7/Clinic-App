import 'package:clinic_app/screens/tab_box/home_screen/home_screen.dart';
import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainTab extends StatelessWidget {
  const MainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: IndexedStack(
        children: [
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70.0,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13.0),
            topRight: Radius.circular(13.0),
          ),
          child: BottomNavigationBar(
            selectedFontSize: 14,
            unselectedFontSize: 14,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: ClinicColors.white,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 15.0,
                ),
                activeIcon: _activeIcon(Icon(
                  Icons.home,
                  size: 15.0,
                )),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ClinicIcons.notifBottom,
                  height: 20.0,
                ),
                activeIcon: _activeIcon(SvgPicture.asset(
                  ClinicIcons.notifBottom,
                  height: 20.0,
                )),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ClinicIcons.search,
                  height: 20.0,
                ),
                activeIcon: _activeIcon(SvgPicture.asset(
                  ClinicIcons.search,
                  height: 20.0,
                )),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ClinicIcons.stats,
                  height: 20.0,
                ),
                activeIcon: _activeIcon(SvgPicture.asset(ClinicIcons.stats)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  ClinicIcons.menu,
                  height: 20.0,
                ),
                activeIcon: _activeIcon(SvgPicture.asset(
                  ClinicIcons.menu,
                  height: 20.0,
                )),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _activeIcon(Widget icon) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ClinicColors.C_F0F9F8,
      ),
      child: icon,
    );
  }
}
