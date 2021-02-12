import 'package:flutter/material.dart';

import 'pages/root_app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'GT Walsheim Pro'),
    home: RootApp()),
  );
}
