import 'package:budget_tracker/json/daily_json.dart';
import 'package:budget_tracker/json/day_month.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 25, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dailt Transactions",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      Icon(AntDesign.search1)
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(days.length, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            activeDay = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 7,
                          child: Column(
                            children: [
                              Text(
                                days[index]['label'],
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: activeDay == index
                                        ? primary
                                        : grey.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: activeDay == index
                                          ? primary
                                          : black.withOpacity(0.1),
                                    )),
                                child: Center(
                                    child: Text(
                                  days[index]['day'],
                                  style: TextStyle(
                                      color: activeDay == index
                                          ? white
                                          : black.withOpacity(0.8),
                                      fontSize: 10,
                                      fontWeight: activeDay == index
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                )),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: List.generate(daily.length, (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 40) * 0.7,
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: grey.withOpacity(0.1),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Image.asset(daily[index]['icon']),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                width: (size.width - 90) * 0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      daily[index]['name'],
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      daily[index]['date'],
                                      style: TextStyle(
                                          color: black.withOpacity(0.5),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: (size.width - 40) * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                daily[index]['price'],
                                style: TextStyle(
                                    color: green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 45, top: 8, bottom: 12),
                      child: Divider(thickness: 0.8),
                    ),
                  ],
                );
              }),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 65,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      color: black.withOpacity(0.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                 Text(
                  "\$1700.00",
                  style: TextStyle(
                      color: black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
