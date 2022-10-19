import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:theharmony/constants/colors.dart';

class ItemDateStatus extends StatelessWidget {
  ItemDateStatus({Key? key}) : super(key: key);

  final DateTime now = DateTime.now();
  List<int> date = List.filled(7, 0);

  @override
  Widget build(BuildContext context) {
    Map<String, int> day = {
      'Mon': date[0],
      'Tue': date[1],
      'Wed': date[2],
      'Thu': date[3],
      'Fri': date[4],
      'Sat': date[5],
      'Sun': date[6],
    };
    // DateTime lastDayOfPrevMonth = DateTime(now. year, now. month , 0);
    // DateTime lastDayOfCurrMonth = DateTime(now. year, now. month + 1, 0);
    int todayDate = now.day;
    String todayDay = DateFormat.E().format(now).toString();
    print(todayDate);

    day[todayDay] = todayDate;

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Item(day: 'Mon', date: 17,today:todayDate, status: 1, constraints: constraints),
              Item(day: 'Tue', date: 18,today:todayDate, status: 1, constraints: constraints),
              Item(day: 'Wed', date: 19,today:todayDate, status: 1, constraints: constraints),
              Item(day: 'Thu', date: 20,today:todayDate, status: 1, constraints: constraints),
              Item(day: 'Fri', date: 21,today:todayDate, status: 1, constraints: constraints),
              Item(day: 'Sat', date: 22,today:todayDate, status: 1, constraints: constraints),
              Item(day: 'Sun', date: 23,today:todayDate, status: 1, constraints: constraints),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon(constraints,AppColors.PRIMARY_COLOR,'Delivered'),
              icon(constraints,Colors.blueGrey,'Upcoming'),
              icon(constraints,Colors.yellow,'Vacation'),
              icon(constraints,Colors.red,'On Hold'),
            ],
          )
        ],
      );
    });
  }

  Row icon(BoxConstraints constraints, Color color, String text){
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              shape:BoxShape.circle,
              color: color
          ),
        ),
        SizedBox(width: 5),
        Text(text,style: TextStyle(fontSize: 12.sp),),
      ],
    );
  }
  // Column item(String day,int date,int status,BoxConstraints constraints){
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Text(day),
  //       GestureDetector(
  //         onTap: (){
  //
  //         },
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12.0),
  //             border: Border.all(color:Colors.blue)
  //           ),
  //           child: Column(
  //             children: [
  //               Text(date.toString()),
  //               Container(height:2,width:constraints.maxWidth/10,color: Colors.blue)
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

class Item extends StatefulWidget {
  String day;
  int today;
  int date;
  int status;
  BoxConstraints constraints;
  Item(
      {required this.day,
        required this.today,
      required this.date,
      required this.status,
      required this.constraints,
      Key? key})
      : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int selectedDate = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.day),
        GestureDetector(
          onTap: () {
            // setState(() {
            // selectedDate = widget.date;
            // });
          },
          child: Container(
            height: 50,
            width: widget.constraints.maxWidth / 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: widget.date == widget.today || widget.date<widget.today? AppColors.PRIMARY_COLOR.withOpacity(0.2) :Colors.blueGrey.withOpacity(0.2),
                border: Border.all(
                  width: 1.5,
                    color:
                        widget.date == widget.today ? AppColors.PRIMARY_COLOR :Colors.transparent)),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(widget.date.toString(),style: TextStyle(fontWeight: FontWeight.w500),),
                Spacer(),
                Container(
                  height: 4,
                  width: widget.constraints.maxWidth / 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color:widget.date == widget.today || widget.date<widget.today? AppColors.PRIMARY_COLOR : Colors.blueGrey),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
