import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../IdeaMaker/consts/consts.dart';

class MenuWidget extends StatelessWidget {
   MenuWidget({super.key});
ZoomDrawerController cntrl = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {

          if(ZoomDrawer.of(context) != null) {
            ZoomDrawer.of(context)!.toggle();

          }
        },
        icon: const Icon(Icons.menu));
  }
}
