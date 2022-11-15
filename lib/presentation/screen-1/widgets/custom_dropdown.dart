import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final List<String>? items;
  final dynamic value;
  final Color color;
  final Function(String?)? onchanged;
  const CustomDropDown({
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.items,
    this.value,
    this.onchanged,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.orange),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Transform.rotate(
            angle: -math.pi / 2,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 15.w,
              color: Colors.orange,
            ),
          ),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          items: items!.map((String caste) {
            return DropdownMenuItem<String>(
              value: caste,
              child: Text(
                caste,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
          value: value,
          onChanged: onchanged!,
        ),
      ),
    );
  }
}
