import 'package:pinehouse_assignment/providers/base-screen/base_screen_provider.dart';
import 'package:pinehouse_assignment/providers/screen-1/screen1_provider.dart';
import 'package:pinehouse_assignment/providers/screen-2/screen2_provider.dart';

import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<BaseScreenProvider>(
    create: (context) => BaseScreenProvider(),
    lazy: false,
  ),
  ChangeNotifierProvider<Screen1Provider>(
    create: (context) => Screen1Provider(),
    lazy: false,
  ),
  ChangeNotifierProvider<Screen2Provider>(
    create: (context) => Screen2Provider(),
    lazy: false,
  ),
];
