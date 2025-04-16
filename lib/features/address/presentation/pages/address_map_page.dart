import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:go_router/go_router.dart';
import 'package:test_case_mobile_developer/core/theme/app_theme.dart';
import 'package:test_case_mobile_developer/features/address/presentation/bloc/bloc/address_bloc.dart';

class AddressMapPage extends StatefulWidget {
  final GeoPoint? point;
  static const String routeName = 'address_map_page';
  const AddressMapPage({super.key, this.point});

  @override
  State<AddressMapPage> createState() => _AddressMapPageState();
}

class _AddressMapPageState extends State<AddressMapPage> {
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    final initPosition =
        widget.point ?? GeoPoint(latitude: -6.1754083, longitude: 106.824584);

    mapController = MapController.withPosition(
      initPosition: initPosition,
    );

    final bloc = context.read<AddressBloc>();

    mapController.listenerMapLongTapping.addListener(() async {
      final tappedPoint = mapController.listenerMapLongTapping.value;
      if (tappedPoint != null) {
        await mapController.addMarker(tappedPoint);

        bloc.add(AddressEvent.mapAddress(
          point: tappedPoint,
          mapController: mapController,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.mapAddress != null) {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pilih Alamat',
                    style: AppTheme.jakartaSansTextTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.mapAddress ?? '',
                    style: AppTheme.jakartaSansTextTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      context
                          .read<AddressBloc>()
                          .add(const AddressEvent.clearData(mapAddress: true));
                      context.pop();
                      context.pop({
                        'address': state.mapAddress,
                        'lat': state.mapPoint?.latitude,
                        'long': state.mapPoint?.longitude
                      });
                    },
                    child: Text(
                      'Pin',
                      style: AppTheme.jakartaSansTextTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(Icons.arrow_back_ios_new_rounded, size: 19),
              ),
              const SizedBox(width: 10),
              const Text('Pin Alamat'),
            ],
          ),
        ),
        body: OSMFlutter(
          controller: mapController,
          osmOption: OSMOption(
            zoomOption: const ZoomOption(
              initZoom: 15,
              minZoomLevel: 3,
              maxZoomLevel: 18,
              stepZoom: 1.0,
            ),
            roadConfiguration: const RoadOption(roadColor: Colors.blue),
            markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 48,
                ),
              ),
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
