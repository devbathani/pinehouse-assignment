import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinehouse_assignment/presentation/screen-1/widgets/custom_dropdown.dart';
import 'package:pinehouse_assignment/presentation/screen-1/widgets/custom_textfield.dart';
import 'package:pinehouse_assignment/providers/screen-1/screen1_provider.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Screen1Provider>(
      builder: (context, screen1State, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Screen 1"),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextdfield(
                    hintText: 'Name',
                    icon: Icons.person,
                    controller: screen1State.nameController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextdfield(
                    onChanged: (value) {
                      if (value.length <= 10) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.phone,
                    hintText: 'Phone number',
                    icon: Icons.phone,
                    controller: screen1State.phoneNumberController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextdfield(
                    keyboardType: TextInputType.number,
                    hintText: 'Age',
                    icon: Icons.numbers,
                    controller: screen1State.ageController,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomDropDown(
                    color: Colors.orange,
                    items: screen1State.department,
                    value: screen1State.selectedDepartment,
                    onchanged: (value) {
                      screen1State.setDepartment(value);
                    },
                    height: 55.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () {
                      screen1State.selectImageFromGallery();
                    },
                    child: Container(
                      height: 150.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: screen1State.image == null
                          ? Center(
                              child: Text(
                                "Add Image +",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 15.sp,
                                ),
                              ),
                            )
                          : Image.file(
                              screen1State.image!,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () async {
                      if (screen1State.nameController.text.isEmpty ||
                          screen1State.phoneNumberController.text.isEmpty ||
                          screen1State.ageController.text.isEmpty ||
                          screen1State.image == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Check the form!!!"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        await screen1State.uploadFormData();
                        if (screen1State.screen1state == Screen1State.succeed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Form Submitted"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 40.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: screen1State.screen1state == Screen1State.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Upload",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
