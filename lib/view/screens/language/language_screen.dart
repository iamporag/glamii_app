import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/localization_controller.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../../base/custom_app_bar.dart';
import 'widget/language_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Appbar start
      appBar: CustomAppBar(title: "language_key".tr, isBackButtonExist: true),

      //  Body start
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        child: GetBuilder<LocalizationController>(
          builder: (localizationController) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  Text(
                    'select_language_key'.tr,
                    style: giazaStencilMedium,
                  ),
                  const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                  //  Show all language item
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: localizationController.languages.length,
                    itemBuilder: (context, index) => LanguageWidget(
                      languageModel: localizationController.languages[index],
                      localizationController: localizationController,
                      index: index,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
