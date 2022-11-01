// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:theharmony/models/getAllProductModel.dart';
//
// import '../constants/colors.dart';
// import '../provider/providers/cartItemCount.dart';
// import '../widgets/balanceCard.dart';
// import '../widgets/customButtons/minus.dart';
// import '../widgets/customButtons/plus.dart';
//
// class CustomizePlanPage extends StatefulWidget {
//   AllProductData details;
//   final int index;
//   CustomizePlanPage({required this.details, required this.index, Key? key})
//       : super(key: key);
//
//   @override
//   _CustomizePlanPageState createState() => _CustomizePlanPageState();
// }
//
// class _CustomizePlanPageState extends State<CustomizePlanPage> {
//   List<String> selectedDays = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: const Icon(
//                 Icons.arrow_back_ios,
//                 color: AppColors.PRIMARY_COLOR,
//               )),
//         ),
//         actions: [
//           Container(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               margin: const EdgeInsets.only(right: 8.0),
//               child: BalanceCard()),
//         ],
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               card(widget.details, widget.index),
//               SizedBox(height: 30),
//               Container(
//                 padding: EdgeInsets.all(12.0),
//                 height: 0.12.sh,
//                 width: 0.95.sw,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           blurRadius: 2.0,
//                           offset: Offset(0.5, 0))
//                     ]),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Select Days',
//                       style: TextStyle(
//                           fontSize: 16.sp, fontWeight: FontWeight.bold),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (selectedDays.contains('Sun')) {
//                                 selectedDays.remove('Sun');
//                               } else {
//                                 selectedDays.add('Sun');
//                               }
//                             });
//                           },
//                           child: Button(
//                             name: 'Sun',
//                             selectedDays: selectedDays,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (selectedDays.contains('Mon')) {
//                                 selectedDays.remove('Mon');
//                               } else {
//                                 selectedDays.add('Mon');
//                               }
//                             });
//                           },
//                           child: Button(
//                             name: 'Mon',
//                             selectedDays: selectedDays,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (selectedDays.contains('Tue')) {
//                                 selectedDays.remove('Tue');
//                               } else {
//                                 selectedDays.add('Tue');
//                               }
//                             });
//                           },
//                           child: Button(
//                             name: 'Tue',
//                             selectedDays: selectedDays,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (selectedDays.contains('Wed')) {
//                                 selectedDays.remove('Wed');
//                               } else {
//                                 selectedDays.add('Wed');
//                               }
//                             });
//                           },
//                           child: Button(
//                             name: 'Wed',
//                             selectedDays: selectedDays,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (selectedDays.contains('Thu')) {
//                                 selectedDays.remove('Thu');
//                               } else {
//                                 selectedDays.add('Thu');
//                               }
//                             });
//                           },
//                           child: Button(
//                             name: 'Thu',
//                             selectedDays: selectedDays,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (selectedDays.contains('Fri')) {
//                                 selectedDays.remove('Fri');
//                               } else {
//                                 selectedDays.add('Fri');
//                               }
//                             });
//                           },
//                           child: Button(
//                             name: 'Fri',
//                             selectedDays: selectedDays,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (selectedDays.contains('Sat')) {
//                                 selectedDays.remove('Sat');
//                               } else {
//                                 selectedDays.add('Sat');
//                               }
//                             });
//                           },
//                           child: Button(
//                             name: 'Sat',
//                             selectedDays: selectedDays,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 8.0),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.grey.withOpacity(0.2)),
//                     borderRadius: BorderRadius.circular(8.0),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           blurRadius: 2.0,
//                           offset: Offset(0.5, 0))
//                     ]),
//                 height: 0.07.sh * selectedDays.length,
//                 child: ListView.builder(
//                     itemCount: selectedDays.length,
//                     itemBuilder: (context, index) {
//                       print(selectedDays.length - 1 == index);
//                       return Container(
//                           padding: EdgeInsets.all(8.0),
//                           width: 0.95.sw,
//                           height: 0.07.sh,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: selectedDays.length == 1
//                                 ? BorderRadius.circular(8.0)
//                                 : index == 0
//                                     ? BorderRadius.only(
//                                         topLeft: Radius.circular(8.0),
//                                         topRight: Radius.circular(8.0))
//                                     : index == selectedDays.length - 1
//                                         ? BorderRadius.only(
//                                             bottomLeft: Radius.circular(8.0),
//                                             bottomRight: Radius.circular(8.0))
//                                         : null,
//                             border:
//                                 Border.all(color: Colors.grey.withOpacity(0.2)),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(selectedDays[index]),
//                               Container(
//                                   height: 0.04.sh,
//                                   width: 0.2.sw,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                       color: AppColors.PRIMARY_COLOR),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Text('-'),
//                                       Text('1'),
//                                       Text('+'),
//                                     ],
//                                   )),
//                             ],
//                           ));
//                     }),
//               ),
//               selectedDays.isEmpty?Container():Container(
//                 padding: EdgeInsets.all(12.0),
//                 height: 0.12.sh,
//                 width: 0.95.sw,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.grey,
//                           blurRadius: 2.0,
//                           offset: Offset(0.5, 0))
//                     ]),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Start Date',
//                       style: TextStyle(
//                           fontSize: 16.sp, fontWeight: FontWeight.bold),
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12),
//                       height:0.05.sh,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.withOpacity(0.5)),
//                           borderRadius: BorderRadius.circular(8.0),
//                           color: Colors.white),
//
//                       child:Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(DateFormat.yMMMEd('en_US').format(DateTime.now()).toString()),
//                           Icon(Icons.calendar_today_outlined),
//                         ],
//                       )
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget card(AllProductData details, int index) {
//     return Container(
//       padding: EdgeInsets.all(12.0),
//       height: 0.15.sh,
//       width: 0.95.sw,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12.0),
//           color: Colors.white,
//           border: Border.all(color: AppColors.PRIMARY_COLOR.withOpacity(0.2))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Flexible(flex: 3, child: Image.asset('')//widget.details.image)),
//           Container(
//               margin: EdgeInsets.symmetric(horizontal: 12.0),
//               child: VerticalDivider(width: 2)),
//           Flexible(
//             flex: 5,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(widget.details['productName']!,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.bold)),
//                   Text(widget.details['weight']!,
//                       style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
//                   SizedBox(height: 0.015.sh),
//                   Text(
//                     '\u{20B9} ${widget.details['price']}',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Button extends StatefulWidget {
//   final String name;
//   List<String> selectedDays;
//   Button({required this.name, required this.selectedDays, Key? key})
//       : super(key: key);
//
//   @override
//   _ButtonState createState() => _ButtonState();
// }
//
// class _ButtonState extends State<Button> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 0.11.sw,
//       width: 0.11.sw,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           border: Border.all(
//             color: Colors.grey.withOpacity(0.2),
//           ),
//           color: widget.selectedDays.contains(widget.name)
//               ? Colors.blueGrey.withOpacity(0.4)
//               : Colors.transparent),
//       child: Center(
//         child: Text(
//           widget.name,
//           style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }
// }
