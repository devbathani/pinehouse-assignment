import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinehouse_assignment/repository/screen-1-repo/list_entity.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key, required this.listEntity});
  final ListEntity listEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Screen 3"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(listEntity.imgUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    listEntity.name,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Age : ${listEntity.age}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Phone number : ${listEntity.phoneNumber}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Department : ${listEntity.department}",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
