import 'package:flutter/material.dart';
import 'package:flutter_sample/models/house_people.dart';
import 'package:flutter_sample/screens/tenant_detail.dart';
import 'package:flutter_sample/utils/common_widgets.dart';
import 'package:flutter_sample/utils/constants.dart';
import 'package:flutter_sample/utils/custom_items.dart';
import 'package:flutter_sample/utils/shared_preferences.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  var housePeopleList = List.of([
    HousePeople(
        amount: 2000,
        containsBalance: false,
        houseNumber: 1,
        peopleName: "sample 1",
        powerUsage: 1234,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        water: 200),
    HousePeople(
        amount: 2000,
        containsBalance: false,
        houseNumber: 2,
        peopleName: "sample 2",
        powerUsage: 1234,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        water: 200),
    HousePeople(
        amount: 2000,
        containsBalance: false,
        houseNumber: 3,
        peopleName: "sample 3",
        powerUsage: 1234,
        timeStamp: DateTime.now().millisecondsSinceEpoch,
        total: 1234,
        water: 200)
  ]);

  @override
  Widget build(BuildContext context) {
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
      body: housePeopleList.isNotEmpty ? listItems() : emptyView(),
      floatingActionButton: fabButton(context),
    );
  }

  Widget listItems() {
    return ListView.builder(
      itemBuilder: (context, position) {
        var people = housePeopleList[position];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TenantDetail()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      formatEpochTime(people.timeStamp),
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
                      people.peopleName,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('${people.powerUsage} unit'),
                        ),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              '\u20B9 ${people.total}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: housePeopleList.length,
    );
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
