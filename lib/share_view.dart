import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:deeplink_test/success_view.dart';
import 'package:flutter/material.dart';

class SharewVew extends StatefulWidget {
  const SharewVew({super.key});

  @override
  State<SharewVew> createState() => _SharewVewState();
}

class _SharewVewState extends State<SharewVew> {

  final _appLinks = AppLinks();
   // AppLinks is singleton
  @override
  void initState() {
    // Subscribe to all events (initial link and further)
    _appLinks.uriLinkStream.listen((uri) {
    // Do something (navigation, ...)
      log(uri.toString());
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessView(
        params: uri.queryParameters,
      )));
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(onPressed: () { }, icon: const Icon(Icons.share) )
        ],
      ),
    );
  }
}