import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flip_card/flip_card.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();
  TextEditingController _expiryDateController = TextEditingController();

  String _cardNumber = "";
  String _expiryDate = "";
  String _cvc = "";
  String _cardholderName = "";
  bool isCVVFocused = false;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
          20.0,
          statusBarHeight + 15.0,
          20.0,
          10.0,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              const Color(0xFF0014FF),
              const Color(0xFFFF2CDF),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlipCard(
              key: _cardKey,
              speed: 800,
              flipOnTouch: false,
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF).withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'INFINITESHOP',
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 20.0,
                          ),
                        ),
                        Image.asset(
                          "images/mastercard-logo.png",
                          height: 40.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      _getCardNumber(),
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Text(
                          "Valid until",
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          _getExpiryDate(),
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _getCardholderName(),
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 18.0,
                          ),
                        ),
                        Image.asset(
                          "images/chip.png",
                          height: 44.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              back: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF).withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 35.0,
                      color: Color(0xFF000000).withOpacity(0.7),
                    ),
                    SizedBox(height: 30.0),
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Container(
                          height: 35.0,
                          color: Color(0xFFFFFFFF).withOpacity(0.7),
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            _getCVC(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          child: Container(
                            height: 45.0,
                            color: Color(0xFFE5E5E5),
                            width: width * 0.73,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.04),
                        child: Image.asset(
                          "images/chip.png",
                          height: 44.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      maxLength: 16,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22.0,
                        fontFamily: "RobotoMono",
                      ),
                      decoration: InputDecoration(
                        labelText: "Card Number",
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Roboto",
                        ),
                        helperStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 20.0,
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                      cursorColor: Color(0xFFFFFFFF),
                      onChanged: (String value) {
                        setState(() {
                          _cardNumber = value;
                          _setCVVFocus(false);
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _expiryDateController,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22.0,
                        fontFamily: "RobotoMono",
                      ),
                      decoration: InputDecoration(
                        labelText: "Expiry Date",
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Roboto",
                        ),
                        helperStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 20.0,
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                      cursorColor: Color(0xFFFFFFFF),
                      onChanged: (String value) {
                        setState(() {
                          _expiryDate = value;
                          _setCVVFocus(false);
                        });
                      },
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        _selectExpiryDate(context);
                      },
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      maxLength: 4,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22.0,
                        fontFamily: "RobotoMono",
                      ),
                      decoration: InputDecoration(
                        labelText: "CVC",
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Roboto",
                        ),
                        helperStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 20.0,
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                      cursorColor: Color(0xFFFFFFFF),
                      onChanged: (String value) {
                        setState(() {
                          _cvc = value;
                          _setCVVFocus(true);
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 22.0,
                        fontFamily: "RobotoMono",
                      ),
                      decoration: InputDecoration(
                        labelText: "Cardholder Name",
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Roboto",
                        ),
                        helperStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFFFFFFFF),
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 20.0,
                        ),
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                      cursorColor: Color(0xFFFFFFFF),
                      onChanged: (String value) {
                        setState(() {
                          _cardholderName = value;
                          _setCVVFocus(false);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FlatButton(
                onPressed: () => Navigator.pushNamed(context, "/success"),
                color: Color(0xFFFFFFFF).withOpacity(0.7),
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setCVVFocus(bool status) {
    if (status != isCVVFocused) {
      _cardKey.currentState.toggleCard();
    }
    setState(() {
      isCVVFocused = status;
    });
  }

  String _getCardNumber() {
    var result = "";
    for (var i = 0; i < 16; i++) {
      if (i < _cardNumber.length) {
        result += _cardNumber[i];
      } else {
        result += "X";
      }
      if ((i + 1) % 4 == 0) {
        result += " ";
      }
    }
    return result;
  }

  String _getCardholderName() => _cardholderName.length == 0
      ? "Cardholder Name".toUpperCase()
      : _cardholderName.toUpperCase();

  String _getExpiryDate() => _expiryDate.length == 0 ? "MM/YY" : _expiryDate;

  String _getCVC() => _cvc.length == 0 ? "XXX" : _cvc;

  Future<void> _selectExpiryDate(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      initialDateTime: DateTime.now(),
      minDateTime: DateTime(2020),
      maxDateTime: DateTime(2030),
      onConfirm: (dateTime, _) {
        setState(() {
          _expiryDate = new DateFormat('MM/yy').format(dateTime);
          _setCVVFocus(false);
        });
        _expiryDateController.value = new TextEditingValue(text: _expiryDate);
      },
      dateFormat: 'MM/yyyy',
      pickerTheme: DateTimePickerTheme(
        backgroundColor: Color(0xFFFFFFFF).withOpacity(0.9),
        confirm: Text(
          "Pick Date",
          style: TextStyle(
            color: Color(0xFF000000),
          ),
        ),
        cancel: Text(
          "Cancel",
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
