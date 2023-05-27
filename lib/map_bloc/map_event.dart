part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class AddMapEvent extends MapEvent {
 final String latitude;
 final String longitude;

  AddMapEvent(this.latitude,this.longitude);
}
