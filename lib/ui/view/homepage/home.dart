import 'package:beautify/core/cards_enum.dart';
import 'package:beautify/core/responsiveness.dart';

import 'package:beautify/ui/view/credit_card.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/svg.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
  
        return Scaffold(
         appBar: AppBar(
      bottom: buildBottomComponent(),
      elevation: 0, backgroundColor:Color(0xffe8efee),
     automaticallyImplyLeading: false,
     
    ),
          backgroundColor:Color(0xffe8efee),
            body: ListView(
                  children: <Widget>[
                    SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16,0,16,0),
                child: Row(
                  children: [
                    Text(
                      'Your cards',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff271C1C),
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              CreditCard(
                cardHolderName: 'Elijah Doe',
                cardNumber: '1234567891013947',
                cardType: CardType.mastercard,
                expiryDate: '02/25',
                margin: EdgeInsets.fromLTRB(25,20,25,20),
              ),
               SizedBox(height: McGyver.rsDoubleH(context, 5),),

               Container(
                 decoration: BoxDecoration(
                   color: Colors.white,  
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)
                    ),
                 ),
                 child: Column(children: [
                    SizedBox(height: McGyver.rsDoubleH(context, 3),),
                   Row(
                     children: [
                        SizedBox(width: 20,),
                       Text('Transactions', style: GoogleFonts.poppins(fontSize: 22,
                       fontWeight: FontWeight.bold, color:Color(0xff271C1C)),),
                     ],
                   ),
                 ListTile(
                   leading: Image.asset('assets/images/adams.png'),
                   title: Text('Slyvia Adams', style: GoogleFonts.poppins(
                     fontSize: 14, fontWeight: FontWeight.w500,
                     color: Color(0xff271C1C)),),
                   trailing: Text('\$3124.86', style: GoogleFonts.poppins(
                     fontSize: 16, fontWeight: FontWeight.w500,
                     color: Color(0xff271C1C)),),
                   subtitle: Row(
                     children: [
                       SvgPicture.asset('assets/images/received.svg'),
                       SizedBox(width: 6,),
                       Text('Received', style: GoogleFonts.poppins(color: Color(0xffC2CECE), fontSize: 12),),
                      
                     ],
                   ),
                   ),
                   ListTile(
                   leading: Image.asset('assets/images/kelly.png'),
                   title: Text('Kelly Anne', style: GoogleFonts.poppins(
                     fontSize: 14, fontWeight: FontWeight.w500,
                     color: Color(0xff271C1C)),),
                   trailing: Text('\$3124.86', style: GoogleFonts.poppins(
                     fontSize: 16, fontWeight: FontWeight.w500,
                     color: Color(0xff271C1C)),),
                   subtitle: Row(
                     children: [
                       SvgPicture.asset('assets/images/send.svg'),
                       SizedBox(width: 6,),
                       Text('Send', style: GoogleFonts.poppins(color: Color(0xffC2CECE), fontSize: 12),),
                      
                     ],
                   ),
                   ),
                   ListTile(
                   leading: Image.asset('assets/images/avatar.png'),
                   title: Text('Slyvia Adams', style: GoogleFonts.poppins(
                     fontSize: 14, fontWeight: FontWeight.w500,
                     color: Color(0xff271C1C)),),
                   trailing: Text('\$3124.86', style: GoogleFonts.poppins(
                     fontSize: 16, fontWeight: FontWeight.w500,
                     color: Color(0xff271C1C)),),
                   subtitle: Row(
                     children: [
                       SvgPicture.asset('assets/images/received.svg'),
                       SizedBox(width: 6,),
                       Text('Received', style: GoogleFonts.poppins(color: Color(0xffC2CECE), fontSize: 12),),
                      
                     ],
                   ),
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       SizedBox(width: 20,),
                       Container(
        width: 50,
        child: Column(
          children: [
            FloatingActionButton(
              child: Icon(
                Icons.add,
                size: 30,
              ),
              backgroundColor: Color(0xffE365C1),
              foregroundColor: Colors.white,
              onPressed: null,
            )
          ],
        ),
      ),
                     ],
                   )
               ],),)

            ],
          ),
        ),
              ],
            ),
      );
  }

   static buildBottomComponent() {
       TextEditingController controller;
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 0, 14, 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                SvgPicture.asset('assets/images/back.svg'),
                SizedBox(width: 170,),
                Container(
                  width: 69,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: TextFormField(
      obscureText: false,
      controller: controller != null ? controller : null,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: GoogleFonts.poppins( color: Color(0xffc2cece),
          fontSize: 11, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:  Color(0xffe8efee),
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color:  Color(0xffe8efee),
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
                SvgPicture.asset('assets/images/search.svg', height: 16,),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )
          ],
        ),
      ),
    );
  }
}


