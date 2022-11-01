import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:theharmony/constants/colors.dart';
import 'package:theharmony/constants/urls.dart';
import 'package:theharmony/models/getAllProductModel.dart';
import 'package:theharmony/widgets/balanceCard.dart';
import 'package:video_player/video_player.dart';

import '../../constants/constants.dart';
import '../../provider/providers/cartItemCount.dart';
import '../../widgets/customButtons/minus.dart';
import '../../widgets/customButtons/plus.dart';
import '../../widgets/unorderedList.dart';
import '../miscScreens/mycart.dart';
import 'package:http/http.dart' as http;

class ProductDetailPage extends StatefulWidget {
  final AllProductData itemDetails;
  final int index;
  const ProductDetailPage(
      {required this.itemDetails, required this.index, Key? key})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  VideoPlayerController? playerController;

  int mediaLength = 3;

  int current = 0;

  List<String> detailMediaList = [
    'assets/images/product2.png',
    'assets/images/product1.png',
    'assets/images/cashew.mp4',
  ];

  // List<String> detailVideoList = [
  //   'assets/images/cashew.mp4',
  // ];

  void playVideo() {
    playerController = VideoPlayerController.asset('assets/images/cashew.mp4',
        videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true, allowBackgroundPlayback: true))
      ..setVolume(1.0)
      ..initialize().then((value) {
        playerController!.pause();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    playVideo();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.PRIMARY_COLOR,
              )),
        ),
        actions: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(right: 8.0),
              child: BalanceCard()),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(bottom: 0.1.sh),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.05.sh, horizontal: 0.1.sw),
                  margin: EdgeInsets.symmetric(horizontal: 0.02.sw),
                  width: 1.sw,
                  height: 0.7.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: AppColors.PRIMARY_COLOR.withOpacity(0.5),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                            itemCount: detailMediaList.length,
                            onPageChanged: (i) {
                              setState(() {
                                current = i;
                              });
                            },
                            itemBuilder: (context, index) {
                              print(detailMediaList[index]
                                  .toString()
                                  .split('.')[1]);

                              return detailMediaList[index]
                                          .toString()
                                          .split('.')[1] !=
                                      'mp4'
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.asset(
                                          detailMediaList[index].toString())
                                      //Image.asset(widget.itemDetails['imgUrl']!)
                                      )
                                  : Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                playerController!
                                                        .value.isPlaying
                                                    ? playerController!.pause()
                                                    : playerController!.play();
                                              });
                                            },
                                            child:
                                                VideoPlayer(playerController!)),
                                        playerController!.value.isPlaying
                                            ? Container()
                                            : Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      playerController!.play();
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.play_circle_fill,
                                                    color: Colors.black,
                                                    size: 40.r,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    );
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            //width: ,
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: detailMediaList.length,
                                itemBuilder: (_, index) => (current == index)
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.orange,
                                          size: 15,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 5),
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      )),
                          ),
                        ],
                      ),
                    ],
                  )
                  // ClipRRect(
                  //     borderRadius:BorderRadius.circular(12.0),child: Image.asset()
                  // //Image.asset(widget.itemDetails['imgUrl']!)
                  // ),
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemDetails.name,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 0.01.sh),
                    Text(
                      '200 gm',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 0.02.sh),
                    // Text(
                    //   'Regular Price',
                    //   style: TextStyle(
                    //       fontSize: 14.sp,
                    //       color: Colors.grey[500],
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Text(
                      '\u{20B9}${widget.itemDetails.amount} MRP',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(height: 0.02.sh),
                    // Text(
                    //   'Member Price (30% off)',
                    //   style: TextStyle(
                    //       fontSize: 14.sp,
                    //       color: Colors.grey[500],
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\u{20B9}' +
                                  ((widget.itemDetails.amount) * 0.2)
                                      .toString(),
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ' Our price',
                              style: TextStyle(
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationThickness: 1.5,
                                  color: Colors.black45,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Provider.of<CartItem>(context)
                                        .itemCount[widget.itemDetails.id] ==
                                    0 ||
                                Provider.of<CartItem>(context)
                                        .itemCount[widget.itemDetails.id] ==
                                    null
                            ? InkWell(
                                onTap: () async {
                                  Provider.of<CartItem>(context, listen: false)
                                      .increment(widget.itemDetails.id);
                                  try {
                                    var params = json.encode(
                                      {
                                        "user_id": mainUserId,
                                        "product_id": widget.itemDetails.id,
                                        "item_price": widget.itemDetails.amount,
                                        "item_quantity": 1,
                                        "discount": "20%"
                                      },
                                    );
                                    var headers = {
                                      'Authorization': 'Bearer $token',
                                      'Content-Type': 'application/json'
                                    };
                                    var response = await http.post(
                                        Uri.parse(addToCartUrl),
                                        body: params,
                                        headers: headers);
                                    if (response.statusCode == 200) {
                                      var json = jsonDecode(response.body);
                                      userCartId = json["cart_id"][0]["id"];
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                                "Something went wrong!!")));
                                  }
                                },
                                child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    width: 0.2.sw,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        color: AppColors.PRIMARY_COLOR),
                                    child: Center(
                                        child: Text(
                                      'Add',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    ))),
                              )
                            : Container(
                                padding: const EdgeInsets.all(6.0),
                                width: 0.2.sw,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                        color: AppColors.PRIMARY_COLOR)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MinusButton(
                                        index: widget.index,
                                        itemList: widget.itemDetails),
                                    SizedBox(
                                      width: 0.05.sw,
                                      child: Center(
                                        child: Text(
                                          '${Provider.of<CartItem>(context).itemCount[widget.itemDetails.id] ?? '0'}',
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ),
                                    ),
                                    PlusButton(
                                        index: widget.index,
                                        itemList: widget.itemDetails),
                                  ],
                                ),
                              ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SubscribeCard(),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 0.01.sh),
                    UnorderedList(const [
                      "This Diwali, opt for a healthier way to show your love and care to close ones.",
                      "Bring them the freshest natural treat with theHarmony Dry Fruits,",
                      "All Dry fruits are 100% Natural, Premium and Chemical free that are delivered to you with minimal processing.",
                      "No artificial flavours or synthetic colours added.",
                      "We deliver the milk under the best cold chain right up to your doorstep."
                    ]),
                  ],
                ),
              ),
              Provider.of<CartItem>(context).cartEmpty
                  ? Container()
                  : GestureDetector(
                      onTap: () => Navigator.push(
                          context, MaterialPageRoute(builder: (_) => MyCart())),
                      child: Center(
                        child: Container(
                            width: 0.6.sw,
                            height: 0.05.sh,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: AppColors.PRIMARY_COLOR.withOpacity(0.2),
                                border:
                                    Border.all(color: AppColors.PRIMARY_COLOR)),
                            child: Center(
                                child: Text(
                              'Go to Cart',
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ))),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  SubscribeCard() {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Color(0xfff7eee6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Select your plan type',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'Daily',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'One Time',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'Alternate',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.brown.withOpacity(0.2),
                    border: Border.all(color: Colors.brown, width: 1)),
                child: Text(
                  'Custom',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _addToCartApi() async {
    try {
      print('inside add to cart api');
      setState(() {
        //_isLoading = true;
      });
      var params = json.encode(
        {},
      );
      var headers = {'Content-Type': 'application/json'};
      var response = await http.post(Uri.parse(addToCartUrl),
          body: params, headers: headers);
      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json["status code"].toString() == '200') {
          print('success.');

          print('data fetched');

          setState(() {
            //_isLoading = false;
          });

          FocusScopeNode().unfocus();
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
