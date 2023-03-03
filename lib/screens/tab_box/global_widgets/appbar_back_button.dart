import 'package:clinic_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarBackButton(bool isAndroid, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: isAndroid
        ? IconButton(
            splashRadius: 20.0,
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: const BorderSide(
                color: ClinicColors.C_EBEBEB,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
            ),
          )
        : CupertinoButton(
            child: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
          ),
  );
}
