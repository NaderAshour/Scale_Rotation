import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget  {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with  SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller=AnimationController(duration: Duration(seconds: 2),vsync: this);
    animation= Tween(begin: 0.0,end: 2.0).animate(controller)..addStatusListener((status) { })..addListener(() {setState(() {

    });});
    controller.forward();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if( animation.isCompleted){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen()
      ));
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );

  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('screen 2'),
        ),
      ),
    );
  }
}


