import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationExample extends StatefulWidget {
  const LocationExample({super.key});

  @override
  State<LocationExample> createState() => _LocationExampleState();
}

class _LocationExampleState extends State<LocationExample> {
  Location location = Location();

  bool? _serviceEnabled;

  PermissionStatus? _permissionGranted;

  LocationData? _locationData;

  checkLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    } else {
      _locationData = await location.getLocation();
    }
    setState(() {});
  }

  @override
  void initState() {
    checkLocation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _locationData == null
          ? const CircularProgressIndicator()
          : Text(
              "Your Latitude is ${_locationData!.latitude} \n Your Longitude is  ${_locationData!.longitude}"),
    ));
  }
}
