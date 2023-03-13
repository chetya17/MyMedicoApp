// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// // class Mymap extends StatefulWidget {
// //   @override
// //   _MymapState createState() => _MymapState();
// // }

// // class _MymapState extends State<Mymap> {
// //   late GoogleMapController mapController;
// //   static final LatLng _center = const LatLng(16.4963, 80.5007);
// //   final Set<Marker> _markers = {};
// //   LatLng _currentMapPosition = _center;

// //   void _onAddMarkerButtonPressed() {
// //     setState(() {
// //       _markers.add(Marker(
// //         markerId: MarkerId(_currentMapPosition.toString()),
// //         position: _currentMapPosition,
// //         infoWindow:
// //             const InfoWindow(title: 'Nice Place', snippet: 'Welcome to VIT'),
// //         icon: BitmapDescriptor.defaultMarker,
// //       ));
// //     });
// //   }

// //   void _onCameraMove(CameraPosition position) {
// //     _currentMapPosition = position.target;
// //   }

// //   void _onMapCreated(GoogleMapController controller) {
// //     mapController = controller;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Map for FarmField'),
// //           backgroundColor: Color.fromARGB(255, 48, 71, 77),
// //         ),
// //         body: Stack(
// //           children: <Widget>[
// //             GoogleMap(
// //                 onMapCreated: _onMapCreated,
// //                 initialCameraPosition: CameraPosition(
// //                   target: _center,
// //                   zoom: 7.0,
// //                 ),
// //                 markers: _markers,
// //                 onCameraMove: _onCameraMove),
// //             Padding(
// //               padding: const EdgeInsets.all(14.0),
// //               child: Align(
// //                 alignment: Alignment.topRight,
// //                 child: FloatingActionButton(
// //                   onPressed: _onAddMarkerButtonPressed,
// //                   materialTapTargetSize: MaterialTapTargetSize.padded,
// //                   backgroundColor: Color.fromARGB(255, 24, 32, 25),
// //                   child: const Icon(Icons.map, size: 30.0),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: const Text('To the lake!'),
//         icon: const Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
