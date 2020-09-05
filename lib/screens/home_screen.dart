import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/repository/repository.dart';
import 'package:lottie/lottie.dart';

import 'pages/home_page.dart';

class HomeScreen extends StatelessWidget {
  final _data = FakeRepository.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: _data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Container(
                  child: Lottie.asset(_data[index].image, repeat: false),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  _data[index].title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _data[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _data
                      .map((e) =>
                      Container(
                        height: 10,
                        width: index == _data.indexOf(e) ? 20 : 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == _data.indexOf(e)
                                ? Colors.deepOrange
                                : Colors.blueGrey),
                      ))
                      .toList(),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: index != 2
                        ? Container(
                      height: 50,
                      width: 50,
                      child: Lottie.asset("assets/next.json"),
                    ) : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Lottie.asset(
                              "assets/complete.json",
                              repeat: false,
                            ),),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                color: Colors.deepOrange,
                              ),
                              child: Text(
                                "Get started",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
