part of 'clinic_bloc.dart';

@immutable
class ClinicState {
  final List<ClinicModel> clinics;

  const ClinicState({required this.clinics});

  factory ClinicState.initial() {
    return const ClinicState(clinics: []);
  }

  ClinicState copyWith({List<ClinicModel>? clinics}) {
    return ClinicState(clinics: clinics ?? this.clinics);
  }
}
