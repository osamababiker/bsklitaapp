import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF57b984);  
const kPrimaryLightColor = Color.fromARGB(255, 235, 248, 242);
const kSecondaryColor = Color(0xFFFEB92E);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const kTextColor = Colors.black;
const kFontFamily = 'Tajawal';

const kDefaultPadding = 20.0;



// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
String kEmailNullError = "";
String kInvalidEmailError = "";
String kPassNullError = "";
String kShortPassError = "";
String kMatchPassError = "";
String kNamelNullError = "";
String kPhoneNumberNullError = "";
String kAddressNullError = "";
 
