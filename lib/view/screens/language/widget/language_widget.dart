import 'package:flutter/material.dart';

import '../../../../controller/localization_controller.dart';
import '../../../../data/model/response/language_model.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/images.dart';
import '../../../../util/styles.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget(
      {super.key,
      required this.languageModel,
      required this.localizationController,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          localizationController.setLanguage(
              Locale(
                AppConstants.languages[index].languageCode!,
                AppConstants.languages[index].countryCode,
              ),
              index);
          localizationController.setSelectIndex(index);
        },
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
          ),
          tileColor: Theme.of(context).cardColor,
          contentPadding: const EdgeInsetsDirectional.symmetric(
            horizontal: Dimensions.PADDING_SIZE_SMALL,
            vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
          ),
          horizontalTitleGap: Dimensions.PADDING_SIZE_SMALL,
          leading: Image.asset(
            languageModel.imageUrl!.toString(),
            width: 35,
            height: 35,
          ),
          title: Text(
            languageModel.languageName!,
            style: giazaStencilRegular,
          ),
          trailing: localizationController.selectedIndex == index
              ? Image.asset(
                  Images.check,
                  width: 35,
                  height: 35,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
