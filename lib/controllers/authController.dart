import 'dart:io';

import 'package:bsklita/services/auth_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/LoginSlide.dart';
import '../models/User.dart';
import 'package:device_info/device_info.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
  late TextEditingController phoneController, nameController, otpController;
  final AuthService _authService = AuthService();
  final storage = const FlutterSecureStorage();
  bool get authenticated => isLoggedIn.value;
  bool get verified => isVerified.value;
  RxBool isLoggedIn = false.obs;
  RxBool isVerified = false.obs;
  RxBool isLoading = false.obs;
  late User _user;
  User get user => _user;
  List<LoginSlide> slides = [];
  RxInt slideIndex = 0.obs;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  late String deviceName, notificationToken;
  late PageController slidesController;

  @override
  void onInit() {
    phoneController = TextEditingController();
    nameController = TextEditingController();
    otpController = TextEditingController();
    slidesController = PageController();
    slides = getSlides();
    getDeviceName();
    getNotificationToken();
    tryToken();
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    otpController.dispose();
    super.onClose();
  }

  void getNotificationToken() {
    FirebaseMessaging.instance
        .getToken()
        .then((value) => notificationToken = value.toString());
  }

  void getDeviceName() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceName = androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName = iosInfo.utsname.machine;
      }
    } catch (e) {
      print(e);
    }
  }

  Future login({required Map formData}) async {
    isLoading(true);
    await _authService.login(formData: formData).then((response) {
      _user = response;
      isLoggedIn(true);
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

  Future tryToken() async {
    String token = await _authService.readToken();
    isLoading(true);
    await _authService.tryToken(token: token).then((response) {
      _user = response;
      isLoggedIn(true);
    }, onError: (error) {
      print(error);
    });
    isLoading(false);
  }

  Future otpVerification({required Map formData}) async {
    isLoading(true);
    await _authService.otpVerification(formData: formData).then((response) {
      isLoggedIn(true);
      isVerified(true);
      return true;
    }, onError: (error) {
      print(error);
      return false;
    });
    isLoading(false);
  }

  String? validatePhone(String phone) {
    if (!GetUtils.isPhoneNumber(phone)) {
      return "signin_screen_phone_validation_error".tr;
    }
    return null;
  }

  String? validateName(String name) {
    if (!GetUtils.isTxt(name)) {
      return "signin_screen_name_validation_error".tr;
    }
    return null;
  }

  String? validateOtp(String otpCode) {
    if (!GetUtils.isTxt(otpCode)) {
      return "signin_screen_otp_validation_error".tr;
    }
    return null;
  }

  void checkSignIn() {
    final isValid = signinFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signinFormKey.currentState!.save();
  }
}
