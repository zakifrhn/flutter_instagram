// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo_home_instagram/models/content_model.dart';
import 'package:flutter/material.dart';

class UserPost extends StatelessWidget {
  UserPost({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Content content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      child: CircleAvatar(
                    backgroundImage: NetworkImage(content.userImageUrl),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      content.user,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 300,
          child: Image.network(content.largeImageUrl, fit: BoxFit.cover),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 10),
                  Icon(Icons.send_outlined)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, top: 10),
              child: Icon(Icons.archive_outlined),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 10),
          child: Row(
            children: [
              Text(
                '${content.likes} Likes',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                const TextSpan(
                    text: 'Farhan ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: content.tags,
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 2),
          child: Text(
            'view all comments',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            '1 hours ago',
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}
