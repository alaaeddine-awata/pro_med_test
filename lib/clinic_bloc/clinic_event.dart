part of 'clinic_bloc.dart';

@immutable
abstract class ClinicEvent {}

class AddClinic extends ClinicEvent {
  final ClinicModel clinic;

  AddClinic(this.clinic);
}

class LoadClinics extends ClinicEvent {}
