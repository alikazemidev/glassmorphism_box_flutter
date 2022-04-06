import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              "https://images.pexels.com/photos/7237616/pexels-photo-7237616.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 90,
            child: Text(
              'alikz.dev.art',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Center(
                  child: Text(
                    'Flutter \nGlassmorphism',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                // Build Widget Glassmorphism
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Glassmorphism(
                    blur: 15,
                    opacity: 0.2,
                    radius: 15,
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Flutter is the BEST',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   'Learn the best design here',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.white.withOpacity(0.8),
                          //     fontSize: 16.0,
                          //   ),
                          // ),
                          LikeButton(
                            size: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Glassmorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final double radius;
  final Widget child;

  const Glassmorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.radius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
