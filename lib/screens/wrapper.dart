import 'package:flutter/material.dart';
import 'package:flutter_sample/database/database.dart';
import 'package:flutter_sample/screens/list_screen.dart';
import 'package:flutter_sample/screens/login.dart';
import 'package:flutter_sample/screens/tenant_data.dart';
import 'package:flutter_sample/utils/constants.dart';
import 'package:flutter_sample/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    PreferenceUtils pref = PreferenceUtils();
    bool isChecked = pref.getBoolean(Constants.isChecked);
    return Provider(
        create: (context) => AppDatabase(),
        child: const TenantData()
        // isChecked ? const ListScreen() : const Login()
    );
  }
}
