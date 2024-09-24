import 'package:flutter/material.dart';
import 'package:module2_4_lab_exercise/model/usercomment.dart';
import 'package:module2_4_lab_exercise/model/userdata.dart';
import 'package:module2_4_lab_exercise/model/userpost.dart';

class Profileview extends StatefulWidget {
  final Userpost userpost;

  const Profileview({
    super.key,
    required this.userpost,
  });

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  final UserData userData = UserData();
  final TextEditingController _commentController = TextEditingController();
  final nametxtStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final boldtxtStyle = const TextStyle(fontWeight: FontWeight.bold);
  final boldtxtStyle1 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  // Add a method to add new comments
  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        userData.commentList.add(
          Usercomment(
            commenterName: userData.myUserAccount.name, // Current user's name
            commenterTime: "Just now",
            commenterContent: _commentController.text,
            commenterImg:
                userData.myUserAccount.img, // Current user's profile image
          ),
        );
        _commentController.clear();
      });
    }
  }

  Widget commentBtn(Usercomment usercomment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(usercomment.commenterTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 16),
            const Text('Reply'),
          ],
        ),
      );

  Widget commentDesc(Usercomment usercomment) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(usercomment.commenterName, style: boldtxtStyle),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(usercomment.commenterContent),
              ],
            ),
          ],
        ),
      );

  Widget commentSpace(Usercomment usercomment) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(35, 158, 158, 158),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: commentDesc(usercomment),
      );

  Widget commenterPic(Usercomment usercomment) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(usercomment.commenterImg),
        ),
      );

  Widget usercommenterline(Userpost userpost, Usercomment usercomment) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commenterPic(usercomment),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commentSpace(usercomment),
              commentBtn(usercomment),
            ],
          ),
        ],
      );

  Widget userpostdetails(Usercomment usercomment) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          usercommenterline(widget.userpost, usercomment),
        ],
      );

  Widget commenters(Userpost userpost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            color: Color.fromARGB(86, 158, 158, 158),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(userpost.numshare, style: boldtxtStyle),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comments', style: boldtxtStyle1),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      );

  Widget buttons(Userpost userpost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(color: Color.fromARGB(86, 158, 158, 158)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                      foregroundColor:
                          (!userpost.isLiked) ? Colors.grey : Colors.blue),
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up, size: 20),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble, size: 20),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
          const Divider(color: Color.fromARGB(86, 158, 158, 158)),
        ],
      );

  Widget userline(Userpost userpost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userpost.userimg),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userpost.username, style: nametxtStyle),
              Row(
                children: [
                  Text(userpost.time),
                  const Text(' . '),
                  const Icon(Icons.group, size: 16, color: Colors.grey),
                ],
              )
            ],
          ),
        ],
      );

  Widget postimage(Userpost userpost) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(userpost.postcontent),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(userpost.postimg),
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            userline(widget.userpost),
            postimage(widget.userpost),
            buttons(widget.userpost),
            commenters(widget.userpost),
            ...userData.commentList.map((usercomment) {
              return userpostdetails(usercomment);
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        labelText: "Write a comment...",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _addComment,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
