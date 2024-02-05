import 'package:demo_home_instagram/widgets/middle_profile.dart';
import 'package:demo_home_instagram/widgets/top_profile.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: [
                //header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'mzakifrhn',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.add_box_outlined,
                            size: 28,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.menu,
                            size: 28,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                TopProfile(),
                MiddleProfile(),
              ],
            ),
          )),
    );
  }
}
