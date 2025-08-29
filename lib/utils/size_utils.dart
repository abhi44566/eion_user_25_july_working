import 'import.dart';
class MyFontSize {
  static double butt0nFontSize = 16;
  static double iconSize = 25;
  static double fourteen = 14;
  final double h;
  final double w;
  MyFontSize(BuildContext context): h = MediaQuery.of(context).size.height,
   w = MediaQuery.of(context).size.width;
}