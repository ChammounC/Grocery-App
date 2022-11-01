import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:theharmony/models/getAllProductModel.dart';

import '../../constants/colors.dart';
import '../../widgets/itemDateStatus.dart';
import 'allProductsPage/productsListView.dart';

class MySubscriptions extends StatefulWidget {
  bool? fromHome;
   MySubscriptions({this.fromHome,Key? key}) : super(key: key);

  @override
  _MySubscriptionsState createState() => _MySubscriptionsState();
}

class _MySubscriptionsState extends State<MySubscriptions> {
  List<AllProductData> itemList=[
    // AllProductData(
    //     id: id,
    //     name: name,
    //     description: description,
    //     amount: amount,
    //     image: image,
    //     subcategoryId: subcategoryId,
    //     categoryId: categoryId
    // ),
    // {
    //   'productName':'Dry Fruits',
    //   'price' : '397',
    //   'weight' : '200 gm',
    //   'imgUrl' : 'assets/images/nuts.png'
    // },
    // {
    //   'productName':'Dry Fruits',
    //   'price' : '259',
    //   'weight' : '100 gm',
    //   'imgUrl' : 'assets/images/product1.png'
    // },
    // {
    //   'productName':'Dry Fruits',
    //   'price' : '243',
    //   'weight' : '250 gm',
    //   'imgUrl' : 'assets/images/special.png'
    // },
    // {
    //   'productName':'Special',
    //   'price' : '415',
    //   'weight' : '300 gm',
    //   'imgUrl' : 'assets/images/product1.png'
    // },
    // {
    //   'productName':'Nuts',
    //   'price' : '397',
    //   'weight' : '200 gm',
    //   'imgUrl' : 'assets/images/nuts.png'
    // },
    // {
    //   'productName':'Dry Fruits',
    //   'price' : '259',
    //   'weight' : '100 gm',
    //   'imgUrl' : 'assets/images/product1.png'
    // },
    // {
    //   'productName':'Dry Fruits',
    //   'price' : '243',
    //   'weight' : '250 gm',
    //   'imgUrl' : 'assets/images/special.png'
    // },
    // {
    //   'productName':'Special',
    //   'price' : '415',
    //   'weight' : '300 gm',
    //   'imgUrl' : 'assets/images/product1.png'
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.fromHome==null?null:AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child:const Icon(
                Icons.arrow_back_ios,
                color: AppColors.PRIMARY_COLOR,
              )),
        ),
        title: Text('My Subscriptions',style: TextStyle(color: AppColors.PRIMARY_COLOR),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   margin: EdgeInsets.only(top: 20.sm),
            //   height: 0.2.sh,
            //   width: 0.95.sw,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12.0),
            //       border: Border.all(color: Colors.grey.withOpacity(0.2))),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         DateFormat.MMMM().format(DateTime.now()).toString(),
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       ItemDateStatus(),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: widget.fromHome==true?0.6.sh:0.55.sh,
            //   width: 0.95.sw,
            //   child:ProductsListView(itemList: itemList,goToCustomize: true,),
            // )
            Center(
              child: Image.asset(
                'assets/images/empty.png',
                width: 0.7.sw,
                height: 0.75.sw,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
