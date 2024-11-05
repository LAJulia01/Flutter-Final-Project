import 'package:module2_4_lab_exercise/models/BabysitterProfile.dart';
import 'package:module2_4_lab_exercise/models/userReviews.dart';

class UserData {
  List<UserReviews> reviewersList = [
    UserReviews(
      reviewerImg: 'avatar1.jpg',
      reviewerName: 'Melissa',
      reviewerTime: 'September 2024',
      reviewerpostImg: [
        'reviews/1.jpg',
        'reviews/2.jpg',
        'reviews/3.jpg',
      ],
      reviewerContent:
          "We hired Melissa to babysit our 2-year-old daughter for the first time, and we couldn't have been more pleased with the experience. From the moment she arrived, Emma was warm, professional, and immediately put our daughter at ease. She took the time to introduce herself, ask about our daughter’s routine, and make sure she knew any special instructions before we left.",
    ),
    UserReviews(
      reviewerImg: 'avatar1.jpg',
      reviewerName: 'Katie',
      reviewerTime: 'September 2024',
      reviewerpostImg: [
        'reviews/1.jpg',
        'reviews/2.jpg',
        'reviews/3.jpg',
      ],
      reviewerContent:
          "We recently hired Katie for a few hours to look after our 3-year-old son while we went out for a date night. Overall, we had a positive experience. Katie was punctual, and she quickly bonded with our son, engaging him in some fun crafts and reading books. She was also very patient when he didn’t want to go to bed right away.",
    ),
    UserReviews(
      reviewerImg: 'avatar1.jpg',
      reviewerName: 'Olivia',
      reviewerTime: 'September 2024',
      reviewerpostImg: [
        'reviews/1.jpg',
        'reviews/2.jpg',
        'reviews/3.jpg',
      ],
      reviewerContent:
          "Olivia was amazing! We needed someone to look after our infant and our 6-year-old daughter for a few hours, and she handled everything like a pro. She was so attentive to our baby’s needs and even followed the detailed schedule we had set up. Our daughter had a blast, and Olivia made sure she was entertained with games, arts and crafts, and a little movie time before bed.",
    ),
  ];

  Babysitterprofile _userAccount = Babysitterprofile(
    name: 'Beverly Jane',
    img: 'avatar1.jpg',
    location: 'Davao City',
    age: '25',
    description:
        "I am responsible hardworking, and trustworthy person, funny caring energetic, loving nannies to children's, talkative, and disciplinarian.",
    characteristics: ['Calm', 'Caring', 'Empathetic'],
    numofReviews: '5',
    hourlyRate: '300',
  );

  Babysitterprofile get userAccount => _userAccount;

  set userAccount(Babysitterprofile value) {
    _userAccount = value;
  }
}
