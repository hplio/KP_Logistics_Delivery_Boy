import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final Completer<GoogleMapController>  _controller = Completer();
  static LatLng destinationLocation = LatLng(18.9322, 72.8264);
  static LatLng sourceDestination = LatLng(19.2183, 72.9781);
  List<LatLng> polyLineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() async{
    Location location = Location();
    print("done location");
    await location.getLocation().then((value){
      print(value);
      setState(() {
        currentLocation = value;
      });
    });
    print("updated location $currentLocation");

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((event) {
      setState(() {
        currentLocation = event;
      });

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(event.latitude!, event.longitude!)
          )
        )
      );
    });
  }

  void polyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDsyfGkTq9tXw9hDrq5OjXqvj0wxbdnnHw",
      PointLatLng(sourceDestination.latitude, sourceDestination.longitude),
      PointLatLng(destinationLocation.latitude, destinationLocation.longitude)
    );

    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {
        setState(() {
          polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polyPoints();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    print("printing here");
    return Scaffold(
      body: currentLocation == null
      ? Center(child: CircularProgressIndicator())
      : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 13.5
        ),
        markers: {
          Marker(
            markerId: MarkerId("currentLocation"),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
          Marker(
            markerId: MarkerId("Source"),
            position: sourceDestination
          ),
          Marker(
            markerId: MarkerId("Destination"),
            position: destinationLocation
          )
        },
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
        polylines: {
          Polyline(
            polylineId: PolylineId("route"),
            points: polyLineCoordinates,
            color: Color(0xFF7B61FF),
            width: 6
          )
        },
      ),
    );
  }
}