import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/common_widgets.dart';
import 'package:flutter_sample/utils/custom_items.dart';

import '../models/tenant_details.dart';

class TenantDetailList extends StatelessWidget {
  TenantDetailList({super.key});

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
    return Container(
      color: Colors.green,
      child: SafeArea(
        child: _dataRow.isNotEmpty
            ? paginatedTableData(_dataRow, context)
            : emptyView(),
      ),
    );
  }
}

Widget paginatedTableData(List<TenantDetails> dataRow, BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        expandedHeight: 90,
        collapsedHeight: 60,
        pinned: true,
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Tenant 1',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                'Came on 12/12/1234',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: PaginatedDataTable(
          rowsPerPage: 30,
          columns: const [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Reading')),
            DataColumn(label: Text('Unit')),
            DataColumn(label: Text('Total'))
          ],
          source: _DataSource(dataRow),
        ),
      )
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
