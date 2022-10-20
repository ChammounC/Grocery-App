import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/screens/productScreen/allProductsPage/productsListView.dart';

import '../../delegates/customSearchDelegate.dart';
import '../../provider/providers/cartItemCount.dart';
import '../miscScreens/mycart.dart';

class AllNutsProductsPage extends StatefulWidget {
  final List<String> itemList;
  final String title;
  const AllNutsProductsPage(
      {required this.itemList, required this.title, Key? key})
      : super(key: key);

  @override
  _AllNutsProductsPageState createState() => _AllNutsProductsPageState();
}

class _AllNutsProductsPageState extends State<AllNutsProductsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: widget.itemList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, String>> itemList = [
    {
      'productName': 'Cashew(White Wholes)',
      'price': '397',
      'weight': '200 gm',
      'imgUrl': 'assets/images/product2.png'
    },
    {
      'productName': 'Raisins',
      'price': '259',
      'weight': '100 gm',
      'imgUrl': 'assets/images/product1.png'
    },
    {
      'productName': 'Cashew(Scorched Wholes)',
      'price': '243',
      'weight': '250 gm',
      'imgUrl': 'assets/images/product2.png'
    },
    {
      'productName': 'Cashew(Dessert Pieces)',
      'price': '415',
      'weight': '300 gm',
      'imgUrl': 'assets/images/product2.png'
    },
    {
      'productName': 'Cashew(Mixed Wholes)',
      'price': '397',
      'weight': '200 gm',
      'imgUrl': 'assets/images/product1.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.sp,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: AppColors.PRIMARY_COLOR),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
              onTap: () {
                Provider.of<CartItem>(context, listen: false).reset();
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios,
                  color: AppColors.PRIMARY_COLOR)),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: widget.itemList[0].toString()),
            Tab(text: widget.itemList[1].toString()),
            Tab(text: widget.itemList[2].toString()),
            Tab(text: widget.itemList[3].toString()),
            Tab(text: widget.itemList[4].toString()),
            Tab(text: widget.itemList[5].toString()),
            Tab(text: widget.itemList[6].toString()),
          ],
          labelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.black,
          indicatorColor: AppColors.PRIMARY_COLOR,
          labelColor: AppColors.PRIMARY_COLOR,
          isScrollable: true,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 0.05.sh),
            child: TabBarView(
              controller: _tabController,
              children: [
                ProductsListView(itemList: itemList),
                ProductsListView(itemList: itemList),
                ProductsListView(itemList: itemList),
                ProductsListView(itemList: itemList),
                ProductsListView(itemList: itemList),
                ProductsListView(itemList: itemList),
                ProductsListView(itemList: itemList),
              ],
            ),
          ),
          Provider.of<CartItem>(context).cartEmpty?Container():Positioned(
            bottom:0.025.sh,
            left:0.2.sw,
            child: GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=> MyCart())),
              child: Container(
                width:0.6.sw,
                height: 0.05.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: AppColors.PRIMARY_COLOR.withOpacity(0.2),
                  border: Border.all(
                    color: AppColors.PRIMARY_COLOR
                  )
                ),
                child: Center(child: Text('Go to Cart',style: TextStyle(color: AppColors.PRIMARY_COLOR,fontSize: 16.sp,fontWeight: FontWeight.w500),))
              ),
            ),
          )
        ],
      ),
    );
  }
}
