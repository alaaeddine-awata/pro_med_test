part of 'map_bloc.dart';

@immutable
class MapState {
  final String latitude;
  final String longitude;

  const MapState({required this.latitude,required this.longitude});

  factory MapState.initial() {
    return const MapState(latitude: '',longitude: '');
  }

  MapState copyWith({String? latitude, String? longitude}) {
    return MapState(latitude: latitude ?? this.latitude,longitude: longitude??this.longitude);
  }
}
