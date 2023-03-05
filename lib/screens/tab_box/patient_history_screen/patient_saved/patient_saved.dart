import 'package:clinic_app/utils/colors.dart';
import 'package:clinic_app/utils/constants.dart';
import 'package:flutter/material.dart';

class PatientSaved extends StatefulWidget {
  const PatientSaved({super.key});

  @override
  State<PatientSaved> createState() => _PatientSavedState();
}

class _PatientSavedState extends State<PatientSaved> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async => await Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(
            context, ClinicRoutes.mainTab, (route) => false),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 97.5,
              color: ClinicColors.C_0F9B7B,
            ),
            Text(
              'Request send!',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: ClinicColors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
