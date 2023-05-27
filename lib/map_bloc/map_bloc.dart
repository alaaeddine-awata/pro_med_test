
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState.initial()) {
    on<AddMapEvent>((event, emit) async {
      final latitude = event.latitude;
      final longitude = event.longitude;
      emit(state.copyWith(latitude: latitude,longitude: longitude));
    });
  }
}
