import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

/// This is the main app stateful widget.
class AppSettingsExample extends StatefulWidget {
  const AppSettingsExample({super.key});

  @override
  _AppSettingsExampleState createState() => _AppSettingsExampleState();
}

/// This is the app state.
class _AppSettingsExampleState extends State<AppSettingsExample> {
  @override
  void initState() {
    /// Call out to intialize platform state.
    initPlatformState();
    super.initState();
  }

  /// Initialize platform state.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  /// Widget build method to return MaterailApp.
  @override
  Widget build(BuildContext context) {
    var actionItems = getListOfActionButtons();
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Settings Example App'),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Colors.blueGrey,
          ),
          itemCount: actionItems.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: actionItems[index],
          ),
        ));
  }

  List<Widget> getListOfActionButtons() {
    var actionItems = <Widget>[];

    actionItems.addAll([
      ListTile(
          title: const Text('Example Call With Callback'),
          minVerticalPadding: 5.0,
          onTap: (() {
            AppSettings.openWIFISettings(callback: () {
              print("sample callback function called");
            });
          })),
      ListTile(
          title: const Text('WIFI'),
          minVerticalPadding: 5.0,
          onTap: (() {
            AppSettings.openWIFISettings();
          })),
      ListTile(
        title: const Text("Location"),
        onTap: () {
          AppSettings.openLocationSettings();
        },
      ),
      ListTile(
        title: const Text("Security"),
        onTap: () {
          AppSettings.openSecuritySettings();
        },
      ),
      ListTile(
        title: const Text("Lock & Password"),
        onTap: () {
          AppSettings.openLockAndPasswordSettings();
        },
      ),
      ListTile(
        title: const Text("App Settings"),
        onTap: () {
          AppSettings.openAppSettings();
        },
      ),
      ListTile(
        title: const Text("Bluetooth"),
        onTap: () {
          AppSettings.openBluetoothSettings();
        },
      ),
      ListTile(
        title: const Text("Data Roaming"),
        onTap: () {
          AppSettings.openDataRoamingSettings();
        },
      ),
      ListTile(
        title: const Text("Date"),
        onTap: () {
          AppSettings.openDateSettings();
        },
      ),
      ListTile(
        title: const Text("Display"),
        onTap: () {
          AppSettings.openDisplaySettings();
        },
      ),
      ListTile(
        title: const Text("Notification"),
        onTap: () {
          AppSettings.openNotificationSettings();
        },
      ),
      ListTile(
        title: const Text("Sound"),
        onTap: () {
          AppSettings.openSoundSettings();
        },
      ),
      ListTile(
        title: const Text("Internal Storage"),
        onTap: () {
          AppSettings.openInternalStorageSettings();
        },
      ),
      ListTile(
        title: const Text("Battery optimization"),
        onTap: () {
          AppSettings.openBatteryOptimizationSettings();
        },
      ),
      ListTile(
        title: const Text("NFC"),
        onTap: () {
          AppSettings.openNFCSettings();
        },
      ),
      ListTile(
        title: const Text("VPN"),
        onTap: () {
          AppSettings.openVPNSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: const Text("Device Settings"),
        onTap: () {
          AppSettings.openDeviceSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: const Text("Accessibility"),
        onTap: () {
          AppSettings.openAccessibilitySettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: const Text("Developer"),
        onTap: () {
          AppSettings.openDevelopmentSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: const Text("Hotspot"),
        onTap: () {
          AppSettings.openHotspotSettings(
            asAnotherTask: true,
          );
        },
      ),
      ListTile(
        title: const Text("APN"),
        onTap: () {
          AppSettings.openAPNSettings(asAnotherTask: true);
        },
      ),
      ListTile(
        title: const Text("Alarm & Reminders"),
        onTap: () {
          AppSettings.openAlarmSettings(asAnotherTask: true);
        },
      ),
    ]);
    return actionItems;
  }

  /// Dispose method to close out and cleanup objects.
  @override
  void dispose() {
    super.dispose();
  }
}
