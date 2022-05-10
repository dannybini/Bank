import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/pages/main_page.dart';
import 'package:untitled/widgets/gradient_button.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

// whenever your initialization is completed, remove the splash screen:

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    String isIntroShown = box.read('IsIntroShown').toString();
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isIntroShown == 'False'
          ? const MyHomePage(title: 'Flutter Demo Home Page')
          : const Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> pages = [
    Column(
      children: const [
        Icon(
          Icons.person,
          size: 200,
          color: Colors.blueAccent,
        ),
        SizedBox(height: 20),
        Text(
          'Online Payment',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in nulla at elit vestibulum euismod. Pellentesque tempor, tellus suscipit ullamcorper finibus, eros leo eleifend dolor, non placerat enim ligula at tortor. Vestibulum ut gravida libero, ut pharetra nisl. Phasellus dignissim vulputate augue, id volutpat sem tristique nec. Nunc quis nunc posuere, ultricies ante sed, ultrices elit. Phasellus sed purus neque. Nulla facilisi.',
          style: TextStyle(fontSize: 14, wordSpacing: 2),
          softWrap: true,
        ),
      ],
    ),
    Column(
      children: const [
        Icon(
          Icons.abc,
          size: 200,
          color: Colors.blueAccent,
        ),
        SizedBox(height: 20),
        Text(
          'Quick Transfer',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in nulla at elit vestibulum euismod. Pellentesque tempor, tellus suscipit ullamcorper finibus, eros leo eleifend dolor, non placerat enim ligula at tortor. Vestibulum ut gravida libero, ut pharetra nisl. Phasellus dignissim vulputate augue, id volutpat sem tristique nec. Nunc quis nunc posuere, ultricies ante sed, ultrices elit. Phasellus sed purus neque. Nulla facilisi.',
          style: TextStyle(fontSize: 14, wordSpacing: 2),
          softWrap: true,
        ),
      ],
    ),
    Column(
      children: const [
        Icon(
          Icons.credit_card,
          size: 200,
          color: Colors.blueAccent,
        ),
        SizedBox(height: 20),
        Text(
          'Saving Online',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in nulla at elit vestibulum euismod. Pellentesque tempor, tellus suscipit ullamcorper finibus, eros leo eleifend dolor, non placerat enim ligula at tortor. Vestibulum ut gravida libero, ut pharetra nisl. Phasellus dignissim vulputate augue, id volutpat sem tristique nec. Nunc quis nunc posuere, ultricies ante sed, ultrices elit. Phasellus sed purus neque. Nulla facilisi.',
          style: TextStyle(fontSize: 14, wordSpacing: 2),
          softWrap: true,
        ),
      ],
    ),
  ];
  PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < pages.length; i++) {
      list.add(Icon(Icons.circle,
          size: 12, color: i == selectedIndex ? Colors.black : Colors.grey));
    }

    var size = MediaQuery.of(context).size;
    GetStorage box = GetStorage();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: size.height * .1),
              SizedBox(
                height: size.height * .6,
                child: Center(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    children: pages,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: size.width * .4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: list,
                ),
              ),
              const SizedBox(height: 20),
              GradientButton(
                  fun: () {
                    if (selectedIndex == pages.length - 1) {
                      box.write('IsIntroShown', 'true').toString();
                      Get.to(() => const Login());
                    } else {
                      pageController.animateToPage(selectedIndex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    }
                  },
                  text: "Get Started"),
            ],
          ),
        ),
      ),
    );
  }
}
