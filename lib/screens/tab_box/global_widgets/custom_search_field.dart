import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomSearchField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        fillColor: ClinicColors.white,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: ClinicColors.C_AFAFAF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: ClinicColors.C_F2F2F2,
          ),
        ),
        suffixIcon: const Icon(
          Icons.search_sharp,
          color: ClinicColors.C_77789A,
        ),
      ),
    );
  }
}
