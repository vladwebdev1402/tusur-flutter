String coefToString(double? coef) {
  if (coef == null) return "";

  String coefStr = coef.toString();

  if (coefStr.endsWith('.0')) {
    return coefStr.replaceAll('.0', '');
  } else {
    return coefStr;
  }
}
