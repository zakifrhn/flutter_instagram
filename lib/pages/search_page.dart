import 'package:demo_home_instagram/models/content_model.dart';
import 'package:demo_home_instagram/widgets/posted_another.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  List<Content> listContent = [];

  Future<void> updateList() async {
    List<Content> result = await getListUser();
    setState(() {
      listContent = result;
    });
  }

  Future<List<Content>> getListUser() async {
    final dataSearch = myController.text.toString();
    print(dataSearch.length);
    print(dataSearch);
    print('Load data...');
    try {
      final response = await Dio().get(
          'https://pixabay.com/api/?key=41994079-0d6e2e9670e4377e1456e61ca&q=user+$dataSearch&image_type=photo',
          options: Options(validateStatus: (status) => true));
      if (response.data is Map<String, dynamic>) {
        final dataUser =
            ContentModel.fromJson(response.data as Map<String, dynamic>);
        return dataUser.ListContent;
      } else {
        print(
            'Error: Unexpected response format. Expected Map<String, dynamic>, but got String.');
        return [];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        print('Error 400: ${e.response?.data}');
      } else {
        print('Error: ${e.message}');
      }
      return [];
    }
  }

  //   print(response.data);
  //   final dataUser =
  //       ContentModel.fromJson(response.data as Map<String, dynamic>);

  //   print(dataSearch);
  //   return dataUser.ListContent;
  // }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.

    // getListUser().then((result) {
    //   listContent = result;
    //   setState(() {});
    // });

    myController.addListener(updateList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Icon(
                    Icons.search,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Cari',
                      ),
                      controller: myController,
                      onChanged: (value) => getListUser(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return PostedAnother(
                content: listContent[index],
              );
            },
            itemCount: listContent.length,
          ),
        ),
      ],
    );
  }
}
