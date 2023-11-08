import '../../consts/consts.dart';

Widget appLogoWidget() {
  return Image.asset(icAppLogo)
      .box
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}