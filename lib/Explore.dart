import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);
  int imageNum = 1;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backwardsCompatibility: false,
          title: Text(''),
          backgroundColor: Colors.white,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        alignment: Alignment.center,
                        child: Text(
                          "What to eat",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )),
                      Icon(Icons.filter_alt_outlined)
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 5),
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                  width: 0.5, color: Colors.black12))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              // Color(0xFFFFFFFF)
              imageNum = (imageNum >= 6) ? 1 : ++imageNum;
              int color = int.parse('0xFF' +
                  Random().nextInt(99999).toRadixString(16).padLeft(6, 'F'));
              return Container(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 10)
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/image-$imageNum.png",
                        width: 150,
                        height: 150,
                      ),
                      Text("Dish $index")
                    ],
                  ),
                ),
              );
            }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 0.0))
      ],
    );
  }
}
