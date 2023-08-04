import 'package:flutter/material.dart';



class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black54,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  )),
            );
  }
}
