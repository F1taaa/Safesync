import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1375E8),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Stack(
          children: [
            Card(
              child: Center(
                child: FlutterMap(
                  options: const MapOptions(
                    center: LatLng(10.683082, 122.966510),
                    zoom: 14.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile-{s}.openstreetmap.fr/hot/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName: 'com.example.app',
                    ),
                    CircleLayer(
                      circles: [
                        CircleMarker(
                          point: const LatLng(
                              10.67868203620914, 122.96494079767244),
                          radius: 500,
                          useRadiusInMeter: true,
                          color: Colors.blue.withOpacity(0.3),
                          borderColor: Colors.blue.withOpacity(0.7),
                          borderStrokeWidth: 1,
                        )
                      ],
                    ),
                    const MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(10.67868203620914, 122.96494079767244),
                          width: 50,
                          height: 50,
                          child: Icon(Icons.location_pin),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Search...',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black45,
                    mini: true,
                    child: const Icon(CupertinoIcons.arrow_left),
                  ),
                  const SizedBox(
                      height: 3), // Adjust the spacing between buttons
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                      height: 3), // Adjust the spacing between buttons
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    mini: true,
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                child: const Icon(CupertinoIcons.location_solid),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
