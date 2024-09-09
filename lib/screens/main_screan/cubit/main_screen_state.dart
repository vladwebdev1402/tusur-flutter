enum ModeType { form, result }

abstract class MainScreenState {}

class MainScreenUpdateState extends MainScreenState {
  final ModeType mode;
  double? x1;
  double? x2;
  double d;
  String coefA;
  String coefB;
  String coefC;

  MainScreenUpdateState(
      {required this.mode,
      required this.d,
      required this.coefA,
      required this.coefB,
      required this.coefC,
      this.x1,
      this.x2});
}
