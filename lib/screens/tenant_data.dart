import 'package:flutter/material.dart';
import 'package:flutter_sample/database/database.dart';
import 'package:flutter_sample/screens/tenant_detail.dart';
import 'package:provider/provider.dart';

class TenantData extends StatefulWidget {
  const TenantData({super.key});

  @override
  State<TenantData> createState() => _TenantDataState();
}

class _TenantDataState extends State<TenantData> {
  late AppDatabase database;
  late List<TenantDetails> tenantDetails;

  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final houseNumber = args['house_number'];
    database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text('$houseNumber'),
      ),
    );
  }
}
