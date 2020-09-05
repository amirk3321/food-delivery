import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/repository/repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categoryItems = FakeRepository.categoryItems;
  final popularItems = FakeRepository.popularItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _headerWidget(),
          _bodyWidget(),
        ],
      ),
    );
  }

  Widget _headerWidget() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, top: 30, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.person_outline),
              Container(
                height: 85,
                width: 85,
                child: Image.asset("assets/logo.png"),
              ),
              Icon(Icons.favorite_border),
            ],
          ),
        ),
        Container(
          child: Image.asset("assets/cover.png"),
        )
      ],
    );
  }

  Widget _bodyWidget() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 230,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            _searchWidget(),
            SizedBox(height: 10,),
            _categoryWidget(),
            _popularWidget(),
          ],
        ),
      ),
    );
  }

  Widget _searchWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.sort)),
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8,),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: categoryItems.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        child: Image.asset(categoryItems[index].image),
                      ),
                      Text(categoryItems[index].title)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _popularWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Dishes",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8,),
          Container(
            height: 115,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: popularItems.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      _bottomSheet(image: popularItems[index].image,title: popularItems[index].title,rating: popularItems[index].rating.toDouble());
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      height: 110,
                      width: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              popularItems[index].image, fit: BoxFit.cover,),
                          ),
                          Text(popularItems[index].title,
                            style: TextStyle(fontSize: 12),),
                          RatingBar(
                            initialRating: popularItems[index].rating
                                .toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 18,
                            itemBuilder: (context, _) =>
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepOrange,
                                ),
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            onRatingUpdate: (double value) {},
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _bottomSheet({String image,String title,double rating}) {
    showModalBottomSheet(backgroundColor: Colors.transparent,context: context, builder: (builder) {
      return Container(
        height: 400,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 180,
              child: Stack(
                children: [
                  Align(alignment: Alignment.center,child: Image.asset("assets/food.png",fit: BoxFit.cover,)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.favorite_border),
                  )
                ],
              ),
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(fontSize: 18),),
                Text("\$31.00",style: TextStyle(color: Colors.deepOrange),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                RatingBar(
                  initialRating: rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 18,
                  itemBuilder: (context, _) =>
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.deepOrange,
                      ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  onRatingUpdate: (double value) {},
                ),
                Text("90 Rating"),
              ],
            ),
            Text("About $title",style: TextStyle(fontSize: 16),),
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took ",textAlign: TextAlign.start,),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Add To Order",style: TextStyle(fontSize: 18,color: Colors.white),),
              ),
            ),
          ],
        ),
      );
    });
  }
}
