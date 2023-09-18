import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/list_screen.dart';
import 'package:flutter_sample/screens/login.dart';
import 'package:flutter_sample/screens/register.dart';
import 'package:flutter_sample/screens/tenant_detail.dart';
import 'package:flutter_sample/screens/wrapper.dart';
import 'package:flutter_sample/utils/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils().init();
  runApp(MaterialApp(
    home: const Wrapper(),
    routes: {
      "/wrapper": (_) => const Wrapper(),
      "/register": (_) => const Register(),
      "/login": (_) => const Login(),
      "/list_screen": (_) => const ListScreen(),
      "/tenant_detail": (_) => const TenantDetail()
    },
  ));
}
