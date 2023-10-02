import 'package:flutter/material.dart';
import 'package:flutter_sample/database/database.dart';
import 'package:flutter_sample/database/database_provider.dart';
import 'package:flutter_sample/models/tenant_info.dart';
import 'package:flutter_sample/utils/common_widgets.dart';
import 'package:flutter_sample/utils/custom_items.dart';
import 'package:provider/provider.dart';

import 'bottomSheet/bottom_sheet_tenant_data.dart';

class TenantDetailList extends StatelessWidget {
  const TenantDetailList({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final houseNumber = arguments['house_number'];
    AppDatabase database = Provider.of<DatabaseProvider>(context).database;
    final tenantData = database.getTenantDetails(houseNumber);

    return Container(
        color: Colors.green,
        child: paginatedTableData(tenantData, context, houseNumber, database));
  }
}

Widget paginatedTableData(Stream<List<TenantDetail>> userData,
    BuildContext context, int houseNumber, AppDatabase database) {
  return StreamBuilder(
      stream: userData,
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return customProgressBar(context);
        } else if (!snapShot.hasData || snapShot.data?.isEmpty == true) {
          return Scaffold(
              appBar: AppBar(
                leading: const BackButton(
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
                actions: [showAddDataBottomSheet(context, houseNumber)],
                title: titleData(database, houseNumber),
                centerTitle: true,
              ),
              body: emptyView());
        } else if (snapShot.hasError) {
          return const Center(
            child: Text('Unable to fetch data'),
          );
        } else {
          return tableItems(snapShot.data, context, houseNumber, database);
        }
      });
}

Widget tableItems(List<TenantDetail>? dataRow, BuildContext context,
    int houseNumber, AppDatabase database) {
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
        actions: [showAddDataBottomSheet(context, houseNumber)],
        title: titleData(database, houseNumber),
      ),
      SliverToBoxAdapter(
        child: PaginatedDataTable(
          rowsPerPage: 15,
          columns: const [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Reading')),
            DataColumn(label: Text('Unit')),
            DataColumn(label: Text('Total'))
          ],
          source: _DataSource(dataRow!),
        ),
      ),
    ],
  );
}

Future<TenantInfoDetails> tenantInfoDetails(
    AppDatabase database, int houseNumber) async {
  final info = await database.returnTenantInfo(houseNumber).then((value) =>
      TenantInfoDetails(
          houseNumber: value.houseNumber,
          tenantName: value.tenantName,
          timeStamp: value.date));
  return info;
}

Widget titleData(AppDatabase database, int houseNumber) {
  return FutureBuilder(
    future: tenantInfoDetails(database, houseNumber),
    builder: (context, snapShot) {
      if (snapShot.connectionState == ConnectionState.waiting) {
        return customProgressBar(context);
      } else if (!snapShot.hasData) {
        return userInfo('', 0);
      } else {
        final info = snapShot.data;
        return userInfo(info!.tenantName, info.timeStamp);
      }
    },
  );
}

Widget userInfo(String tenantName, int timeStamp) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          tenantName,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Text(
          'Came on ${formatEpochTime(timeStamp)}',
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ],
  );
}

Widget showAddDataBottomSheet(BuildContext context, int houseNumber) {
  return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet<void>(
              isScrollControlled: true,
              isDismissible: true,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              builder: (BuildContext context) {
                return SingleChildScrollView(
                    child: BottomSheetTenantData(
                  houseNumber: houseNumber,
                ));
              });
        },
        icon: const Icon(Icons.add),
        color: Colors.white,
        iconSize: 30,
      ));
}

class _DataSource extends DataTableSource {
  final List<TenantDetail> _data;

  _DataSource(this._data);

  @override
  DataRow? getRow(int index) {
    final data = _data[index];
    return DataRow(
        cells: [
          DataCell(Text(formatEpochTime(data.timeStamp))),
          DataCell(Text(data.reading.toString())),
          DataCell(Text(data.unit.toString())),
          DataCell(Text(data.total.toString())),
        ],
        onLongPress: () {
          print('${_data[index].timeStamp}');
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
