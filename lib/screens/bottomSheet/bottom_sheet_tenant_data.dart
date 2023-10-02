import 'package:flutter/material.dart';
import 'package:flutter_sample/custom_widgets/custom_date_picker.dart';
import 'package:flutter_sample/models/tenant_details.dart';
import 'package:flutter_sample/utils/constants.dart';
import 'package:flutter_sample/utils/custom_items.dart';
import 'package:provider/provider.dart';

import '../../database/database.dart';
import '../../database/database_provider.dart';
import '../../utils/common_widgets.dart';

class BottomSheetTenantData extends StatefulWidget {
  final int houseNumber;

  const BottomSheetTenantData({super.key, required this.houseNumber});

  @override
  State<BottomSheetTenantData> createState() => _BottomSheetTenantDataState();
}

class _BottomSheetTenantDataState extends State<BottomSheetTenantData> {
  late AppDatabase database;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController readingController = TextEditingController();

  int _dateTimeStamp = 0;

  int _readingValue = 0;

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
                              validateAndInsertData();
                              print(
                                  'time $_dateTimeStamp hNo: ${widget.houseNumber} read $_readingValue');
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
                                child: CustomDatePicker(
                                  onDateChanged: (date) {
                                    if (date != null) {
                                      _dateTimeStamp = date;
                                    }
                                  },
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                decoration: customInputDecoration('Reading'),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                onChanged: (_) {
                                  saveFormState(_formKey);
                                },
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    return null;
                                  }
                                  return 'Reading needed';
                                },
                                onSaved: (value) {
                                  _readingValue = int.parse(value!);
                                },
                                controller: readingController,
                              ),
                            )
                          ]),
                    ))
              ],
            )),
      ),
    );
  }

  Future<void> insertInitData() async {
    await database.addTenantDetail(TenantReading(
        houseNumber: widget.houseNumber,
        total: 0,
        unit: 0,
        reading: _readingValue,
        timeStamp: _dateTimeStamp));
  }

  Future<void> validateAndInsertData() async {
    final readingData = await database.getLastData(widget.houseNumber);
    if (readingData == null) {
      insertInitData();
    } else {
      calculateAndInsertData(readingData);
    }
  }

  Future<void> calculateAndInsertData(int readingData) async {
    final unit = _readingValue - readingData;
    final total = unit * Constants.CURRENT_VALUE;
    await database.addTenantDetail(TenantReading(
        houseNumber: widget.houseNumber,
        timeStamp: _dateTimeStamp,
        reading: _readingValue,
        unit: unit,
        total: total));
  }
}
