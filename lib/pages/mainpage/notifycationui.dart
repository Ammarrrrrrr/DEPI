import 'package:flutter/material.dart';
import 'package:pharmacy_system/const/colors.dart';
import 'package:pharmacy_system/const/ui.dart';
import 'package:pharmacy_system/pages/mainpage/controller/notyficationprovider.dart';
import 'package:provider/provider.dart';

class Notifycation extends StatelessWidget {
  const Notifycation({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Notyficationprovider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actionsPadding: EdgeInsets.all(10),
        title: Text(
          "Notifycation",
          style: Fonts().heading4(color: Coloring().n950),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined, size: 30),
            onPressed: () {
              // Action for notifications icon
            },
          ),
        ],
      ),
      body: pro.havenotyfication
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: pro.notynum,
                    itemBuilder: (context, index) {
                      return Container(
                        //width: 95,
                        //height: 25,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          // color: const Color(0xFFF4F4F4),
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                            bottom: BorderSide(color: Colors.grey), // Only bottom
                          ),
                        ),

                        child: ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: Icon(Icons.receipt_long_outlined),
                          title: Text(
                            'Top Up E-wallet Successfully!',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'You have top up your e-wallet.',
                            style: TextStyle(
                              color: Color.fromARGB(209, 96, 96, 96),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Coloring().n700,
                      size: 60,
                    ),
                    Text(
                      "You haven’t gotten any notifications yet!",
                      style: Fonts().heading4(color: Coloring().n950),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "We’ll alert you when something cool happens.",
                      style: Fonts().bodyLargeBold(color: Coloring().n700),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
