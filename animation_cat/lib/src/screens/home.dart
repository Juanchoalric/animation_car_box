import 'package:flutter/material.dart';

import '../widgets/cat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  Animation<double>catAnimation;
  AnimationController catController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    catAnimation = Tween(begin: 0.0, end: 100.0)
      .animate(
        CurvedAnimation(
          parent: catController,
          curve: Curves.easeIn,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
      ),
      body: GestureDetector(
        child: buildAnimation(),
        onTap: onTap,
      ),
      
      
    );
  }

  void onTap(){
    if (catController.status == AnimationStatus.completed){
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed){
      catController.forward();
    }
  }

  Widget buildAnimation() {
      return AnimatedBuilder(
        animation: catAnimation,
        builder: (BuildContext context, Widget child){
          return Container(
            child: child,
            margin: EdgeInsets.only(top: catAnimation.value),
          );
        },
        child: Cat(),
      );
  }
}
