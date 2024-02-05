import 'package:demo_home_instagram/widgets/feed_user.dart';
import 'package:flutter/material.dart';

class MiddleProfile extends StatefulWidget {
  const MiddleProfile({super.key});

  @override
  State<MiddleProfile> createState() => _MiddleProfile();
}

class _MiddleProfile extends State<MiddleProfile> {
  int _selectedIndex = 0;

  // void _onTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sorotan cerita',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Simpan cerita favorit di profil Anda'),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                            //print('ini adalah bagian yang saya suka');
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            border: _selectedIndex == 0
                                ? Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 2),
                                  )
                                : null,
                          ),
                          child: Icon(
                            Icons.dashboard_outlined,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            border: _selectedIndex == 1
                                ? Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 2),
                                  )
                                : null,
                          ),
                          child: const SizedBox(
                            child: Icon(
                              Icons.person_pin_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedIndex == 0)
                const FeedUser()
              else
                const FeedUser()
            ],
          ),
        ],
      ),
    );
  }
}
