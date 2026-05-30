import 'package:flutter/foundation.dart';

@immutable
abstract class RealTimeLocation2State {
  const RealTimeLocation2State();
}

class RealTimeLocation2Initial extends RealTimeLocation2State {
  const RealTimeLocation2Initial();
}

class RealTimeLocation2Loading extends RealTimeLocation2State {
  const RealTimeLocation2Loading();
}

class RealTimeLocation2Success extends RealTimeLocation2State {
  const RealTimeLocation2Success();
}

class RealTimeLocation2Error extends RealTimeLocation2State {
  final String error;
  const RealTimeLocation2Error({required this.error});
}
