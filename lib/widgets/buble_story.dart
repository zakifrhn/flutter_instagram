import 'package:flutter/material.dart';

class BubleStory extends StatelessWidget {
  BubleStory(
      {super.key,
      required this.name,
      required this.foto,
      required this.isMe,
      required this.isLive});

  final String name;
  final int foto;
  final bool isMe;
  final bool isLive;

  final List<String> imageUsers = [
    'assets/images/anisa.jpeg',
    'assets/images/budi.jpeg',
    'assets/images/farhan.jpeg',
    'assets/images/hasan.jpeg',
    'assets/images/rahmi.jpeg',
    'assets/images/rendi.jpeg',
    'assets/images/suryono.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            alignment: isLive ? Alignment.bottomCenter : Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 31,
                backgroundColor: isMe ? Colors.white : Colors.pinkAccent,
                child: CircleAvatar(
                  radius: 29,
                  backgroundImage:
                      // NetworkImage('https://i.pravatar.cc/100?u=$name'),
                      NetworkImage(
                          'https://picsum.photos/100/100?random=$name'),
                ),
              ),
              if (isMe)
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (isLive)
                Container(
                  height: 16,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      border: const Border.fromBorderSide(
                          BorderSide(color: Colors.white)),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'LIVE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(name),
          )
        ],
      ),
    );
  }
}
