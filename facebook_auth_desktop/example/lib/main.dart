import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:facebook_auth_desktop/facebook_auth_desktop.dart';
import 'package:flutter_facebook_auth_platform_interface/flutter_facebook_auth_platform_interface.dart';

final plugin = FacebookAuthDesktopPlugin();

String prettyPrint(Map json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}

String describeUserData(FacebookUserDataResult userData) {
  return switch (userData) {
    FacebookAccount() => prettyPrint({
        'id': userData.id,
        'name': userData.name,
        'email': userData.email,
        'picture': userData.picture?.url,
      }),
    FacebookApiError() => 'Error ${userData.code} (${userData.subCode}): $userData',
  };
}

void main() {
  plugin.webAndDesktopInitialize(
    appId: '1329834907365798',
    cookie: true,
    version: 'v18.0',
    xfbml: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // plugin.accessToken.then((value) => null);
  }

  void _signIn(BuildContext context) async {
    final result = await plugin.login();

    if (result.status.name == 'success') {
      final userData = await plugin.getUserData();
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(
            describeUserData(userData),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () => _signIn(context),
          child: const Text('sign in'),
        ),
      ),
    );
  }
}
