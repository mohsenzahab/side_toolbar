import 'package:flutter/material.dart';
import 'package:side_toolbar/list_item_model.dart';
import 'package:side_toolbar/side_toolbar.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: PlayableToolbarWidget(
          toolbarItems: toolbarItems,
          toolbarHeight: Constants.toolbarHeight,
          toolbarWidth: Constants.toolbarWidth,
          toolbarBackgroundColor: Colors.black.withAlpha(200),
          toolbarBackgroundRadius: 10,
        ),
      ),
    );
  }
}

List<ListItemModel> toolbarItems = [
  ListItemModel(
    onTap: () => print("Edit is tapped."),
    title: 'Edit',
    color: Colors.pinkAccent,
    icon: const Icon(Icons.edit),
  ),
  ListItemModel(
    onTap: () => print("Delete is tapped."),
    title: 'Delete',
    color: Colors.lightBlueAccent,
    icon: const Icon(Icons.delete),
  ),
  ListItemModel(
    onTap: () => print("Comment is tapped."),
    title: 'Comment',
    color: Colors.cyan,
    icon: const Icon(Icons.comment),
  ),
  ListItemModel(
    onTap: () => print("Post is tapped."),
    title: 'Post',
    color: Colors.deepOrangeAccent,
    icon: const Icon(Icons.post_add),
  ),
  ListItemModel(
    onTap: () => print("Favorite is tapped."),
    title: 'Favorite',
    color: Colors.pink,
    icon: const Icon(Icons.star),
  ),
  ListItemModel(
    onTap: () => print("Details is tapped."),
    title: 'Details',
    color: Colors.amber,
    icon: const Icon(Icons.details),
  ),
  ListItemModel(
    onTap: () => print("Languages is tapped."),
    title: 'Languages',
    color: Colors.pinkAccent,
    icon: const Icon(Icons.translate),
  ),
];
