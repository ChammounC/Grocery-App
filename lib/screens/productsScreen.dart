import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/delegates/customSearchDelegate.dart';
import 'package:theharmony/models/getAllProductModel.dart';
import 'package:theharmony/models/getCategoriesModel.dart';
import 'package:theharmony/models/getSubCategoriesModel.dart';
import 'package:theharmony/models/otherModels.dart';
import 'package:theharmony/screens/homeScreen.dart';
import 'package:theharmony/screens/productScreen/productsPage.dart';
import 'package:theharmony/screens/productScreen/mySubscriptionsPage.dart';

import '../widgets/customCard.dart';

import 'package:http/http.dart' as http;


class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  List<AllCategoryDetailModel> categoryDetails = [];

  List<CategoryData> categoryList = [];
  List<List<SubCategoryData>> subCategoryList = [];
  List<AllProductData> allProductList = [];

  bool isLoading = false;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);

    //_categoryApi();
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
        leadingWidth: 0,
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
              width:0.76.sw,
              height: 0.05.sh,
              child: TabBar(
                labelStyle: TextStyle(fontSize:14.sp,fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black,
                labelColor: AppColors.PRIMARY_COLOR,
                tabs: const [
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
      body:

      // Center(
      //   child: CircularProgressIndicator(),
      // )
      TabBarView(
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

  // _categoryApi() async {
  //   try {
  //     print('inside get major category api');
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     var params = json.encode(
  //       {
  //         //"number": number
  //       },
  //     );
  //     var headers = {'Content-Type': 'application/json'};
  //     var response =
  //     await http.get(Uri.parse(categoryUrl), headers: headers);
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     if (response.statusCode == 200) {
  //       var json = jsonDecode(response.body);
  //       if(json["status code"].toString() == '200'){
  //
  //         print('success.');
  //
  //         var data = GetCategoriesModel.fromJson(json);
  //         //CategoryData data  = CategoryData.fromJson(json["data"]);
  //         categoryList = data.data;
  //
  //         for( int i = 1 ; i <= 3 ; i++){
  //           _callSubCategory(i);
  //         }
  //
  //         _allProductApi();
  //
  //         print('data fetched');
  //
  //         dataTransfer();
  //
  //         setState(() {
  //           _isLoading = false;
  //         });
  //
  //         FocusScopeNode().unfocus();
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //       builder: (context) => RecieveOtp(userNumber: number,)
  //         //   ),
  //         // );
  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
  //       } else {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
  //       }
  //     } else {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 1!!")));
  //     }
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //     const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
  //   }
  // }
  //
  // _callSubCategory(int i) async {
  //   await _subCategoryApi(i);
  // }
  //
  // _subCategoryApi(i) async {
  //   try {
  //     print('inside sub-Category api');
  //     // var params = json.encode(
  //     //   {
  //     //     "number": number
  //     //   },
  //     //);
  //     var headers = {'Content-Type': 'application/json'};
  //     var response =
  //     await http.get(Uri.parse(subCategoryUrl + i.toString()), headers: headers);
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     if (response.statusCode == 200) {
  //       var json = jsonDecode(response.body);
  //       if(json["status code"].toString() == '200'){
  //
  //         print('success.');
  //
  //         var data = GetSubCategoriesModel.fromJson(json);
  //
  //         subCategoryList.add(data.data);
  //
  //         print('data fetched');
  //
  //         print(subCategoryList);
  //         setState(() {
  //           //_isLoading = false;
  //         });
  //
  //         FocusScopeNode().unfocus();
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //       builder: (context) => RecieveOtp(userNumber: number,)
  //         //   ),
  //         // );
  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
  //       } else {
  //         setState(() {
  //           //_isLoading = false;
  //         });
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
  //       }
  //     } else {
  //       setState(() {
  //         //_isLoading = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 1!!")));
  //     }
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       //_isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
  //   }
  // }
  //
  // _allProductApi() async {
  //   try {
  //     print('inside all products api');
  //     // var params = json.encode(
  //     //   {
  //     //     "number": number
  //     //   },
  //     // );
  //     var headers = {'Content-Type': 'application/json'};
  //     var response =
  //     await http.get(Uri.parse(getAllProducts), headers: headers);
  //     if (kDebugMode) {
  //       print(response.body);
  //     }
  //     if (response.statusCode == 200) {
  //       var json = jsonDecode(response.body);
  //       if(json["status code"].toString() == '200'){
  //
  //         print('success otp sent.');
  //
  //         var data = AllProductModel.fromJson(json);
  //
  //         allProductList = data.data;
  //
  //         print('data fetched');
  //
  //         setState(() {
  //           //_isLoading = false;
  //         });
  //
  //         FocusScopeNode().unfocus();
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //       builder: (context) => RecieveOtp(userNumber: number,)
  //         //   ),
  //         // );
  //         // ScaffoldMessenger.of(context).showSnackBar(
  //         //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
  //       } else {
  //         setState(() {
  //           //_isLoading = false;
  //         });
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(backgroundColor: Colors.red,content: Text(json["message"].toString())));
  //       }
  //     } else {
  //       setState(() {
  //         //_isLoading = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 1!!")));
  //     }
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       //_isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
  //   }
  // }
  //
  // dataTransfer(){
  //   List<List<String>> names = [];
  //
  //   List<List<SubCategoryDetailModel>> sC = [];
  //
  //   List<String> numProducts = ['47','24','0'];
  //
  //   for(int i = 0; i < categoryList.length ; i++){
  //     names.add([]);
  //     sC.add([]);
  //   }
  //
  //   for(int i = 0 ; i < subCategoryList.length ; i++ ){
  //     for(int j = 0 ; j < subCategoryList[i].length ; j++){
  //       if(subCategoryList[i][j].categoryId == 1){
  //         //names[0] = names[0] + subCategoryList[i][j].name ;
  //         names[0].add(subCategoryList[i][j].name);
  //       } else if(subCategoryList[i][j].categoryId == 2){
  //         //names[1] = names[1] + subCategoryList[i][j].name ;
  //         names[1].add(subCategoryList[i][j].name);
  //       } else if(subCategoryList[i][j].categoryId == 3){
  //         //names[2] = names[2] + subCategoryList[i][j].name ;
  //         names[2].add(subCategoryList[i][j].name);
  //       }
  //     }
  //   }
  //
  //   for(int i = 0 ; i < subCategoryList.length ; i++ ){
  //     for(int j = 0 ; j < subCategoryList[i].length ; j++ ){
  //       if(subCategoryList[i][j].categoryId == 1){
  //         sC[0].add(
  //             SubCategoryDetailModel(
  //                 name: subCategoryList[i][j].name,
  //                 mainCategoryId: subCategoryList[i][j].categoryId.toString(),
  //                 id: subCategoryList[i][j].id.toString(),
  //                 numberOfProductsSub: '0'
  //             )
  //         );
  //       } else if(subCategoryList[i][j].categoryId == 2){
  //         sC[1].add(
  //             SubCategoryDetailModel(
  //                 name: subCategoryList[i][j].name,
  //                 mainCategoryId: subCategoryList[i][j].categoryId.toString(),
  //                 id: subCategoryList[i][j].id.toString(),
  //                 numberOfProductsSub: '0'
  //             )
  //         );
  //       } else if(subCategoryList[i][j].categoryId == 3){
  //         sC[2].add(
  //             SubCategoryDetailModel(
  //                 name: subCategoryList[i][j].name,
  //                 mainCategoryId: subCategoryList[i][j].categoryId.toString(),
  //                 id: subCategoryList[i][j].id.toString(),
  //                 numberOfProductsSub: '0'
  //             )
  //         );
  //       }
  //     }
  //   }
  //
  //   for( int i  = 0 ; i < categoryList.length ; i ++ ){
  //     categoryDetails.add(
  //         AllCategoryDetailModel(
  //             name: categoryList[i].name,
  //             subCategoriesNames: names[i],
  //             subCategories: sC[i],
  //             numberOfProductsTotal: numProducts[i],
  //             categoryId: subCategoryList[i][0].categoryId.toString(),
  //             imgsrc: ''
  //         )
  //     );
  //   }
  // }
}

