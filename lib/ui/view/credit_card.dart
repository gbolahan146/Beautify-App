import 'package:beautify/core/cards_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';



class CreditCard extends StatelessWidget {
  final String cardHolderName;
  final String expiryDate;
  final String cardNumber;
  final CardType cardType;
  final EdgeInsetsGeometry margin;

  const CreditCard({
    Key key,
    this.margin,
    @required this.cardHolderName,
    @required this.expiryDate,
    @required this.cardType,
    @required this.cardNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: margin,
      decoration: BoxDecoration(
        color: Color(0xffe365c1),
          boxShadow: [BoxShadow(blurRadius: 22, color: Colors.grey)],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
         
          Container(
              child: Positioned(
                top:0,
                  right: 90,
                  child:
                      Image.asset('assets/images/leftcard.png', scale: 4.1,),
                   )
                  ),
                  Container(
              child: Positioned(
                top:30,
                  right: 25,
                  child:
                      Image.asset('assets/images/visa.png', scale: 12.1,),
                   )
                  ),
                  Container(
              child: Positioned(
                bottom:0,
                  right: 0, 
                  child:
                      Image.asset('assets/images/triangles.png', scale: 2.8,),
                   )
                  ),
                  Container(
              child: Positioned(
                bottom:0, top: 110,
                  left: 10,
                  child:
                      Image.asset('assets/images/undertext.png', scale: 4.3,),
                   )
                  ),
          Positioned(
            left: 20,
            right: 20,
            top: 40,
            bottom: 12,
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Balance', style: GoogleFonts.poppins(fontSize: 13, color: Color(0xffc2cece)),),
                Text('\$3124', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600,shadows: [
            Shadow(
              blurRadius: 1.0,
              color: Colors.black,
              offset: Offset(0, 1.2),
            ),
          ], color: Color(0xffffffff)),),
                SizedBox(height: 72),
                Text(
                  '5459 2100 3425 2900',
                  style: GoogleFonts.poppins(fontSize: 16, shadows: [
            Shadow(
              blurRadius: 12.0,
              color: Colors.black,
              offset: Offset(1.0, 5.0),
            ),
          ], fontWeight: FontWeight.w600, color: Color(0xffffffff)),
                ),
                SizedBox(width: 82),
                Value(
                  value: expiryDate,
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }


}




class Value extends StatelessWidget {

  final String value;

  const Value({
    Key key,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w500,
            color: Color(0xffC2CECE),
          ),
        ),
      ],
    );
  }
}




class PaymentCard {
  CardType type;
  String number;
  String name;
  int month;
  int year;
  int cvv;

  PaymentCard(
      {this.type, this.number, this.name, this.month, this.year, this.cvv});

  @override
  String toString() {
    return '[Type: $type, Number: $number, Name: $name, Month: $month, Year: $year, CVV: $cvv]';
  }
}

class Strings {
  static const String appName = 'Payment Card Demo';
  static const String fieldReq = 'This field is required';
  static const String numberIsInvalid = 'Card is invalid';
  static const String save = 'Save Card';
}

class CardUtils {
  static String validateCVV(String value) {
    if (value.isEmpty) {
      return Strings.fieldReq;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static String validateDate(String value) {
    if (value.isEmpty) {
      return Strings.fieldReq;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains( RegExp(r'(\/)'))) {
      var split = value.split( RegExp(r'(\/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return !(month == null || year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split( RegExp(r'(\/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static String getCleanedNumber(String text) {
    RegExp regExp =  RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static Widget getCardIcon(CardType cardType) {
    String img = "";
    Icon icon;
    switch (cardType) {
      case CardType.mastercard:
        img = 'inputmastercard.svg';
        break;
      case CardType.visa:
        img = 'visa.svg';
        break;
      case CardType.Others:
        icon =  Icon(
          Icons.credit_card,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
      case CardType.Invalid:
        icon =  Icon(
          Icons.warning,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
    }
    Widget widget;
    if (img.isNotEmpty) {
      widget =  SvgPicture.asset(
        'assets/images/$img',
        width: 40.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  static String validateCardNum(String input) {
    if (input.isEmpty) {
      return Strings.fieldReq;
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return Strings.numberIsInvalid;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return Strings.numberIsInvalid;
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(new RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.mastercard;
    } else if (input.startsWith(new RegExp(r'[4]'))) {
      cardType = CardType.visa;
    }  else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }
}
