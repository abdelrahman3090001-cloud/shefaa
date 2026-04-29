import 'package:flutter_bloc/flutter_bloc.dart';
import 'medical_history_state.dart';
import '../data/models/medical_record_model.dart';

class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  MedicalHistoryCubit() : super(MedicalHistoryInitial());

  void getMedicalHistory() {
    emit(MedicalHistoryLoading());
    
    // Simulated initial data
    final records = [
      MedicalRecordModel(
        title: 'MRI Report',
        date: 'Sep 22, 2025',
        type: 'PDF',
        fileName: 'MRI_Scan_Brain.pdf',
      ),
      MedicalRecordModel(
        title: 'Lab Result',
        date: 'Sep 15, 2025',
        type: 'Image',
        fileName: 'Blood_Test.jpg',
      ),
      MedicalRecordModel(
        title: 'MRI Report',
        date: 'Feb 10, 2025',
        type: 'PDF',
        fileName: 'MRI_Spine.pdf',
      ),
    ];

    final info = MedicalInfoModel(
      fullName: 'Ahmed Mostafa',
      dob: '1992-10-15',
      phone: '+20 1012345678',
      bloodType: 'O+',
      weight: '80 kg',
      height: '180 cm',
      chronicConditions: ['Type 1 Diabetes', 'Asthma', 'Hypertension'],
      insuranceProvider: 'MetLife',
      insuranceId: '812304321',
      allergies: ['Drug: Penicillin', 'Food: Sesame - Milk'],
    );

    emit(MedicalHistorySuccess(records: records, info: info));
  }
}
