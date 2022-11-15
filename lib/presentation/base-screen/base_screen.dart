import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinehouse_assignment/providers/base-screen/base_screen_provider.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseScreenProvider>(
      builder: (context, baseState, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: SizedBox(
            
            height: 80.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      baseState.onItemTapped(0);
                    },
                    child: Container(
                      height: 35.h,
                      width: 135.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          "Screen 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      baseState.onItemTapped(1);
                    },
                    child: Container(
                      height: 35.h,
                      width: 135.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          "Screen 2",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: baseState.screens.elementAt(baseState.selectedIndex),
          ),
        );
      },
    );
  }
}
