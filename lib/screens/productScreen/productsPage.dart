import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theharmony/screens/productScreen/allNutsProductsPage.dart';

import 'allDairyProductsPage.dart';
import 'allTeaProductsPage.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      'assets/banner1.png',
      'assets/banner2.png',
      'assets/banner3.png'
    ];
    return SingleChildScrollView(
          child: Column(
            children: [
              card(
                  'assets/nuts1.jpg',
                  'Nuts & Snacks',
                  '47',
                  'Cashews, Pistachio, Peanuts, Almonds, Raisins, Dry Fruits, Seeds',
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllNutsProductsPage(
                                itemList: [
                                  'Cashews',
                                  'Pistachio',
                                  'Peanuts',
                                  'Almonds',
                                  'Raisins',
                                  'Dry Fruits',
                                  'Seeds'
                                ],
                                title: 'Nuts & Snacks',
                              )))),
              card(
                  'assets/dairy1.jpg',
                  'Dairy Products',
                  '158',
                  'Milk, Eggs, Bread, Chemical Free Dals, theHarmony Specials, Paneer',
                  () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllDairyProductsPage(
                                itemList: [
                                  'Milk',
                                  'Eggs',
                                  'Bread',
                                  'Chemical Free Dals',
                                  'theHarmony Specials',
                                  'Paneer'
                                ],
                                title: 'Dairy Products',
                              )))),
              card(
                  'assets/tea.jpg',
                  'Tea Products',
                  '67',
                  'Black Tea, Green Tea, Oolong Tea, White Tea, Pu-erh. Tea, Yellow Tea, Herbal Tea, Yerba Mate & Guayusa',
                      () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllTeaProductsPage(
                            itemList: [
                              'Black Tea',
                              'Green Tea',
                              'Oolong Tea',
                              'White Tea',
                              'Pu-erh. Tea',
                              'Yellow Tea',
                              'Herbal Tea',
                              'Yerba Mate & Guayusa'
                            ],
                            title: 'Tea Products',
                          )))),
            ],
          ),
        );
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
            height: 0.3.sh,
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
                                child:
                                    Image.asset(img, fit: BoxFit.cover),
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
                          Text(details)
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
}
