import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class ButtonStyles {
  ButtonStyle buttonStyle({
    required Color backgroundColor,
  }) {
    return OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      backgroundColor: backgroundColor,
      textStyle: AppResources.appStyles.textStyles.componentsButtonDefault,
    );
  }
}
