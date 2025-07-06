import 'package:flutter/material.dart';

class buildHeroImage extends StatelessWidget {
  const buildHeroImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(300)),
        child: Image.asset("profile.png"),
      )),
    );
  }
}
