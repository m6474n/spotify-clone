String hexToColor(String hexColor) {
  String onlyCode = hexColor.substring(1);
  String color = "0xff$onlyCode";
  return color;
}