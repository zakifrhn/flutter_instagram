import 'package:demo_home_instagram/models/content_model.dart';
import 'package:demo_home_instagram/widgets/buble_story.dart';
import 'package:demo_home_instagram/widgets/user_post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List users = [
    'Anisa',
    'Budi',
    "Farhan",
    'Hasan',
    'Rahmi',
    'Rendi',
    "Suryuno"
  ];

  final String dataUrl =
      'https://pixabay.com/api/?key=41994079-0d6e2e9670e4377e1456e61ca&image_type=photo&pretty=true';

  //get Data
  Future<List<Content>> getListContent() async {
    final response = await Dio().get(dataUrl);

    final dataModel =
        ContentModel.fromJson(response.data as Map<String, dynamic>);

    return dataModel.ListContent;
  }

  //Data di local
  List<Content> listContent = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    //loading widget
    _isLoading = true;

    //dapatkan data
    getListContent().then((result) {
      listContent = result;
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram",
            style: TextStyle(
                fontFamily: GoogleFonts.grandHotel().fontFamily, fontSize: 30)),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, right: 6),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red.shade500,
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Icon(
                  Icons.maps_ugc_outlined,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2, right: 3),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red.shade500,
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BubleStory(
                  name: users[index],
                  foto: index,
                  isMe: index == 0 ? true : false,
                  isLive: index == 1 ? true : false,
                );
              },
              itemCount: users.length,
            ),
          ),
          const Divider(
            height: 0.5,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return UserPost(content: listContent[index]);
              },
              itemCount: listContent.length,
            ),
          )
        ],
      ),
    );
  }
}
