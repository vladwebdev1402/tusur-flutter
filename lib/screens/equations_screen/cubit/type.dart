class Equation {
  double? x1;
  double? x2;
  double? d;
  double coefA;
  double coefB;
  double coefC;

  Equation({
    required this.d,
    required this.coefA,
    required this.coefB,
    required this.coefC,
    this.x1,
    this.x2,
  });

  factory Equation.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "x1": double? x1,
        "x2": double? x2,
        "d": double? d,
        "coefA": double coefA,
        "coefB": double coefB,
        "coefC": double coefC,
      } =>
        Equation(
          x1: x1,
          x2: x2,
          d: d,
          coefA: coefA,
          coefB: coefB,
          coefC: coefC,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class Equations {
  static List<Equation> fromJson(List<Map<String, dynamic>> data) {
    return data.map((item) => Equation.fromJson(item)).toList();
  }
}
