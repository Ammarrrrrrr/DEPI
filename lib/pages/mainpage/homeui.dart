import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/const/ui.dart';
import 'package:pharmacy_system/globalElements/controller/homeprovider.dart';
// import 'package:pharmacy_system/pages/mainpage/controller/homeprovider.dart';
import 'package:pharmacy_system/pages/mainpage/notifycationui.dart';
import 'package:pharmacy_system/services/store.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HomeNotifier>(context);
    final store = Provider.of<StoreService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(25),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Logo', style: Fonts().heading4(color: Coloring().n950)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Notifycation()),
                    );
                    // Action for "See All"
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 35,
                  ),
                ),
              ],
            ),

            Form(
              // key: xkey,
              child: TextFormField(
                // controller: _x,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Coloring().n500),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Coloring().p700),
                  ),

                  labelText: 'Find your favorite items',
                  labelStyle: TextStyle(color: Coloring().n500),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Action for the close icon
                    },
                    child: Icon(
                      Icons.close,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 21,
                    ),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      // Action for the search icon
                    },
                    child: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 25,
                    ),
                  ),
                  filled: true,
                  fillColor: Coloring().n50,
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // if (!emailRegex.hasMatch(value)) {
                  //   return 'Please enter a valid email';
                  // }
                  return null;
                },
              ),
            ),

            Text('Categories', style: Fonts().heading4(color: Coloring().n950)),

            SizedBox(
              height: 100,
              width: double.infinity,

              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //physics: const ,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Coloring().p50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.medical_services_outlined, size: 30),
                      ),

                      Text(
                        'Vitamins',
                        style: Fonts().bodyXLargeRegular(
                          color: Coloring().n800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Coloring().p50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.person_outline_sharp, size: 30),
                      ),
                      Text(
                        'Personal',
                        style: Fonts().bodyXLargeRegular(
                          color: Coloring().n800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Coloring().p50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.child_friendly_outlined, size: 30),
                      ),
                      Text(
                        'Baby',
                        style: Fonts().bodyXLargeRegular(
                          color: Coloring().n800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Coloring().p50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.medical_information_outlined,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Devices',
                        style: Fonts().bodyXLargeRegular(
                          color: Coloring().n800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Coloring().p50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.face_retouching_natural_outlined,
                          size: 25,
                        ),
                      ),
                      Text(
                        'Beauty',
                        style: Fonts().bodyXLargeRegular(
                          color: Coloring().n800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text('Hot Deals', style: Fonts().heading5(color: Coloring().n950)),
            store.productList.isEmpty? 
            Text("no products"):
            SizedBox(
              //height: double.infinity,
              //width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: 4,
                physics: ScrollPhysics(
                  parent: BouncingScrollPhysics(
                    parent: FixedExtentScrollPhysics(),
                  ),
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //width: 160,
                      //height: 280,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          // Image.asset(
                          //   'assets/images/grid1.png',
                          //   //width: 270,
                          //   //height: 270,
                          //   //scale: .3,
                          //   //fit: BoxFit.cover,
                          // ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(
                              Icons.favorite_border,
                              // color: const Color(0xFFFA3636),
                              size: 21,
                            ),
                          ),

                          Positioned(
                            bottom: 25,
                            left: 0,
                            child: Text(
                              'Nike Fuel Pack',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Text(
                              '\$32.00',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
