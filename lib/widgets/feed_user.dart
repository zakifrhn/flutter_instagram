import 'package:flutter/material.dart';

class FeedUser extends StatelessWidget {
  const FeedUser({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        10,
        (index) {
          return SizedBox(
            height: 180,
            width: 180,
            child: Image.network(
              'https://picsum.photos/180/180',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
