import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/clinic_model.dart';

part 'clinic_event.dart';
part 'clinic_state.dart';

// class ClinicBloc extends Bloc<ClinicEvent, ClinicState> {
//   ClinicBloc() : super(ClinicState.initial());
//
//   @override
//   Stream<ClinicState> mapEventToState(ClinicEvent event) async* {
//     if (event is AddClinic) {
//       final updatedList = state.clinics.toList()..add(event.clinic);
//       await _saveClinics(updatedList);
//       yield state.copyWith(clinics: updatedList);
//     } else if (event is LoadClinics) {
//       final loadedList = await _loadClinics();
//       yield state.copyWith(clinics: loadedList);
//     }
//   }
//
//   Future<void> _saveClinics(List<ClinicModel> clinics) async {
//     final prefs = await SharedPreferences.getInstance();
//     final clinicsJson = jsonEncode(clinics.map((c) => c.toJson()).toList());
//     await prefs.setString('clinics', clinicsJson);
//   }
//
//   Future<List<ClinicModel>> _loadClinics() async {
//     final prefs = await SharedPreferences.getInstance();
//     final clinicsJson = prefs.getString('clinics');
//     if (clinicsJson == null) {
//       return [];
//     }
//     final clinicsList = jsonDecode(clinicsJson) as List;
//     return clinicsList
//         .map((c) => ClinicModel.fromJson(c as Map<String, dynamic>))
//         .toList();
//   }
// }

class ClinicBloc extends Bloc<ClinicEvent, ClinicState> {
  ClinicBloc() : super(ClinicState.initial()) {
    on<AddClinic>((event, emit) async {
      final updatedList = state.clinics.toList()..add(event.clinic);
      await _saveClinics(updatedList);
      emit(state.copyWith(clinics: updatedList));
    });

    on<LoadClinics>((event, emit) async {
      final loadedList = await _loadClinics();
      emit(state.copyWith(clinics: loadedList));
    });
  }

  Future<void> _saveClinics(List<ClinicModel> clinics) async {
    final prefs = await SharedPreferences.getInstance();
    final clinicsJson = jsonEncode(clinics.map((c) => c.toJson()).toList());
    await prefs.setString('clinics', clinicsJson);
  }

  Future<List<ClinicModel>> _loadClinics() async {
    final prefs = await SharedPreferences.getInstance();
    final clinicsJson = prefs.getString('clinics');
    if (clinicsJson == null) {
      return [];
    }
    final clinicsList = jsonDecode(clinicsJson) as List;
    return clinicsList
        .map((c) => ClinicModel.fromJson(c as Map<String, dynamic>))
        .toList();
  }
}

