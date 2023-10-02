import 'package:flutter/material.dart';
import 'package:flutter_sample/database/database_provider.dart';
import 'package:flutter_sample/screens/bottomSheet/bottom_sheet_add_tenant.dart';
import 'package:flutter_sample/screens/list_screen.dart';
import 'package:flutter_sample/screens/login.dart';
import 'package:flutter_sample/screens/register.dart';
import 'package:flutter_sample/screens/tenant_data.dart';
import 'package:flutter_sample/screens/tenant_detail.dart';
import 'package:flutter_sample/screens/wrapper.dart';
import 'package:flutter_sample/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils().init();
  runApp(ChangeNotifierProvider(
    create: (_) => DatabaseProvider(),
    child: MaterialApp(
      home: const Wrapper(),
      routes: {
        "/wrapper": (_) => const Wrapper(),
        "/register": (_) => const Register(),
        "/login": (_) => const Login(),
        "/list_screen": (_) => const ListScreen(),
        "/tenant_data": (_) => const TenantData(),
        "/tenant_detail": (_) => TenantDetailList(),
        "/bottom_sheet_add_tenant": (_) => const BottomSheetAddTenant()
      },
    ),
  ));
}
