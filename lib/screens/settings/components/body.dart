import 'package:bsklita/constants.dart';
import 'package:bsklita/controllers/settingsController.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';


String? _selectedLang ;
  final List<String> _langList = [
    "ar", "en"
  ];

  final SettingsController _settingsController = Get.find<SettingsController>();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "settings_screen_app_name_lable".tr,
            style: const TextStyle(
                color: kTextColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 1.0),
          const Text(
            "Bskliat",
            style: TextStyle(color: kTextColor, fontSize: 14),
          ),
          const VerticalSpacing(of: 2.0),
          Text(
            "settings_screen_app_version_lable".tr,
            style: const TextStyle(
                color: kTextColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 1.0),
          const Text(
            "1.0",
            style: TextStyle(color: kTextColor, fontSize: 14),
          ),
          const VerticalSpacing(of: 2.0),
          Text(
            "settings_screen_app_email_lable".tr,
            style: const TextStyle(
                color: kTextColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 1.0),
          const Text(
            "bsklita@gmail.com",
            style: TextStyle(color: kTextColor, fontSize: 14),
          ),
          const VerticalSpacing(of: 2.0),   
          SizedBox(
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: [
                    const Icon(
                      Icons.list,
                      size: 16,
                      color: kTextColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      child: Text(
                        "settings_screen_change_langauge".tr,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: _langList
                    .map((_lang) => DropdownMenuItem<String>(
                          value: _lang,
                          child: Text(
                            _lang == 'ar' ? 'arabic'.tr : 'english'.tr,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: _selectedLang,
                onChanged: (value) {
                  _settingsController.changeLanguage = value.toString();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: kTextColor,
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                buttonWidth: 200,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  color: Colors.white,
                ),
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                  color: Colors.white,
                ),
                scrollbarRadius: const Radius.circular(kDefaultPadding / 2),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
              ),
            ),
          ),
          const VerticalSpacing(of: 2.0),
          Text(
            "settings_screen_work_with_us_lable".tr,
            style: const TextStyle(
                color: kTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const VerticalSpacing(of: 1.0),
          DefaultButton(
            text: "settings_screen_work_with_us_btn".tr, press: () {}
          ),
        ],
      ),
    );
  }
}
