import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Recipe extends StatelessWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: double.infinity,
              child: Text(
                'showcase',
                style: TextStyle(fontSize: 20),
              ),
            )),
        Expanded(flex: 9, child: Container(child: MainListView()))
      ],
    );
  }
}

class MainListView extends StatelessWidget {
  const MainListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0, bottom: 0),
      children: [
        Container(
          height: 150,
          child: TopHorizontal(),
        ),
        RecipeBook(
          imageUrl: "images/penne-pasta-tomato-sauce.PNG",
          bookTitle: "penne pasta in deep",
          bookAuthor: "Larry page",
          recipesCount: 43,
        ),
        RecipeBook(
          imageUrl: "images/penne-pasta-tomato-sauce.PNG",
          bookTitle: "penne pasta part 2",
          bookAuthor: "mohsin AR",
          recipesCount: 10,
        ),
        RecipeBook(
          imageUrl: "images/penne-pasta-tomato-sauce.PNG",
          bookTitle: "penne pasta",
          bookAuthor: "mohsin AR",
          recipesCount: 35,
        ),
        RecipeBook(
          imageUrl: "images/penne-pasta-tomato-sauce.PNG",
          bookTitle: "penne pasta",
          bookAuthor: "mohsin AR",
          recipesCount: 35,
        ),
      ],
    );
  }
}

class TopHorizontal extends StatelessWidget {
  const TopHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Positioned(
                    child: RotatedBox(
                  quarterTurns: 90,
                  child: Image.asset("images/vegetable-border-1.png"),
                )),
                Positioned(
                  bottom: 0,
                  width: 300,
                  child: Image.asset("images/vegetable-border-1.png"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Row(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Savour: Salads"),
                            Text("for all seasons"),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Text("Discover more"),
                              decoration: BoxDecoration(
                                  border: BorderDirectional(
                                      bottom: BorderSide(color: Colors.black))),
                            ),
                          ]),
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          "images/book-cover.png",
                          width: 100,
                          height: 100,
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.all(10),
            height: 150,
            width: 300,
          );
        });
  }
}

class RecipeBook extends StatelessWidget {
  final String imageUrl;
  final String bookTitle;
  final String bookAuthor;
  final int? recipesCount;

  RecipeBook(
      {Key? key,
      required this.imageUrl,
      required this.bookTitle,
      required this.bookAuthor,
      this.recipesCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      margin: EdgeInsets.all(10),
      height: 150,
      child: Row(
        children: [
          Container(
            width: 190,
            margin: EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(this.imageUrl),
            ),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 4)
            ], borderRadius: BorderRadius.circular(20)),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.bookTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(this.bookAuthor),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '$recipesCount recipes',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
