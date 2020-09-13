import 'package:beautify/core/responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();

  static buildBottomComponent() {
    TextEditingController controller;
    return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 14, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/back.svg'),
                    SizedBox(
                      width: 170,
                    ),
                    Container(
                      width: 69,
                      height: 35,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          obscureText: false,
                          controller: controller != null ? controller : null,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: GoogleFonts.poppins(
                                color: Color(0xffc2cece),
                                fontSize: 11,
                                fontWeight: FontWeight.normal),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xfffffffff),
                                width: 0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color(0xfffffffff),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/search.svg',
                      height: 16,
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _ChartScreenState extends State<ChartScreen> {
  bool delivered = true;
  bool processing = false;
  bool cancelled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
        bottom: ChartScreen.buildBottomComponent(),
        backgroundColor: Color(0xfffffffff),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: McGyver.rsDoubleH(context, 8),
          ),
          Column(
            children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                              image: DecorationImage(
                        image: AssetImage(
                          'assets/images/range.png',
                        ),
                        fit: BoxFit.cover)
                  ),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Balance',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12, 
                    color: Color(0xffC2CECE))
                  ),
                  Text('\$3128',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: McGyver.textSize(context, 4), 
                    color: Color(0xff000000))
                  ),
                ],
              ),)
                  ),
            ],
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 6),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE365C1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                DefaultTabController(
                  length: 4,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.fromLTRB(20, 2, 2, 2),
                    indicator:
                        CircleTabIndicator(color: Colors.white, radius: 3),
                    isScrollable: true,
                    labelColor: Colors.white,
                    tabs: <Widget>[
                      Tab(text: 'May '),
                      Tab(text: 'June'),
                      Tab(text: 'July'),
                      Tab(text: 'August'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 27, right: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 31,
                            width: 120,
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  delivered = true;
                                  processing = false;
                                  cancelled = false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                              color: delivered
                                  ? Color(0xffDF30B0)
                                  : Color(0xffffffff),
                              child: Center(
                                child: Text(
                                  "Expenses",
                                  style: GoogleFonts.poppins(
                                      color: delivered
                                          ? Colors.white
                                          : Color(0xff000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            )),
                        SizedBox(width: 20),
                        Container(
                            height: 31,
                            width: 120,
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  delivered = false;
                                  processing = true;
                                  cancelled = false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)),
                              color: processing
                                  ? Color(0xffDF30B0)
                                  : Color(0xffffffff),
                              child: Center(
                                child: Text(
                                  "Income",
                                  style: GoogleFonts.poppins(
                                      color: processing
                                          ? Colors.white
                                          : Color(0xff222222),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            )),
                      ],
                    )),
                    SizedBox(height: 20,),
                Container(
                  height: 200,
                  child: CarouselChangeReasonDemo()),
              
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class CarouselChangeReasonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselChangeReasonDemoState();
  }
}

class _CarouselChangeReasonDemoState extends State<CarouselChangeReasonDemo> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            items: [
                  Container(
                    width: 160,  
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/fb.svg'),
                             SizedBox(width: 10,),
                            Text('Facebook',
                            style: GoogleFonts.poppins(
                              fontSize: 13, color: Color(0xff494949),
                              fontWeight: FontWeight.w500,
                            )
                            ),
                          ],
                        ),
                        SizedBox(height: McGyver.rsDoubleH(context, 6),),                             Padding(
                               padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Marketing', 
                                  style: GoogleFonts.poppins(
                                    fontSize: 14, color: Color(0xff999999),
                                    fontWeight: FontWeight.w500,
                                  )),
                                   Text('\$ 8,459.35', 
                                  style: GoogleFonts.poppins(
                                    fontSize: 16, color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  )),
                                ],
                              ),
                            ),
                      ],
                    ),
                  ),
                   Container(
                    width: 160,
                   
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/withdrawal.svg'),
                             SizedBox(width: 10,),
                            Text('Cash Withdrawal',
                            style: GoogleFonts.poppins(
                              fontSize: 13, color: Color(0xff494949),
                              fontWeight: FontWeight.w500,
                            )
                            ),
                          ],
                        ),
 SizedBox(height: McGyver.rsDoubleH(context, 6),), 
                     Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Marketing', 
                                  style: GoogleFonts.poppins(
                                    fontSize: 14, color: Color(0xff999999),
                                    fontWeight: FontWeight.w500,
                                  )),
                                   Text('\$ 8,459.35', 
                                  style: GoogleFonts.poppins(
                                    fontSize: 16, color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  )),
                                ],
                              ),
                    ),

                      ],
                    ),
                  ),
                   Container(
                    width: 160, 
                   
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/naira.svg'),
                             SizedBox(width: 10,),
                            Text('Bank of Naira',
                            style: GoogleFonts.poppins(
                              fontSize: 13, color: Color(0xff494949),
                              fontWeight: FontWeight.w500,
                            )
                            ),
                          ],
                        ),
 SizedBox(height: McGyver.rsDoubleH(context, 6),),
                             Padding(
                        padding: const EdgeInsets.all(15.0),                      
                                 child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Office supplies', 
                                  style: GoogleFonts.poppins(
                                    fontSize: 14, color: Color(0xff999999),
                                    fontWeight: FontWeight.w500,
                                  )),
                                   Text('\$2,435.74', 
                                  style: GoogleFonts.poppins(
                                    fontSize: 16, color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  )),
                                ],
                            ),
                             ),

                      ],
                    ),
                  ),
                    
                ],
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 3.4, height: 180, viewportFraction: 0.4,
              autoPlay: false,
            ),
          ),
        ],
      ),
    );
  }
}


