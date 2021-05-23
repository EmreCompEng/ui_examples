import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gradients.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard(
      {Key? key,
      required this.color,
      required this.cardHeight,
      required this.header,
      required this.subheader,
      required this.date,
      required this.location,
      required this.price,
      required this.userName,
      required this.imagePath})
      : super(key: key);

  final MaterialColor color;
  final double cardHeight;
  final String header;
  final String subheader;
  final String date;
  final String location;
  final String price;
  final String userName;
  final String imagePath;

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  double _height = 300;
  double _widht = 0;
  bool _isClicked = false;

  double _priceButtonwidht = 70;

  @override
  Widget build(BuildContext context) {
    //_height=MediaQuery.of(context).size.height*0.4;
    _widht = MediaQuery.of(context).size.width * 0.9;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Açılmış olduğunda tıklanması
            if (_isClicked) {
              _height /= 2;
              _isClicked = false;
              _priceButtonwidht /= 2;
            }
            // Kapalı halde tıklanılınca
            else {
              _height *= 2;
              _isClicked = true;
              _priceButtonwidht *= 2;
            }
          });
        },
        child: AnimatedContainer(
          width: _widht,
          height: _height,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(30),
              gradient: buildLinearGradient(widget.color)),
          duration: Duration(seconds: 1),
          curve: Curves.easeOutQuart,

          // İlk yazılan en altta kalır
          child: Stack(
            children: [
              Positioned(
                  top: 42,
                  left: 0,
                  right: 0,
                  child: widget.imagePath == ""
                      ? Text("")
                      : ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: Image.asset(widget.imagePath,
                              height: widget.cardHeight * 0.8,
                              width: _widht,
                              fit: BoxFit.cover),
                        )),
              Positioned(
                top: 20,
                left: 20,
                child: Text(
                  widget.header,
                  style:
                      GoogleFonts.nunitoSans(fontSize: 40, color: Colors.white),
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                child: Text(
                  widget.subheader,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 20,
                    color: Colors.white70,
                    height: 0.9,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                child: Text(
                  "Location : ${widget.location}",
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 20,
                child: Text(
                  "Date : ${widget.date}",
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  alignment: Alignment.center,
                  height: 70,
                  width: _priceButtonwidht,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                      color: widget.color.shade400),
                  child: Text(
                    "${widget.price} \₺",
                    style: GoogleFonts.nunitoSans(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 90,
                right: 20,
                child: Text(
                  widget.userName,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.nunitoSans(
                      color: Colors.white10, fontSize: 70, height: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
