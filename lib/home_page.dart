import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/sources/remote_data_source.dart';
import 'package:social_media_app/src/widgets/post_button.dart';
import 'package:social_media_app/src/widgets/list_tile.dart';
import 'package:social_media_app/src/widgets/text_field.dart';
import 'src/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // firestore access
  final RemoteDataSources database = RemoteDataSources();

  // text controller
  final TextEditingController _newPostController = TextEditingController();

  // post message
  void postMessage() {
    if (_newPostController.text.isNotEmpty) {
      String message = _newPostController.text;
      database.addPost(message);
    }

    // clear the controller
    _newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("A 2 S V"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0, top: 25.0),
            child: Row(
              children: [
                // text field
                Expanded(
                  child: MyTextField(
                    hintText: "Say something...",
                    obscureText: false,
                    controller: _newPostController,
                  ),
                ),
                // post button
                PostButton(
                  onTap: postMessage,
                )
              ],
            ),
          ),

          //  POSTS
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // show loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // get all posts
              final posts = snapshot.data!.docs;

              // no data
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text("No posts... Post something!")),
                );
              }

              // return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // get each individual post
                    final post = posts[index];

                    // get data from each post
                    String message = post["PostMessage"];
                    String userEmail = post["UserEmail"];
                    Timestamp timeStamp = post["TimeStamp"];

                    // retun as a list tile
                    return MyListTile(
                      title: message,
                      subtitle: userEmail,
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
