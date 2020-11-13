import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class PlacePage extends StatefulWidget {
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<PlacePage> {
  TextEditingController searchController = TextEditingController();
  List<LazyCacheMap> rests;
  Position position;

  void dispose() {
    print("dispose() of PlacePage");
    super.dispose();
  }

  void initState() {
    super.initState();
    getLocation();
    print(kBottomNavigationBarHeight);
  }

  Future<void> getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            position != null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height -
                        kBottomNavigationBarHeight),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                            position.latitude,
                            position.longitude,
                          ),
                          zoom: 18),
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("loading.."),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
