import 'package:nannycare/views/Profile/Model/BabysitterProfile.dart';
import 'package:nannycare/views/Profile/Model/userReviews.dart';

class UserData {
  List<UserReviews> reviewersList = [
    UserReviews(
      reviewerImg: 'assets/marga_image1.jpg',
      reviewerName: 'Melissa',
      reviewerTime: 'September 2024',
      reviewerContent:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    ),
    UserReviews(
      reviewerImg: 'assets/marga_image1.jpg',
      reviewerName: 'Melissa',
      reviewerTime: 'September 2024',
      reviewerContent:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    ),
    UserReviews(
      reviewerImg: 'assets/marga_image1.jpg',
      reviewerName: 'Melissa',
      reviewerTime: 'September 2024',
      reviewerContent:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    ),
  ];

  Babysitterprofile _userAccount = Babysitterprofile(
    name: 'Melissa Guillar',
    img: 'assets/marga_image1.jpg',
    location: 'Panabo City',
    age: '25',
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    characteristics: ['Calm', 'Caring', 'Empathetic'],
    numofReviews: '100',
    hourlyRate: '300',
  );

  Babysitterprofile get userAccount => _userAccount;

  set userAccount(Babysitterprofile value) {
    _userAccount = value;
  }
}
