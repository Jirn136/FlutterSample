import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/common_widgets.dart';
import 'package:flutter_sample/utils/custom_items.dart';

import '../models/tenant_details.dart';

class TenantDetail extends StatefulWidget {
  const TenantDetail({super.key});

  @override
  State<TenantDetail> createState() => _TenantDetailState();
}

class _TenantDetailState extends State<TenantDetail> {
  final _dataRow = List.of([
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
    TenantDetails(
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        reading: 1233,
        unit: 12),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  customToast('Coming soon');
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          )
        ],
        title: const Text(
          'Tenant detail',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1.6),
        ),
      ),
      body: _dataRow.isNotEmpty ? paginatedTableData(_dataRow) : emptyView(),
    );
  }
}

Widget paginatedTableData(List<TenantDetails> dataRow) {
  return Column(
    children: [
      const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Tenant 1',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text('Came on 12/12/1234',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      Expanded(
          child: PaginatedDataTable(
        rowsPerPage: 10,
        columns: const [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Reading')),
          DataColumn(label: Text('Unit')),
          DataColumn(label: Text('Total'))
        ],
        source: _DataSource(dataRow),
      ))
    ],
  );
}

class _DataSource extends DataTableSource {
  final List<TenantDetails> _data;

  _DataSource(this._data);

  @override
  DataRow? getRow(int index) {
    final data = _data[index];
    return DataRow(cells: [
      DataCell(Text(formatEpochTime(data.timeStamp))),
      DataCell(Text(data.reading.toString())),
      DataCell(Text(data.unit.toString())),
      DataCell(Text(data.total.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
