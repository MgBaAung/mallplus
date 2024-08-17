import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  String header;
  String? description;
  Header(this.header, {this.description});
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 209,
      color: Color(0xffB71C1C),
      child: Stack(
        children: <Widget>[
          SlideTransition(
            position: _offsetAnimation,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  // The background box with the same shape as the illustration
                  ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AnimatedImage(
              assetPath:
                  'assets/Images/headerillubackground.png', // Animated image asset path
            ),
          ),
          SlideTransition(
            position: _offsetAnimation,
            child: FutureBuilder(
              future: Future.delayed(Duration(milliseconds: 100)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(); // Empty container
                } else {
                  return Align(
                      alignment: Alignment.bottomRight,
                      child: AnimatedImage(
                        assetPath:
                            'assets/Images/header1illu.png', // Animated image asset path
                      ));
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 189,
                    height: 64,
                    child: Text(
                      widget.header,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    )),
                widget.description != null
                    ? Container(
                        width: 207,
                        height: 20,
                        child: Text(
                          widget.description!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends StatefulWidget {
  final String assetPath;

  AnimatedImage({required this.assetPath});

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(milliseconds: 500), // Adjust animation duration as needed
    );

    // Start the animation
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Image.asset(
          widget.assetPath,
          gaplessPlayback: true,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
