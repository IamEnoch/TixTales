import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/app_assets.dart';
import 'package:tix_tales/src/Constants/app_colors.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const bottomSheetHeight = 87.0;
    final maxScrollViewHeight = screenHeight - bottomSheetHeight;

    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 20.5, 15, 17.5),
          alignment: Alignment.topLeft,
          color: AppResources.appColors.globalGrey,
          height: bottomSheetHeight,
          child: Row(
            children: [
              Image.asset(
                AppAssets.shoppingBagIcon,
                width: 24,
                height: 24,
                color: AppResources.appColors.globalDark,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
              ),
              Text(
                '€67.000',
                style:
                    AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
                  color: AppResources.appColors.globalDark,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.48,
                  height: MediaQuery.of(context).size.width * 0.39,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: AppResources.buttonStyles.buttonStyle(
                      backgroundColor: AppResources.appColors.globalPrimary,
                    ),
                    child: Text(
                      'Buy ',
                      style: AppResources
                          .appStyles.textStyles.componentsButtonDefault
                          .copyWith(
                        color: AppResources.appColors.typographyGlobalLight,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: AppResources.appColors.typographyGlobalLight,
        body: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxScrollViewHeight),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'LaRosalia',
                    style: AppResources.appStyles.textStyles.headineH5.copyWith(
                      color: AppResources.appColors.globalDark,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'Mon, Apr18 ·21:00 Pm ',
                    style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                      color: AppResources.appColors.typographyDark,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                  Text(
                    'Palau Sant Jordi, Barcelona',
                    style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                      color: AppResources.appColors.typographyDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
