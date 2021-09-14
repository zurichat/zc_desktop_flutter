import 'package:flutter/material.dart';

class ShortCuts{

  Widget contain({Widget? child,double h = 22, double w = 30}) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 30,
        minHeight: 20,
        maxWidth: w,
        maxHeight: h
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.grey.shade300
      ),
      child: child,
    );
  }

  Widget up() {
    return contain(
      child: Icon(Icons.arrow_drop_up, size: 20,color: Colors.grey,),
    );
  }

  Widget ctrl() {
    return contain(
      child: Center(child: Text('Ctrl',style: TextStyle(color: Colors.grey,fontSize: 10),)),
    );
  }

  Widget enter() {
    return contain(
      child: Center(child: Text('Enter',style: TextStyle(color: Colors.grey,fontSize: 10),)),
    );
  }

  Widget shift() {
    return contain(
      child: Center(child: Text('Shift',style: TextStyle(color: Colors.grey,fontSize: 8),)),
    );
  }

  Widget fKey() {
    return contain(
      child: Center(child: Text('F',style: TextStyle(color: Colors.grey,fontSize: 10),)),
    );
  }

  Widget kKey() {
    return contain(
      child: Center(child: Text('K',style: TextStyle(color: Colors.grey,fontSize: 10),)),
    );
  }

  Widget pageUp() {
    return contain(
      w: 40,
      child: Center(child: Text('Page up',style: TextStyle(color: Colors.grey,fontSize: 8),)),
    );
  }

  Widget pageDown() {
    return contain(
      w: 45,
      child: Center(child: Text('Page Down',style: TextStyle(color: Colors.grey,fontSize: 8),)),
    );
  }

  Widget home() {
    return contain(
      w: 40,
      child: Center(child: Text('Home',style: TextStyle(color: Colors.grey,fontSize: 8),)),
    );
  }

  Widget end() {
    return contain(
      w: 45,
      child: Center(child: Text('End',style: TextStyle(color: Colors.grey,fontSize: 7),)),
    );
  }
}