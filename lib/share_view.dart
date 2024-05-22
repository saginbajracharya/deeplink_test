import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:deeplink_test/success_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      // navigateToAppOrPlayStore();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessView(
        params: uri.queryParameters,
      )));
    });
    super.initState();
  }

  Future<void> navigateToAppOrPlayStore() async {
    // Check if the app is installed (replace 'your.package.name' with your actual package name)
    if (!await canLaunchUrl(Uri(scheme: 'package', path: 'com.blinkslabs.blinkist.android'))) {
      const playStoreUrl = 'https://play.google.com/store/apps/details?id=com.blinkslabs.blinkist.android';
      if (await canLaunchUrl(Uri.parse(playStoreUrl))) {
        await launchUrl(Uri.parse(playStoreUrl));
      } else {
        // Handle cases where launching the Play Store fails (e.g., no internet connection)
      }
    } else {
      // Handle deep linking within your app if the app is installed
    }
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