//same backgrounds

import '../../consts/consts.dart';

Widget bgWidget({required Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image:
      DecorationImage(image: AssetImage(icAppLogo), fit: BoxFit.fill),
    ),
    child: child,
  );
}