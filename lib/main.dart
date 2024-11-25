import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/app/dalel_app.dart';
import 'package:first_app/core/database/cach/cach_helper.dart';
import 'package:first_app/core/functions/check_state_user.dart';
import 'package:first_app/core/services/services_locator.dart';
import 'package:first_app/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  setupServicesLocator();
  await getIt<CacheHelper>().init();
  checkStateUser();
  runApp(const Dalel());
}
