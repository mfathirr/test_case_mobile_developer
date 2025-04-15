import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';

class AddressMapPage extends StatefulWidget {
  static const String routeName = 'address_map_page';
  const AddressMapPage({super.key});

  @override
  State<AddressMapPage> createState() => _AddressMapPageState();
}

class _AddressMapPageState extends State<AddressMapPage> {
  late MapController mapController;
  GeoPoint? pickedPoint;
  String? pickedAddress;

  @override
  void initState() {
    super.initState();
    mapController = MapController.withUserPosition(
      trackUserLocation: const UserTrackingOption(
        enableTracking: true,
        unFollowUser: false,
      ),
    );

    mapController.listenerMapLongTapping.addListener(() async {
      final tappedPoint = mapController.listenerMapLongTapping.value;
      if (tappedPoint != null) {
        await mapController.addMarker(tappedPoint);

        _selectLocation(tappedPoint);
      }
    });
  }

  Future<void> _selectLocation(GeoPoint point) async {
    if (pickedPoint != null) {
      await mapController.removeMarker(pickedPoint!);
    }

    setState(() {
      pickedPoint = point;
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        point.latitude,
        point.longitude,
      );

      setState(() {
        pickedAddress =
            ' ${placemarks[0].street}, ${placemarks[0].subLocality}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].administrativeArea}, ${placemarks[0].postalCode}, ${placemarks[0].country}';
      });

      await mapController.removeLastRoad();
      await mapController.addMarker(point).then((_) {
        _showAddressBottomSheet(
            context, pickedAddress ?? 'No address found', pickedPoint ?? point);
      });
    } catch (e) {
      print("Failed to get address: $e");
    }
  }

  void _showAddressBottomSheet(
      BuildContext context, String address, GeoPoint point) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Selected Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              address,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pop();
                context.pop({
                  'address': address,
                  'lat': point.latitude,
                  'long': point.longitude
                });
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Address'),
      ),
      body: OSMFlutter(
        controller: mapController,
        osmOption: OSMOption(
          userTrackingOption: const UserTrackingOption(
            enableTracking: true,
            unFollowUser: false,
          ),
          zoomOption: const ZoomOption(
            initZoom: 1,
            minZoomLevel: 3,
            maxZoomLevel: 18,
            stepZoom: 1.0,
          ),
          userLocationMarker: UserLocationMaker(
            personMarker: const MarkerIcon(
              icon: Icon(Icons.person_pin, color: Colors.blue, size: 50),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(Icons.navigation, color: Colors.blue, size: 50),
            ),
          ),
          roadConfiguration: const RoadOption(roadColor: Colors.blue),
          markerOption: MarkerOption(
            defaultMarker: const MarkerIcon(
              icon: Icon(Icons.location_pin, color: Colors.red, size: 48),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController.listenerMapSingleTapping.removeListener(() {});
    mapController.dispose();
    super.dispose();
  }
}
