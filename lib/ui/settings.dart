import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/widget/platform_widget.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(settingsTitle),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(settingsTitle),
      ),
      child: _buildList(context),
    );
  }
}

Widget _buildList(BuildContext context) {
  return ListView(
    children: [
      Material(
        child: ListTile(
          title: const Text('Dark Theme'),
          trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {
                defaultTargetPlatform == TargetPlatform.iOS
                    ? showCupertinoDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Comming soon'),
                            content:
                                const Text('this feature not available now'),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        })
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Comming soon!'),
                            content:
                                const Text('this feature not available now'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ok'))
                            ],
                          );
                        });
              }),
        ),
      )
    ],
  );
}
