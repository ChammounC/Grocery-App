import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/delegates/customSearchDelegate.dart';
import 'package:theharmony/screens/homeScreen.dart';
import 'package:theharmony/screens/productScreen/productsPage.dart';
import 'package:theharmony/screens/productScreen/mySubscriptionsPage.dart';

import '../widgets/customCard.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          width: 0.95.sw,
          height: 45.h,
          padding: EdgeInsets.only(top: 12),
          child: TextField(
            onTap: ()=>showSearch(context: context, delegate: CustomSearchDelegate()),
            readOnly: true,
            autofocus: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: TextStyle(fontStyle: FontStyle.italic,color:Colors.grey.withOpacity(0.8) ),
              contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        bottom:PreferredSize(
          preferredSize: Size.fromHeight(0.06.sh),
          child: Align(
            alignment:Alignment(-1,0),
            child: Container(
              width:0.75.sw,
              height: 0.05.sh,
              child: TabBar(
                labelStyle: TextStyle(fontSize:12.sp,fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black,
                labelColor: AppColors.PRIMARY_COLOR,
                tabs: [
                  Tab(
                    text: 'Products',
                  ),
                  Tab(
                    text: 'My Subscriptions',
                  )
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.PRIMARY_COLOR,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        children: [
          ProductsPage(),
          MySubscriptions()
        ],
        controller: _tabController,
      ),
      // SingleChildScrollView(
      //   physics: BouncingScrollPhysics(),
      //     child:Padding(
      //       padding: EdgeInsets.only(bottom:Constants.BODY_BOTTOM_PADDING),
      //       child: Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             // Container(
      //             //   width: 0.95.sw,
      //             //   height: 45.h,
      //             //   padding: EdgeInsets.only(top: 12),
      //             //   child: TextField(
      //             //     onTap: ()=>showSearch(context: context, delegate: CustomSearchDelegate()),
      //             //     readOnly: true,
      //             //     autofocus: false,
      //             //     decoration: InputDecoration(
      //             //       filled: true,
      //             //       fillColor: Colors.white,
      //             //       hintText: 'Search',
      //             //       hintStyle: TextStyle(fontStyle: FontStyle.italic,color:Colors.grey.withOpacity(0.8) ),
      //             //       contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
      //             //       focusedBorder: OutlineInputBorder(
      //             //         borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
      //             //         borderRadius: BorderRadius.circular(12),
      //             //       ),
      //             //       enabledBorder: OutlineInputBorder(
      //             //         borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
      //             //         borderRadius: BorderRadius.circular(12),
      //             //       ),
      //             //     ),
      //             //   ),
      //             // ),
      //             // Align(
      //             //   alignment:Alignment(-1,0),
      //             //   child: Container(
      //             //     width:0.75.sw,
      //             //     height: 0.05.sh,
      //             //     child: TabBar(
      //             //       labelStyle: TextStyle(fontSize:12.sp,fontWeight: FontWeight.bold),
      //             //       unselectedLabelColor: Colors.black,
      //             //       labelColor: AppColors.PRIMARY_COLOR,
      //             //       tabs: [
      //             //         Tab(
      //             //           text: 'Products',
      //             //         ),
      //             //         Tab(
      //             //           text: 'My Subscriptions',
      //             //         )
      //             //       ],
      //             //       controller: _tabController,
      //             //       indicatorSize: TabBarIndicatorSize.tab,
      //             //       indicatorColor: AppColors.PRIMARY_COLOR,
      //             //     ),
      //             //   ),
      //             // ),
      //             // SizedBox(
      //             //   height: 1.sh,
      //             //   child: TabBarView(
      //             //     children: [
      //             //       ProductsPage(),
      //             //       MySubscriptions()
      //             //     ],
      //             //     controller: _tabController,
      //             //   ),
      //             // ),
      //           ],
      //         ),
      //       ),
      //     ),
      // ),
    );
  }
}
