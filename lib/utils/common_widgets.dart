import 'package:flutter/material.dart';

Widget emptyView() {
  return SafeArea(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/no_data.jpg',
            height: 250,
            width: 250,
          ),
        ],
      ),
    ),
  );
}

Widget fabButton(BuildContext context, VoidCallback callback) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        onPressed: () {
          callback();},
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
    ),
  );
}
