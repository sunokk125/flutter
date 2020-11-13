import 'package:flutter/material.dart';

import '../models/place_model.dart';
import 'package:flutter_foreign/service/gplace_service.dart';
import 'package:flutter_foreign/page/DetailPlacePage.dart';

class GeoPage extends StatefulWidget {
  @override
  State createState() => new _State();
}

class _State extends State<GeoPage> {
  @override
  Widget build(BuildContext context) {
    onItemTapped = () => Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new DetailPlacePage()));

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nearby places"),
        backgroundColor: Colors.green,
      ),
      body: _createContent(),
    );
  }

  final _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _createContent() {
    if (_places == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new ListView(
        children: _places.map((f) {
          return new Card(
            child: new ListTile(
                title: new Text(
                  f.name,
                  style: _biggerFont,
                ),
                leading: new Image.network(f.icon),
                subtitle: new Text(f.vicinity),
                onTap: () {
                  // onItemTapped();
                  handleItemTap(f);
                }),
          );
        }).toList(),
      );
    }
  }

  List<PlaceDetail> _places;
  @override
  void initState() {
    super.initState();
    if (_places == null) {
      LocationService.get().getNearbyPlaces().then((data) {
        this.setState(() {
          _places = data;
        });
      });
    }

    //print("count: "+_places.length.toString());
  }

  handleItemTap(PlaceDetail place) {
    Navigator.pushNamed(context, '/main');
  }

  VoidCallback onItemTapped;
}
