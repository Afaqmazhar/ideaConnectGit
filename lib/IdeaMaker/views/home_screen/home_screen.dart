import 'package:ideafront/IdeaMaker/consts/consts.dart';
import 'package:ideafront/IdeaMaker/views/home_screen/home.dart';

import '../../../Investor/chatscreen/chat.dart';
import '../../../Investor/subscriptionscreen/chooseplan.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        shadowColor: whiteColor,
        title: 'Idea Connect'
            .text
            .color(greenColor)
            .bold
            .size(22)
            .make()
            .centered(),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const ChatScreen());
              },
              icon: Image.asset(
                'assets/icons/send.png',
                width: 30,
                height: 30,
              )),
          5.widthBox,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Uploaded Ideas',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 10, // Replace with actual item count
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Replace with actual photo count
                        itemBuilder: (context, index) {
                          return Container(
                            width: 350.0,
                            height: 400,
                            margin: const EdgeInsets.only(right: 8.0),
                            // color: Colors.grey.shade300,
                            child: Image.asset(
                              'assets/images/idea01.jpg',
                              fit: BoxFit.fill,
                            ), // Replace with photo
                            // You can use an Image widget here to display the photo
                          );
                        },
                      ),
                    ),
                    const LikeCommentButtons(),
                    const IdeaDescription(),
                    const SizedBox(height: 16.0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LikeCommentButtons extends StatefulWidget {
  const LikeCommentButtons({Key? key}) : super(key: key);

  @override
  LikeCommentButtonsState createState() => LikeCommentButtonsState();
}

class LikeCommentButtonsState extends State<LikeCommentButtons> {
  bool isLiked = false;
  bool isReported = true; // Set the initial value to true for red color

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    // MaterialColor? reportButtonColor = isReported ? Colors.red : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : null,
          ),
          onPressed: toggleLike,
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.comment),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommentScreen(
                      name: 'Your Name', // Pass the name here
                    ),
                  ),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  _showDeletePopup(context);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                _showMonetizationPopup(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  //delete idea
  void _showDeletePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Idea'),
          content: const Text('Do you want to remove this idea?'),
          actions: [
            TextButton(
              onPressed: () {
                // Get.to(()=>const CheckOut());
                Navigator.of(context).pop();
                _removeIdeaPopup(context, true);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _removeIdeaPopup(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  //remove idea popup
  void _removeIdeaPopup(BuildContext context, bool isMonetized) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isMonetized ? 'Idea Removed' : 'Request Declined'),
          content: Text(isMonetized
              ? 'Your idea has been Removed.'
              : 'Your request has been declined.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

//Monetize idea
  void _showMonetizationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Monetize Idea'),
          content: const Text('Do you want to monetize this idea?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.to(()=>const ChoosePlan());
                // Navigator.of(context).pop();
                // _showSubscriptionScreen(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showMonetizationResultPopup(context, false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _showSubscriptionScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SubscriptionScreen(),
      ),
    );
  }

//monetize popup
  void _showMonetizationResultPopup(BuildContext context, bool isMonetized) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isMonetized ? 'Idea Monetized' : 'Monetization Declined'),
          content: Text(isMonetized
              ? 'Your idea has been monetized.'
              : 'You declined monetization.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class IdeaDescription extends StatefulWidget {
  const IdeaDescription({Key? key}) : super(key: key);

  @override
  IdeaDescriptionState createState() => IdeaDescriptionState();
}

class IdeaDescriptionState extends State<IdeaDescription> {
  bool showFullDescription = false;

  void toggleDescription() {
    setState(() {
      showFullDescription = !showFullDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    String description =
        'This is the description of the idea. It is a great idea that can change the world.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Idea Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          showFullDescription ? description : description.substring(0, 50),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: toggleDescription,
          child: Text(
            showFullDescription ? 'Less' : 'More',
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
//        ```dart
    );
  }
}

class CommentScreen extends StatefulWidget {
  final String name;

  const CommentScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  CommentScreenState createState() => CommentScreenState();
}

class CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [];

  void saveComment() {
    final commentText = _commentController.text;
    final comment = Comment(
      text: commentText,
      name: 'Your Name', // Change this to the actual user's name
    );

    setState(() {
      _comments.add(comment);
      _commentController.clear();
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _commentController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: 'Enter your comment',
              suffixIcon: Icon(Icons.send),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                saveComment();
              }
            },
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(comment.text),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String text;
  final String name;

  Comment({
    required this.text,
    required this.name,
  });
}

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Get.to(()=>const CheckOut());
            _showMonetizationResultPopup(context, true);
          },
          child: const Text('PayNow'),
        ),
      ),
    );
  }

  void _showMonetizationResultPopup(BuildContext context, bool isMonetized) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isMonetized ? 'Idea Monetized' : 'Monetization Declined'),
          content: Text(isMonetized
              ? 'Your idea has been monetized.'
              : 'You declined monetization.'),
          actions: [
            TextButton(
              onPressed: () {
                Get.to(() => const HomeIdea());
                // Navigator.of(context).pop();
                // Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
