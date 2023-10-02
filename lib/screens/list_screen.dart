import 'package:flutter/material.dart';
import 'package:flutter_sample/database/database.dart';
import 'package:flutter_sample/database/database_provider.dart';
import 'package:flutter_sample/screens/bottomSheet/bottom_sheet_add_tenant.dart';
import 'package:flutter_sample/utils/common_widgets.dart';
import 'package:flutter_sample/utils/constants.dart';
import 'package:flutter_sample/utils/custom_items.dart';
import 'package:flutter_sample/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late AppDatabase database;

  @override
  Widget build(BuildContext context) {
    database = Provider.of<DatabaseProvider>(context).database;
    final tenantStream = database.getAllTenants();
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text(
          'Tenants List',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  showLogoutDialog();
                },
                icon: const Icon(Icons.power_settings_new_outlined),
                color: Colors.white),
          )
        ],
      ),
      body: StreamBuilder(
        stream: tenantStream,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else if (!snapShot.hasData || snapShot.data?.isEmpty == true) {
            return emptyView();
          } else if (snapShot.hasError) {
            return const Center(child: Text('Unable to fetch data'));
          } else {
            return listItems(snapShot.data);
          }
        },
      ),
      floatingActionButton: fabButton(context, () {
        showModalBottomSheet<void>(
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            builder: (BuildContext context) {
              return const BottomSheetAddTenant();
            });
      }),
    );
  }

  Widget listItems(List<Tenants>? tenantList) {
    return ListView.builder(
        itemCount: tenantList?.length,
        itemBuilder: (context, position) {
          var people = tenantList![position];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              database.deleteTenant(people.houseNumber);
            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/tenant_detail',
                    arguments: {'house_number': people.houseNumber});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          formatEpochTime(people.date),
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          people.houseNumber.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          people.tenantName,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text('0 unit'),
                            ),
                            Spacer(),
                            Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Text(
                                  '\u20B9 0',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget customDialogText(String content) {
    return Text(
      content,
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }

  void showLogoutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: customDialogText('No')),
              TextButton(
                child: customDialogText('Yes'),
                onPressed: () {
                  PreferenceUtils().save(Constants.isChecked, false);
                  Navigator.of(context).pushReplacementNamed("/login");
                },
              ),
            ],
          );
        });
  }
}
