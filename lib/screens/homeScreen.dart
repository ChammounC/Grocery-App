import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/widgets/customCard.dart';

import '../delegates/customSearchDelegate.dart';
import '../widgets/balanceCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      'assets/banner1.png',
      'assets/banner2.png',
      'assets/banner3.png'
    ];
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.sp,
          elevation: 0,
          title:
              SizedBox(height: 0.03.sh, child: Image.asset('assets/logo.png')),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                //     searchTerms: [
                //   "Cashew",
                //   "Pistachio",
                //   "Almonds",
                //   "Dried Fruits",
                //   "Seeds",
                //   "Raisins",
                //   "Milk",
                //   "Paneer"
                // ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                margin: const EdgeInsets.only(right: 8.0),
                child: BalanceCard()),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom:70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.sm),
                    height: 0.24.sh,
                    width: 0.95.sw,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                        ),
                        items: imgList
                            .map(
                              (item) => Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(item, fit: BoxFit.cover),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.02.sh),

                  // Most Popular Products Section

                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Popular Products',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                          Text(
                            'view all >',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: AppColors.PRIMARY_COLOR),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.sp),
                    height: 0.48.sh,
                    width: 0.95.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue.withOpacity(0.03),
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              CustomCard(
                                  imageUrl: 'assets/product1.png',
                                  price: '315',
                                  name: 'Cashew'),
                              CustomCard(
                                  imageUrl: 'assets/product1.png',
                                  price: '390',
                                  name: 'Pistachio'),
                            ],
                          ),
                          Column(
                            children: const [
                              CustomCard(
                                  imageUrl: 'assets/product1.png',
                                  price: '360',
                                  name: 'Almonds'),
                              CustomCard(
                                  imageUrl: 'assets/product1.png',
                                  price: '160',
                                  name: 'Raisins'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  // Shop By Category Section

                  Align(
                    alignment: Alignment(-0.95, 0),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        child: Text(
                          'Shop By Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.sp),
                    height: 0.15.sh,
                    width: 0.95.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue.withOpacity(0.03),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 0.23.sw,
                                  width: 0.23.sw,
                                  child: Image.asset('assets/dairy.png')),
                            ),
                            Text(
                              'Dairy Products',
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(width: 0.07.sw),
                        Column(
                          children: [
                            ClipRRect(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 0.23.sw,
                                  width: 0.23.sw,
                                  child: Image.asset('assets/nuts.png')),
                            ),
                            Text(
                              'Nuts & Snacks',
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(width: 0.07.sw),
                        Column(
                          children: [
                            ClipRRect(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  height: 0.23.sw,
                                  width: 0.23.sw,
                                  child: Image.asset('assets/special.png')),
                            ),
                            Text(
                              'theHarmony',
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Special',
                              style: TextStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  // Referal Section

                  Align(
                    alignment: Alignment(-0.95, 0),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        child: Text(
                          'Refer your family & friends',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        )),
                  ),
                  SizedBox(
                    height: 0.25.sh,
                    width: 0.95.sw,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'assets/referal.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
