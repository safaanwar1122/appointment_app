
import 'package:flutter/material.dart';

Widget customContainer({
  required double height,
required double width,
required Color color,
  required BorderRadius borderRadius,
  required Widget child,

}){
  return Container(
    height:  height,
    width: width,
  decoration: BoxDecoration(
    color: color,
    borderRadius: borderRadius
  ),
    child: child,
  );
}