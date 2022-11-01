import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/constants/constants.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/models/getAllProductModel.dart';
import 'package:theharmony/models/getCategoriesModel.dart';
import 'package:theharmony/models/getSubCategoriesModel.dart';
import 'package:theharmony/models/otherModels.dart';
import 'package:theharmony/screens/productScreen/allNutsProductsPage.dart';

import 'allDairyProductsPage.dart';
import 'allTeaProductsPage.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _isLoading = false;

  List<CategoryData> categoryList = [];
  List<List<SubCategoryData>> subCategoryList = [];
  List<AllProductData> allProductList = [];

  @override
  void initState() {
    // TODO: implement initState
    _categoryApi();
    //call product api here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      'assets/images/banner1.png',
      'assets/images/banner2.png',
      'assets/images/banner3.png'
    ];
    return categoryList.isEmpty && subCategoryList.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              String names = '';
              List<String> namesList = [];
              List<int> sIdList = [];
              //for(int i = 0 ; i < subCategoryList.length ; i++ ){
              for (int j = 0; j < subCategoryList[index].length; j++) {
                sIdList.add(subCategoryList[index][j].id);

                namesList.add(subCategoryList[index][j].name);

                names = names + subCategoryList[index][j].name.toString();
                if (j != subCategoryList[index].length - 1) {
                  names = '$names, ';
                }
              }
              //}
              print('area : $index');
              print('printing names : xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n');
              print(names);
              print(
                  'printing names list : xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n');
              print(namesList);
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.r,
                ),
                child: card(
                    'assets/images/nuts1.jpg',
                    categoryList[index].name,
                    categoryList[index].noOfProducts.toString(),
                    names,
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllNutsProductsPage(
                                  categoryId: categoryList[index].id,
                                  subCategoryIdList: sIdList,
                                  allProductList: allProductList,
                                  itemList: namesList,
                                  // [
                                  //   'Cashews',
                                  //   'Pistachio',
                                  //   'Peanuts',
                                  //   'Almonds',
                                  //   'Raisins',
                                  //   'Dry Fruits',
                                  //   'Seeds'
                                  // ],
                                  title: categoryList[index].name,
                                )))),
              );
            });
    // SingleChildScrollView(
    // physics:const BouncingScrollPhysics(),
    //     child:
    //
    //     Column(
    //       children: [
    //         card(
    //             'assets/images/nuts1.jpg',
    //             'Nuts & Snacks',
    //             '8',
    //             'Almonds (Roasted), Almonds (Dried), Pistachio, Cashew (Roasted), Cashew (Dried), Raisins, Dry Fruits, Seeds',
    //             () => Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => const AllNutsProductsPage(
    //                           itemList: [
    //                             'Almonds ( Roasted )',
    //                             'Pistachio',
    //                             'Cashew ( Roasted )',
    //                             'Cashew ( Dried )',
    //                             'Raisins',
    //                             'Dry Fruits',
    //                             'Seeds'
    //                           ],
    //                           title: 'Nuts & Snacks',
    //                         )))),
    //         card(
    //             'assets/images/tea.jpg',
    //             'Corporate Gifting',
    //             '8',
    //             'Special Combo, Basic Combo, Almonds (Roasted), Pistachio, Cashew (Dried), Special Dry Fruits, Seeds',
    //                 () => Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => const AllTeaProductsPage(
    //                       itemList: [
    //                         'Black Tea',
    //                         'Green Tea',
    //                         'Oolong Tea',
    //                         'White Tea',
    //                         'Pu-erh. Tea',
    //                         'Yellow Tea',
    //                         'Herbal Tea',
    //                         'Yerba Mate & Guayusa'
    //                       ],
    //                       title: 'Tea Products',
    //                     )))),
    //         card(
    //             'assets/images/dairy1.jpg',
    //             'Dairy Products',
    //             '0',
    //             '',
    //                 () => false
    //                 //     Navigator.push(
    //                 // context,
    //                 // MaterialPageRoute(
    //                 //     builder: (context) => const AllDairyProductsPage(
    //                 //       itemList: [
    //                 //         'Milk',
    //                 //         'Eggs',
    //                 //         'Bread',
    //                 //         'Chemical Free Dals',
    //                 //         'theHarmony Specials',
    //                 //         'Paneer'
    //                 //       ],
    //                 //       title: 'Dairy Products',
    //                 //     )))
    //         ),
    //         SizedBox(height: 0.2.sh),
    //       ],
    //     ),
    //   );
  }

  Widget card(String img, String title, String total, String details,
      Function() onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        elevation: 2.5,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 0.9.sw,
            height: 0.32.sh,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.grey.withOpacity(0.3))),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        child: Image.asset(img, fit: BoxFit.cover),
                      )),
                  // child: Image.asset(img,fit: BoxFit.cover,))),
                ),
                Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                              Text('$total Products'),
                            ],
                          ),
                          details.isEmpty
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(details, style: TextStyle(fontSize: 14.sp))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _categoryApi() async {
    try {
      print('inside get major category api');
      setState(() {
        _isLoading = true;
      });
      var params = json.encode(
        {
          //"number": number
        },
      );
      var headers = {'Content-Type': 'application/json'};
      var response = await http.get(Uri.parse(categoryUrl), headers: headers);
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json["status code"].toString() == '200') {
          print('success.');

          var data = GetCategoriesModel.fromJson(json);
          print('1.1');
          // CategoryData data  = CategoryData.fromJson(json["data"]);
          categoryList = data.data;
          print('1.2');
          print(categoryList);
          for (int i = 0; i < categoryList.length; i++) {
            subCategoryList.add([]);
          }
          print('1.3');
          for (int i = 0; i < categoryList.length; i++) {
            int a = categoryList[i].id;
            _callSubCategory(a);
            print(categoryList[i].id);
          }

          _allProductApi();

          print('data categories fetched');

          //dataTransfer();

          setState(() {
            _isLoading = false;
          });

          FocusScopeNode().unfocus();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => RecieveOtp(userNumber: number,)
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something went wrong 1!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(backgroundColor: Colors.red,content: Text("Something went wrong 2!!")));
    }
  }

  _callSubCategory(int i) async {
    await _subCategoryApi(i);
  }

  _subCategoryApi(int i) async {
    try {
      print('inside sub-Category api');
      print(i);
      // var params = json.encode(
      //   {
      //     "number": number
      //   },
      //);
      // var headers = {'Content-Type': 'application/json'};
      // var response =
      // await http.get(Uri.parse(subCategoryUrl), headers: headers);

      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://welcome-to-the-harmony.herokuapp.com/api/products/sub-categories'));
      request.body = json.encode({"id": i});
      request.headers.addAll(headers);

      http.StreamedResponse response1 = await request.send();

      // if (kDebugMode) {
      //   print('printing sub categories response : \n '+response.body);
      // }
      var response = await response1.stream.bytesToString();

      if (response1.statusCode == 200) {
        var json = jsonDecode(response);
        if (json["status code"].toString() == '200') {
          print('success.');

          var data = GetSubCategoriesModel.fromJson(json);

          subCategoryList[i - 1] = data.data;

          print('data fetched');

          print(subCategoryList);
          setState(() {
            //_isLoading = false;
          });

          FocusScopeNode().unfocus();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => RecieveOtp(userNumber: number,)
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            //_isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          //_isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something went wrong 1 subcaetgories!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        //_isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Something went wrong 2 subcaetgories!!")));
    }
  }

  _allProductApi() async {
    try {
      print('inside all products api');
      // var params = json.encode(
      //   {
      //     "category_id": 1,
      //     "subcategory_id": 14,
      //   },
      // );
      var headers = {
        // 'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      var response =
          await http.get(Uri.parse(getAllProducts), headers: headers);
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json["status code"].toString() == '200') {
          print('success otp sent.');

          var data = AllProductModel.fromJson(json);

          allProductList = data.data;

          print('data  all products fetched');

          setState(() {
            //_isLoading = false;
          });

          FocusScopeNode().unfocus();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => RecieveOtp(userNumber: number,)
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(backgroundColor: Colors.green,content: Text(json["message"].toString())));
        } else {
          setState(() {
            //_isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(json["message"].toString())));
        }
      } else {
        setState(() {
          //_isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something went wrong 1!!")));
      }
    } catch (e) {
      print(e);
      setState(() {
        //_isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Something went wrong 2!!")));
    }
  }
}
