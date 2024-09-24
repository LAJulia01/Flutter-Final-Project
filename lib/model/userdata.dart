// Import necessary classes
import 'package:module2_4_lab_exercise/model/account.dart';
import 'package:module2_4_lab_exercise/model/usercomment.dart';

import 'friend.dart';
import 'userpost.dart';

class UserData {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/jwin.jpg',
      username: 'Laurence Angelo B. Julia',
      time: '2 Hours ago',
      postcontent: 'Time is Gold',
      postimg: 'assets/jfam.jpg',
      numcomments: '8.5k comments',
      numshare: '90 shares',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/leah.jpg',
      username: 'Diether Angelo Tindog',
      time: '20 Nov at 9:30pm',
      postcontent: 'Hi there!',
      postimg: 'assets/jfam.jpg',
      numcomments: '32 comments',
      numshare: '11 share',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(
      img: 'assets/gals.jpg',
      name: 'Princess Jane Galos',
    ),
    Friend(
      img: 'assets/jm.jpg',
      name: 'John Michael Ayento',
    ),
    Friend(
      img: 'assets/profile.jpg',
      name: 'Diether Angelo Tindog',
    ),
    Friend(
      img: 'assets/gals.jpg',
      name: 'Princess Jane Galos',
    ),
    Friend(
      img: 'assets/jm.jpg',
      name: 'John Michael Ayento',
    ),
    Friend(
      img: 'assets/profile.jpg',
      name: 'Diether Angelo Tindog',
    ),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/gals.jpg',
      commenterName: 'Princess Jane Galos',
      commenterTime: '3w',
      commenterContent: 'What a lovely photo we got there!',
    ),
    Usercomment(
      commenterImg: 'assets/jm.jpg',
      commenterName: 'John Michael Ayento',
      commenterTime: '5w',
      commenterContent: 'Try the latte one!',
    ),
    Usercomment(
      commenterImg: 'assets/profile.jpg',
      commenterName: 'Diether Angelo Tindog',
      commenterTime: '7w',
      commenterContent: 'Hello There!',
    ),
  ];

  Account myUserAccount = Account(
    name: 'Laurence Angelo Julia',
    email: 'lgboy52@gmail.com',
    img: 'assets/jwin.jpg',
    numFollowers: '1.5k',
    numPosts: '100',
    numFollowing: '50',
    numFriends: '5,000',
  );
}
