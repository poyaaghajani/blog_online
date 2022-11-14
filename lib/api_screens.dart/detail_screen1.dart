import 'package:blog_online/animations/left_to_right_fade.dart';
import 'package:blog_online/animations/up_to_down_fade.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String? title;
  String? explane;
  String? moreExplane;
  String? imageNumber;

  DetailScreen({
    Key? key,
    required this.title,
    required this.explane,
    required this.moreExplane,
    required this.imageNumber,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 340),
                  child: LeftToRight(
                    dely: 3,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              toolbarHeight: 40,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LeftToRight(
                      dely: 0.9,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 3),
                          Text(
                            widget.title!,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2),
                    LeftToRight(
                      dely: 1.4,
                      child: Text(
                        widget.explane!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                titlePadding: EdgeInsets.only(bottom: 20, left: 7),
                background: UpToDownFade(
                  dely: 0.4,
                  child: Image.asset(
                    widget.imageNumber!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              expandedHeight: 280,
            ),
          ];
        },
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                UpToDownFade(
                  dely: 1.7,
                  child: Container(
                    width: 90,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: UpToDownFade(
                    dely: 2.5,
                    child: Text(
                      widget.moreExplane!,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
