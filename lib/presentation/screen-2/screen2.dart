import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinehouse_assignment/presentation/screen-3/screen3.dart';
import 'package:pinehouse_assignment/providers/screen-2/screen2_provider.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Provider.of<Screen2Provider>(context, listen: false).getFormData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Screen2Provider>(
      builder: (context, scrren2State, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text("Screen 2"),
          ),
          body: scrren2State.listEntity.isEmpty
              ? const Center(child: Text("No Data"))
              : SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        ...List.generate(
                          scrren2State.listEntity.length,
                          (index) {
                            final data = scrren2State.listEntity[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => Screen3(
                                      listEntity: data,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 80.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            data.imgUrl,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(
                                      data.name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
