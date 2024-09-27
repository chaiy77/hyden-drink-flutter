import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:get/get.dart';
// import 'package:hydenflutter/stores/controller/userController.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'POS';
    case 1:
      return 'Manufacture';
    case 2:
      return 'Report';
    case 3:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

class MainLayout extends StatelessWidget {
  MainLayout({super.key, required this.body, required this.menuIndex});
  final Widget body;
  final int menuIndex;
  final _key = GlobalKey<ScaffoldState>();

  // @override
  // void initState(){
  //   _menuIndex = menuIndex;
  // }

  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    _controller.selectIndex(menuIndex);
    return SafeArea(
        child: Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: canvasColor,
                    title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            body: Container(
                color: Colors.blue,
                margin: const EdgeInsets.all(15.0),
                child: Row(children: [
                  if (!isSmallScreen) SidebarMenu(controller: _controller),
                  Expanded(
                      child: Container(
                          color: const Color.fromARGB(255, 114, 180, 95),
                          child: Align(
                              alignment: Alignment.topLeft, child: body))),
                ]))));
    // child: Align(alignment: Alignment.topLeft, child: body))));
  }
}

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    // final user = Get.put(Usercontroller());
    // String url = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    var url = ModalRoute.of(context)?.settings.name;
    debugPrint("---------- Current Path -----------");
    debugPrint(url.toString());
    var r = ModalRoute.of(context);
    debugPrint((r?.settings.name));

    // debugPrint(url.contains("pos").toString());
    debugPrint("---------- -----------");
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Text('Header');
        // return Obx(
        //   () {
        //     return SizedBox(
        //         height: 100,
        //         child: Padding(
        //             padding: EdgeInsets.all(16.0),
        //             child: user.username.value != null
        //                 ? Text(user.username.value,
        //                     style: TextStyle(color: Colors.white))
        //                 : Text('User', style: TextStyle(color: Colors.white))));
        //     // child: Image.asset('assets/images/avatar.png'),
        //   },
        // );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'POS',
          // selectable: !url.contains("/pos"), //bool
          selectable: url != "/pos", //bool
          onTap: () {
            // if (url.contains("/pos")) return null;
            if (url == "/pos") return null;
            Get.toNamed('/pos');
            // context.go('/pos');
          },
        ),

        SidebarXItem(
          icon: Icons.settings,
          label: 'Manufacture',
          selectable: url != "/manufacture", //bool
          onTap: () {
            if (url == "/manufacture") return null;
            // context.go('/manufacture');
            Get.toNamed('/manufacture');
          },
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Report',
          selectable: url != "/report", //bool
          onTap: () {
            if (url == "/report") return null;
            // context.go('/report');
            Get.toNamed('/report');
          },
        ),

        SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
          selectable: url != "/settings", //bool
          onTap: () {
            if (url == "/setting") return null;
            // context.go('/setting');
            Get.toNamed('/setting');
          },
        ),
        // const SidebarXItem(
        //   icon: Icons.search,
        //   label: 'Search',
        // ),
        // const SidebarXItem(
        //   icon: Icons.people,
        //   label: 'People',
        // ),

        // onTap: () => debugPrint('Favorite'),
      ],
    );
  }
}
