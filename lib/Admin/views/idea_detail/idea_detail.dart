import 'package:flutter/material.dart';
import 'package:ideafront/const/lists.dart';
import '../../../IdeaMaker/views/chat_screen/chat.dart';
import '../home/menu_widget.dart';

class IdeaDetailAdmin extends StatelessWidget {
  const IdeaDetailAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MenuWidget(),
        backgroundColor: Colors.transparent,
        title: const Text('Ideas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'IdeaConnect',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset('assets/icons/send.png'),
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
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.pinkAccent,
                          radius: 20,
                          backgroundImage: AssetImage(
                              'assets/images/4.jpg'), // Replace with the profile photo
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Mahwish Ponam', // Replace with the idea-maker's name
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 250.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeIdeasList
                            .length, // Replace with actual photo count
                        itemBuilder: (context, index) {
                          return Container(
                            width: 300.0,
                            margin: const EdgeInsets.only(right: 8.0),
                            color: Colors.grey.shade300,
                            child: Image.asset(
                              homeIdeasList[index],
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
    // ignore: unused_local_variable
    MaterialColor? reportButtonColor = isReported ? Colors.red : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : null,
              ),
              onPressed: toggleLike,
            ),
            const Text(
              '16 likes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.comment,
                color: Colors.black,
              ),
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
              onPressed: () {},
              icon: const Icon(Icons.send_rounded),
              color: Colors.blueGrey,
            ),
          ],
        ),
      ],
    );
  }
}

class IdeaDescription extends StatefulWidget {
  const IdeaDescription({Key? key}) : super(key: key);

  @override
  IdeaDescriptionState createState() => IdeaDescriptionState();
}

//idea Discription Code
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
    );
  }
}

//comment Screen Code
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

//Number of Likes  Code
