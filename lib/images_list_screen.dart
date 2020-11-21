import 'dart:math';

import 'package:fast_image/view/progressive_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'model/api.dart';

class ImagesListScreen extends StatefulWidget {
  ImagesListScreen({Key key}) : super(key: key);

  @override
  _ImagesListScreenState createState() => _ImagesListScreenState();
}

class _ImagesListScreenState extends State<ImagesListScreen> {
  ImagesApi api;
  PreloadPageController controller = PreloadPageController();
  @override
  void initState() {
    api = ImagesApi(Random().nextInt(10000), () => setState(() {}));
    controller.addListener(() {
      if ((controller.position.pixels % controller.position.viewportDimension) >
          (api.items.length - 2)) {
        api.loadNextPage();
      }
    });
    api.loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PreloadPageView.builder(
          controller: controller,
          preloadPagesCount: 3,
          itemCount: api.preparedItems.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Card(
            child: Column(
              children: [
                Expanded(
                  child: PreloadPageView.builder(
                    preloadPagesCount: 3,
                    itemCount: api.preparedItems[index].length,
                    itemBuilder: (context, j) => ProgressiveImage(
                      placeholder: AssetImage('images/placeholder.jpg'),
                      thumbnail: NetworkImage(
                          api.preparedItems[index][j].thumbs.small),
                      image: NetworkImage(
                          api.preparedItems[index][j].thumbs.large),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            margin: EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}
