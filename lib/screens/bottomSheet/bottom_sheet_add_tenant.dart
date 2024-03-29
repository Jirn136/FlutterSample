import 'package:flutter/material.dart';
import 'package:flutter_sample/custom_widgets/custom_date_picker.dart';
import 'package:flutter_sample/database/database.dart';
import 'package:flutter_sample/database/database_provider.dart';
import 'package:flutter_sample/models/tenant_info.dart';
import 'package:flutter_sample/utils/custom_items.dart';
import 'package:provider/provider.dart';

import '../../utils/common_widgets.dart';

class BottomSheetAddTenant extends StatefulWidget {
  const BottomSheetAddTenant({super.key});

  @override
  State<BottomSheetAddTenant> createState() => _BottomSheetAddTenantState();
}

class _BottomSheetAddTenantState extends State<BottomSheetAddTenant> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  int _dateTimeStamp = 0;
  final TextEditingController _tenantNameController = TextEditingController();
  String _tenantName = '';
  final TextEditingController _houseNumberController = TextEditingController();
  int _houseNumber = 0;

  late AppDatabase database;

  @override
  Widget build(BuildContext context) {
    final databaseProvider = Provider.of<DatabaseProvider>(context);
    database = databaseProvider.database;
    return SizedBox(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              closeBottomSheet(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.green,
                              size: 25,
                            )),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            if (saveFormState(_formKey)) {
                              _validateAndEnterDB(context);
                            }
                            closeBottomSheet(context);
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            decoration: customInputDecoration('House Number'),
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            controller: _houseNumberController,
                            onChanged: (_) {
                              saveFormState(_formKey);
                            },
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              }
                              return 'House number needed';
                            },
                            onSaved: (value) {
                              _houseNumber = int.parse(value!);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: CustomDatePicker(
                            onDateChanged: (date) {
                              if (date != null) {
                                _dateTimeStamp = date;
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: TextFormField(
                    decoration: customInputDecoration('Tenant Name'),
                    textInputAction: TextInputAction.done,
                    onChanged: (_) {
                      saveFormState(_formKey);
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      }
                      return 'Name needed';
                    },
                    onSaved: (value) {
                      _tenantName = value!;
                    },
                    controller: _tenantNameController,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _validateAndEnterDB(BuildContext context) async {
    await database.addTenantInfo(TenantInfoDetails(
        tenantName: _tenantName,
        houseNumber: _houseNumber,
        timeStamp: _dateTimeStamp));
    customToast('Tenant Added');
  }
}
