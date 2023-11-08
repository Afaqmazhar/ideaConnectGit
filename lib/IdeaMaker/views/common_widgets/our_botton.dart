
import '../../consts/consts.dart';

Widget ourBotton({required onPress, required color, required textColor,required String title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color, padding: const EdgeInsets.all(12)),
      onPressed:onPress,
      child: title.text.color(textColor).fontFamily(bold).make());
}
