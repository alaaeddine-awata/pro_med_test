import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pro_med_test/map_bloc/map_bloc.dart';
import 'package:pro_med_test/model.dart';
import 'dart:async';

import 'package:pro_med_test/resources/routes_manager.dart';
class MapWidget extends StatefulWidget {
  final String longitude;
  final String latitude;
  const MapWidget({Key? key, required this.longitude, required this.latitude}) : super(key: key);

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  late CameraPosition _kGooglePlex;

  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(double.tryParse(widget.latitude)??0, double.tryParse(widget.longitude)??0),
      zoom: 14.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      // onTap: (v){
      //   Navigator.of(context).pushNamed(Routes.setLocationOnMapRoute,arguments: MapModel(widget.latitude, widget.longitude));
      // },
      buildingsEnabled: false,
      rotateGesturesEnabled: false,
      mapToolbarEnabled: false,
      scrollGesturesEnabled: false,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
    );
  }
}

class SetLocationOnMap extends StatefulWidget {
 final MapModel mapModel;
  const SetLocationOnMap({Key? key, required this.mapModel,}) : super(key: key);

  @override
  State<SetLocationOnMap> createState() => _SetLocationOnMapState();
}

class _SetLocationOnMapState extends State<SetLocationOnMap> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  late CameraPosition _kGooglePlex;
  LatLng? _selectedLocation;

  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(double.tryParse(widget.mapModel.latitude)??0, double.tryParse(widget.mapModel.longitude)??0),
      zoom: 14.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _selectedLocation == null
                  ? {
                Marker(
                    markerId: MarkerId('selected-location'),
                    position: LatLng(double.tryParse(widget.mapModel.latitude)??33.5412719, double.tryParse(widget.mapModel.longitude) ?? 36.2470416),
                    consumeTapEvents: true
                ),
              }
                  : {
                Marker(
                  markerId: MarkerId('selecte-location'),
                  position: _selectedLocation!,
                  consumeTapEvents: true
                ),
              },
              onTap: (v){
                setState(() {
                  _selectedLocation = v;
                });
                print(v.toString());
              },
            ),
          ),
          ElevatedButton(onPressed: (){
            if(_selectedLocation != null) {
              BlocProvider.of<MapBloc>(context).add(AddMapEvent(_selectedLocation!.latitude.toString(), _selectedLocation!.longitude.toString()));
            }
            Navigator.of(context).pop();
          }, child: Text('Save'))
        ],
      ),
    );
  }
}
