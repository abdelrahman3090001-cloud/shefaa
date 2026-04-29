import 'package:flutter_bloc/flutter_bloc.dart';
import 'prescription_state.dart';
import '../data/models/prescription_model.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  PrescriptionCubit() : super(PrescriptionInitial());

  void getPrescriptions() {
    emit(PrescriptionLoading());
    // Simulated data based on the design
    final prescriptions = [
      PrescriptionModel(
        medicineName: 'Panadol',
        dosage: '2 Pills',
        instruction: 'After Eating',
        days: ['Sun', 'Tue', 'Thu'],
        currentDay: 10,
        totalDays: 60,
        times: ['9:00 PM', '10:00 AM'],
      ),
      PrescriptionModel(
        medicineName: 'Aspirin',
        dosage: '1 Pill',
        instruction: 'Before Eating',
        days: ['Everyday'],
        currentDay: 15,
        totalDays: 60,
        times: ['9:00 PM'],
      ),
    ];
    emit(PrescriptionSuccess(prescriptions));
  }

  void deletePrescription(int index) {
    if (state is PrescriptionSuccess) {
      final currentList = List<PrescriptionModel>.from((state as PrescriptionSuccess).prescriptions);
      currentList.removeAt(index);
      emit(PrescriptionSuccess(currentList));
    }
  }
}
