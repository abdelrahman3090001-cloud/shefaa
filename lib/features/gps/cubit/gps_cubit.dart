import 'package:flutter_bloc/flutter_bloc.dart';
import 'gps_state.dart';
import '../data/repos/gps_repo.dart';

class GpsCubit extends Cubit<GpsState> {
  final GpsRepo _gpsRepo;
  
  GpsCubit(this._gpsRepo) : super(const GpsInitial());

  void getGpsData() async {
    emit(const GpsLoading());
    try {
      final facilities = await _gpsRepo.getNearbyFacilities();
      emit(GpsSuccess(facilities: facilities));
    } catch (e) {
      emit(GpsError(error: e.toString()));
    }
  }
}
