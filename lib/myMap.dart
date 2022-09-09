// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MyMpp extends StatefulWidget {
//
//   @override
//   State<MyMpp> createState() => _MyMppState();
// }
//
// class _MyMppState extends State<MyMpp> {
//   late GoogleMapController mapController;
//   final LatLng omariMosque = const LatLng( 31.514431857094184,34.439320005476475);
//   Set<Marker> markers ={};
//   animateMapToLocation(LatLng latLng){
//     mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 30));
//   }
//   addToMarkers(LatLng latLng){
//     Marker marker = Marker(markerId:MarkerId('my location'),position:latLng);
//     markers.add(marker);
//     setState((){});
//   }
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }
//   getMyLocation()async{
//     Position position = await Geolocator.getCurrentPosition();
//     animateMapToLocation(LatLng(position.latitude, position.longitude));
//     print('/////////////////////////////////////////////////////');
//     print(position.latitude);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             animateMapToLocation(omariMosque);
//           },
//           child: Icon(Icons.gps_fixed),
//         ),
//         appBar: AppBar(
//           title: const Text('Maps Sample App'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           onTap: (LatLng point){
//             addToMarkers(point);
//             //mapController.animateCamera(CameraUpdate.newLatLngZoom(point, 18));
//             animateMapToLocation(point);
//             log('////////////////////////////////////////////////////////');
//             log(point.latitude.toString());
//             log(point.longitude.toString());
//           },
//           onMapCreated: (GoogleMapController controller)async {
//             this.mapController = controller;
//             await getMyLocation();
//           },
//           markers:markers ,
//           initialCameraPosition: CameraPosition(
//             target: omariMosque,
//             zoom: 15.0,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(const MyMpp());

class MyMpp extends StatefulWidget {
  const MyMpp({super.key});

  @override
  State<MyMpp> createState() => _MyMppState();
}

class _MyMppState extends State<MyMpp> {

  late GoogleMapController mapController;




  Set<Marker> markers={};
  final LatLng _center = const LatLng(30.972064784013522, 34.89831201732159);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    _determinePosition() ;
    getMylocation();



    setState(() {

    });
  }
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,

      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static final CameraPosition taped = CameraPosition(
      bearing: 192.8334901395799,

      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  void add(LatLng latLng){
    Marker marker=Marker(markerId: MarkerId(latLng.longitude.toString()),position:latLng);
    markers.add(marker);
  }
  void clearmarker(){
    markers={};
    setState(() {

    });


  }

  void getMylocation()async{
    Position position=await _determinePosition();
    mapController.animateCamera(CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed:clearmarker,

          label: Text('Remove markers'),
          icon: Icon(Icons.directions_boat),
        ),
        body: GoogleMap(
          myLocationEnabled :true,
          //  markers: markers.values.toSet(),


          onTap: ((LatLng point) {
            add(point);
            setState(() {
            });

            //    ZoomPageTransitionsBuilder();


          }),
          onLongPress: (LatLng point){
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
          markers: markers,
          mapType: MapType.hybrid,
          trafficEnabled: true,


          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),

    );
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

}
