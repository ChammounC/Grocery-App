import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  TextEditingController amountController = TextEditingController(text: '500');

  int initialAmount = 500;

  List<int> amountList = [
    100,200,500,1000,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff7eee6),
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new,size: 20.r, color: Colors.black,),
        ),
        title: Text('Payments',
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp,
              color: Colors.black),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
                width: 1.sw,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset('assets/images/wallet1.jpg',
                  fit: BoxFit.fitWidth,),
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Text('Recharge Wallet',
                    style: TextStyle(fontSize: 18.sp,color: Colors.black,
                        fontWeight: FontWeight.w400),),
                ],
              ),
              SizedBox(height: 0.01.sh,),
              Container(
                //height: 40.h,
                width: 0.9.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                    color: Colors.grey.shade400
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    SizedBox(width: 5.w,),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Text('₹',
                          style: TextStyle(fontSize: 20.sp,color: Colors.black,
                              fontWeight: FontWeight.w500),),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: TextField(
                          autofocus: false,
                          controller: amountController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 16.sp,color: Colors.black,
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              hintText: "Amount",
                              hintStyle: TextStyle(fontSize: 16.sp,color: Colors.black,
                              fontWeight: FontWeight.w500),

                              enabledBorder: InputBorder.none
                          ),
                          onChanged: (x){
                            setState(() {
                              if(amountController.text.isEmpty){
                                initialAmount = 0;
                              } else {
                                initialAmount = int.parse(amountController.text);
                              }
                            });
                            print('initial : $initialAmount');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 0.8.sw,
                    child: Center(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: amountList.length,
                          itemBuilder: (context,index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  initialAmount = initialAmount + amountList[index];
                                  amountController.text = initialAmount.toString();
                                });
                                print('ini am : $initialAmount');
                                print('cont : ${amountController.text}');
                              },
                              child: Container(
                                //width: 30.w,
                                margin: EdgeInsets.all(4.r),
                                padding: EdgeInsets.symmetric(horizontal : 4.r),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.shade400
                                    )
                                ),
                                child: Center(
                                  child: Text('+ ' + amountList[index].toString(),
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp,
                                        color: Colors.black),),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PhysicalModel(
                    color: Colors.white,
                    shadowColor: Colors.blue,
                    elevation: 8.r,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        width: 0.9.sw,
                        padding: EdgeInsets.symmetric(vertical: 12.r,horizontal: 10.r),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(2.r),
                            gradient:  LinearGradient(
                              colors: [
                                Color(0xff8c551c),
                                Color(0xff8c551c).withOpacity(0.7),
                              ],
                              begin: Alignment.centerLeft,
                              stops: [
                                0.2,
                                0.9
                              ],
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add Money',
                              style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                            //Icon(Icons.arrow_forward_ios,size: 20.r,),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
