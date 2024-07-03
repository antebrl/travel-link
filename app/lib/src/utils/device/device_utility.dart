import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomDeviceUtils {
  // Methode zum Ausblenden der Tastatur
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // Methode zum Festlegen der Statusleistenfarbe
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  // Methode zum Überprüfen, ob sich das Gerät in der Querformatausrichtung befindet
  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  // Methode zum Überprüfen, ob sich das Gerät in der Hochformatausrichtung befindet
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  // Methode zum Festlegen des Vollbildmodus
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  // Methode zur Rückgabe der Bildschirmhöhe
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // Methode zur Rückgabe der Bildschirmbreite
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Methode zur Rückgabe des Pixeldichte-Verhältnisses des Geräts
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  // Methode zur Rückgabe der Statusleistenhöhe
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  // Methode zur Rückgabe der Höhe der unteren Navigationsleiste
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  // Methode zur Rückgabe der Höhe der App-Leiste
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // Methode zur Rückgabe der Tastaturhöhe
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  // Methode zur Überprüfung, ob die Tastatur sichtbar ist
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  // Methode zur Überprüfung, ob es sich um ein physisches Gerät handelt
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  // Methode zur Auslösung eines Vibrationsfeedbacks
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, HapticFeedback.vibrate);
  }

  // Methode zum Festlegen der bevorzugten Bildschirmausrichtungen
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  // Methode zum Ausblenden der Statusleiste
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // Methode zum Anzeigen der Statusleiste
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  // Methode zur Überprüfung der Internetverbindung
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // Methode zur Überprüfung, ob es sich um ein iOS-Gerät handelt
  static bool isIOS() {
    return Platform.isIOS;
  }

  // Methode zur Überprüfung, ob es sich um ein Android-Gerät handelt
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Methode zum Öffnen einer URL
  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
