// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityPlusExample extends StatefulWidget {
  const ConnectivityPlusExample({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  _ConnectivityPlusExampleState createState() => _ConnectivityPlusExampleState();
}

class _ConnectivityPlusExampleState extends State<ConnectivityPlusExample> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Plus '),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _connectionStatus == ConnectivityResult.wifi
              ? const Icon(
                  Icons.wifi,
                  size: 40,
                )
              : _connectionStatus == ConnectivityResult.mobile
                  ? const Icon(
                      Icons.perm_data_setting,
                      size: 40,
                    )
                  : const Icon(
                      Icons.not_interested,
                      size: 40,
                    ),
          const SizedBox(
            height: 20,
          ),
          Text('Connection Status: ${_connectionStatus.toString()}'),
        ],
      )),
    );
  }
}
