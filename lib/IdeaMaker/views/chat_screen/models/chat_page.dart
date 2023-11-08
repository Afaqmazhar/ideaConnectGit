import 'package:flutter/cupertino.dart';
import '../chat.dart';
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
      text: "Jane Russel",
      secondaryText: "Awesome Setup",
      image: "images/userImage1.jpeg",
      time: "Now",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    ChatUsers(
      text: "Glady's Murphy",
      secondaryText: "That's Great",
      image: "images/userImage2.jpeg",
      time: "Yesterday",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    ChatUsers(
      text: "Jorge Henry",
      secondaryText: "Hey where are you?",
      image: "images/userImage3.jpeg",
      time: "31 Mar",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    ChatUsers(
      text: "Philip Fox",
      secondaryText: "Busy! Call me in 20 mins",
      image: "images/userImage4.jpeg",
      time: "28 Mar",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    ChatUsers(
      text: "Debra Hawkins",
      secondaryText: "Thankyou, It's awesome",
      image: "images/userImage5.jpeg",
      time: "23 Mar",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    ChatUsers(
      text: "Jacob Pena",
      secondaryText: "will update you in evening",
      image: "images/userImage6.jpeg",
      time: "17 Mar",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    ChatUsers(
      text: "Andrey Jones",
      secondaryText: "Can you please share the file?",
      image: "images/userImage7.jpeg",
      time: "24 Feb",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    ChatUsers(
      text: "John Wick",
      secondaryText: "How are you?",
      image: "images/userImage8.jpeg",
      time: "18 Feb",
      name: '',
      messageText: '',
      imageURL: '',
    ),
    // Add more instances of ChatUsers
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatUsers.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 16),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ConversationList(
          name: chatUsers[index].name,
          messageText: chatUsers[index].messageText,
          imageUrl: chatUsers[index].imageURL,
          time: chatUsers[index].time,
          isMessageRead: (index == 0 || index == 3) ? true : false,
        );
      },
    );
  }
}
