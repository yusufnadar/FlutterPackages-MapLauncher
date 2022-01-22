import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';

class MapLauncherPage extends StatefulWidget {
  const MapLauncherPage({Key? key}) : super(key: key);

  @override
  _MapLauncherPageState createState() => _MapLauncherPageState();
}

class _MapLauncherPageState extends State<MapLauncherPage> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Launcher'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showMarkerMethod();
              },
              child: const Text('Show Marker'),
            ),
            ElevatedButton(
              onPressed: () {
                showDirectionsMethod();
              },
              child: const Text('Show Directions'),
            )
          ],
        ),
      ),
    );
  }

  void getLocation() async {
    var permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      Geolocator.requestPermission();
    }
  }

  void showMarkerMethod() async {
    bool? deger = await MapLauncher.isMapAvailable(MapType.google);
    if (deger!) {
      MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(41.0220184, 39.5702944),
        title: 'Başlangıç Noktası',
      );
    }
  }

  void showDirectionsMethod() async {
    bool? deger = await MapLauncher.isMapAvailable(MapType.google);
    if (deger!) {
      MapLauncher.showDirections(
        mapType: MapType.google,
        origin: Coords(39.9357978, 32.8554572),
        destination: Coords(41.0220184, 39.5702944),
      );
    }
  }
}
