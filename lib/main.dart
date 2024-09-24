import 'package:flutter/material.dart';
import 'package:hydenflutter/pages/pos.dart';
import 'package:hydenflutter/pages/login.dart';
import 'package:hydenflutter/pages/setting.dart';
import 'package:hydenflutter/pages/manufacture.dart';
import 'package:hydenflutter/pages/report.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'amplifyconfiguration.dart';

Future<void> main() async {
  try {
    //https://stackoverflow.com/questions/74944460/flutter-web-why-is-there-a-hashtag-in-the-url
    usePathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
    GoRoute(
        name: 'login',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        }),
    GoRoute(
        name: 'pos',
        path: '/pos',
        builder: (BuildContext context, GoRouterState state) {
          return const Pos();
        }),
    GoRoute(
        name: 'setting',
        path: '/setting',
        builder: (BuildContext context, GoRouterState state) {
          return const SettingPage();
        }),
    GoRoute(
        name: 'manufacture',
        path: '/manufacture',
        builder: (BuildContext context, GoRouterState state) {
          return const ManufacturePage();
        }),
    GoRoute(
        name: 'report',
        path: '/report',
        builder: (BuildContext context, GoRouterState state) {
          return const ReportPage();
        })
  ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const LoginPage(),
        //   '/home': (context) => const Home(),
        //   '/setting': (context) => const SettingPage(),
        // },
        );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sidebarx/sidebarx.dart';

// void main() {
//   runApp(SidebarXExampleApp());
// }

// class SidebarXExampleApp extends StatelessWidget {
//   SidebarXExampleApp({Key? key}) : super(key: key);

//   final _controller = SidebarXController(selectedIndex: 0, extended: true);
//   final _key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SidebarX Example',
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(
//       //   primaryColor: primaryColor,
//       //   canvasColor: canvasColor,
//       //   scaffoldBackgroundColor: scaffoldBackgroundColor,
//       //   textTheme: const TextTheme(
//       //     headlineSmall: TextStyle(
//       //       color: Colors.white,
//       //       fontSize: 46,
//       //       fontWeight: FontWeight.w800,
//       //     ),
//       //   ),
//       // ),
//       home: Builder(
//         builder: (context) {
//           final isSmallScreen = MediaQuery.of(context).size.width < 600;
//           return Scaffold(
//             key: _key,
//             appBar: isSmallScreen
//                 ? AppBar(
//                     backgroundColor: canvasColor,
//                     title: Text(_getTitleByIndex(_controller.selectedIndex)),
//                     leading: IconButton(
//                       onPressed: () {
//                         // if (!Platform.isAndroid && !Platform.isIOS) {
//                         //   _controller.setExtended(true);
//                         // }
//                         _key.currentState?.openDrawer();
//                       },
//                       icon: const Icon(Icons.menu),
//                     ),
//                   )
//                 : null,
//             drawer: ExampleSidebarX(controller: _controller),
//             body: Row(
//               children: [
//                 if (!isSmallScreen) ExampleSidebarX(controller: _controller),
//                 Expanded(
//                   child: Center(
//                     child: _ScreensExample(
//                       controller: _controller,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ExampleSidebarX extends StatelessWidget {
//   const ExampleSidebarX({
//     Key? key,
//     required SidebarXController controller,
//   })  : _controller = controller,
//         super(key: key);

//   final SidebarXController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return SidebarX(
//       controller: _controller,
//       theme: SidebarXTheme(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: canvasColor,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         hoverColor: scaffoldBackgroundColor,
//         textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
//         selectedTextStyle: const TextStyle(color: Colors.white),
//         hoverTextStyle: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//         ),
//         itemTextPadding: const EdgeInsets.only(left: 30),
//         selectedItemTextPadding: const EdgeInsets.only(left: 30),
//         itemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: canvasColor),
//         ),
//         selectedItemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: actionColor.withOpacity(0.37),
//           ),
//           gradient: const LinearGradient(
//             colors: [accentCanvasColor, canvasColor],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.28),
//               blurRadius: 30,
//             )
//           ],
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.white.withOpacity(0.7),
//           size: 20,
//         ),
//         selectedIconTheme: const IconThemeData(
//           color: Colors.white,
//           size: 20,
//         ),
//       ),
//       extendedTheme: const SidebarXTheme(
//         width: 200,
//         decoration: BoxDecoration(
//           color: canvasColor,
//         ),
//       ),
//       footerDivider: divider,
//       headerBuilder: (context, extended) {
//         return SizedBox(
//           height: 100,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Image.asset('assets/images/avatar.png'),
//           ),
//         );
//       },
//       items: [
//         SidebarXItem(
//           icon: Icons.home,
//           label: 'Home',
//           onTap: () {
//             debugPrint('Home');
//           },
//         ),
//         const SidebarXItem(
//           icon: Icons.search,
//           label: 'Search',
//         ),
//         const SidebarXItem(
//           icon: Icons.people,
//           label: 'People',
//         ),
//         SidebarXItem(
//           icon: Icons.favorite,
//           label: 'Favorites',
//           selectable: false,
//           onTap: () => _showDisabledAlert(context),
//         ),
//         const SidebarXItem(
//           iconWidget: FlutterLogo(size: 20),
//           label: 'Flutter',
//         ),
//       ],
//     );
//   }

//   void _showDisabledAlert(BuildContext context) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text(
//           'Item disabled for selecting',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//     );
//   }
// }

// class _ScreensExample extends StatelessWidget {
//   const _ScreensExample({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         final pageTitle = _getTitleByIndex(controller.selectedIndex);
//         switch (controller.selectedIndex) {
//           case 0:
//             return ListView.builder(
//               padding: const EdgeInsets.only(top: 10),
//               itemBuilder: (context, index) => Container(
//                 height: 200,
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Theme.of(context).canvasColor,
//                   boxShadow: const [BoxShadow()],
//                 ),
//               ),
//             );
//           default:
//             return Text(
//               pageTitle,
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//       },
//     );
//   }
// }

// String _getTitleByIndex(int index) {
//   switch (index) {
//     case 0:
//       return 'Home';
//     case 1:
//       return 'Search';
//     case 2:
//       return 'People';
//     case 3:
//       return 'Favorites';
//     case 4:
//       return 'Custom iconWidget';
//     case 5:
//       return 'Profile';
//     case 6:
//       return 'Settings';
//     default:
//       return 'Not found page';
//   }
// }

// const primaryColor = Color(0xFF685BFF);
// const canvasColor = Color(0xFF2E2E48);
// const scaffoldBackgroundColor = Color(0xFF464667);
// const accentCanvasColor = Color(0xFF3E3E61);
// const white = Colors.white;
// final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
// final divider = Divider(color: white.withOpacity(0.3), height: 1);
