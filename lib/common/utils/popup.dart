import 'package:flutter/material.dart';

void loaderPopup(context) {
  showDialog(
    context: context,
    builder: (_) {
      return const Dialog(
        insetPadding: EdgeInsets.all(15),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
