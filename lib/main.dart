import 'package:deeplink_test/services/uni_links_services.dart';
import 'package:flutter/material.dart';

import 'share_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UniLinksService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter DeepLink Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SharewVew(),
    );
  }
}
