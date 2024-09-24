// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/model/userpost.dart';
import 'package:module2_4_lab_exercise/profileview.dart';

import '../model/userdata.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key, required this.userData});

  final UserData userData;

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  var nametxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }

  Widget buttons(Userpost userpost) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: (userpost.isLiked) ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                userpost.isLiked = (userpost.isLiked) ? false : true;
              });
            },
            icon: const Icon(Icons.thumb_up),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            onPressed: () {},
            icon: const Icon(Icons.message),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      );

  Widget postCount(Userpost userpost) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            userpost.numcomments,
          ),
          const Text(' . '),
          Text(
            userpost.numshare,
          ),
        ],
      );

  Widget postImage(Userpost userpost) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userpost.postimg),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );

  Widget postHeader(Userpost userpost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                userpost.userimg,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userpost.username,
                style: nametxtStyle,
              ),
              Row(
                children: [
                  Text('${userpost.time} . '),
                  const Icon(
                    Icons.people,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  Widget showPost(Userpost userpost) => Column(
        children: [
          postHeader(userpost),
          Container(
            margin: const EdgeInsets.all(18),
            child: Row(
              children: [
                Text(
                  userpost.postcontent,
                  style: nametxtStyle,
                )
              ],
            ),
          ),
          postImage(userpost),
          postCount(userpost),
          const Divider(),
          buttons(userpost),
          SizedBox(
            height: 10,
            child: Container(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        children: widget.userData.userList.map((userPost) {
          return InkWell(
            onTap: () {
              gotoPage(context, Profileview(userpost: userPost));
            },
            child: showPost(userPost),
          );
        }).toList(),
      ),
    );
  }
}
