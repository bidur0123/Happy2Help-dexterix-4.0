// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:happy2help/Screens/Community/component/add_community_post.dart';
// import 'package:happy2help/services/post_controller.dart';

// class Community extends StatelessWidget {
//   final List<Map<String, String>> dummyPosts = [
//     {
//       'userName': 'Phoenix',
//       'profileImage': 'assets/icons/userr.png',
//       'message': 'Hey, how is everyone doing today?'
//     },
//     {
//       'userName': 'Anonymous22',
//       'profileImage': 'assets/icons/userr.png',
//       'message':
//           'My therapist helped me navigate my depression and anxiety with kindness, patience, and effective strategies. I feel much better equipped to manage my mental health now.'
//     },
//     {
//       'userName': 'valkery',
//       'profileImage': 'assets/icons/userr.png',
//       'message':
//           'As someone who sought help for bipolar disorder, I found my therapist to be knowledgeable and supportive. They helped me manage my symptoms and provided me with valuable resources to better understand my condition. I would recommend them to anyone seeking help for bipolar disorder.'
//     },
//     {
//       'userName': 'Bond',
//       'profileImage': 'assets/icons/userr.png',
//       'message':
//           'As a soldier who has struggled with PTSD, I cannot recommend my therapist enough. They have been a beacon of hope and support during some of my darkest times. Their expertise in trauma-informed care has been invaluable in helping me navigate the complexities of PTSD.'
//     },
//     {
//       'userName': 'Pikachu',
//       'profileImage': 'assets/icons/userr.png',
//       'message':
//           'As a person suffering from anxiety for a long time, I found my therapist through Happy2Help. He was a compassionate and skilled professional who helped me navigate my mental health struggles with kindness and effective strategies. I would highly recommend them to anyone seeking support for their mental health.'
//     },
//     {
//       'userName': 'Zeus',
//       'profileImage': 'assets/icons/userr.png',
//       'message':
//           'Just finished reading a great book. Anyone up for a discussion?'
//     },
//     {
//       'userName': 'Ash',
//       'profileImage': 'assets/icons/userr.png',
//       'message': 'Wishing everyone a fantastic day ahead!'
//     },
//     {
//       'userName': 'LordPea',
//       'profileImage': 'assets/icons/userr.png',
//       'message': 'Looking for recommendations on places to visit for vacation.'
//     },
//     {
//       'userName': 'Patrick5505',
//       'profileImage': 'assets/icons/userr.png',
//       'message': 'What are your thoughts on the latest technology trends?'
//     },
//     {
//       'userName': 'Anton',
//       'profileImage': 'assets/icons/userr.png',
//       'message': 'Remember to take breaks and relax during work hours!'
//     },
//     {
//       'userName': 'Bond',
//       'profileImage': 'assets/icons/userr.png',
//       'message': 'Hii'
//     },
//   ];

//   bool isLiked = false;
//   bool isCommented = false;
//   final PostController postController = Get.put(PostController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Community'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.grey,
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => AddPostPage()));
//           },
//           child: const Icon(
//             Icons.add,
//           ),
//         ),
//         body: Obx(() {
//           if (postController.posts.isEmpty) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return ListView.builder(
//               itemCount: postController.posts.length,
//               itemBuilder: (context, index) {
//                 final post = postController.posts[index];
//                 return MessageTile(
//                   post.postedBy,
//                   "assets/icons/userr.png",
//                   post.content,
//                 );
//               },
//             );
//           }
//         }));
//   }

//   Widget MessageTile(String userName, String profileImage, String message) {
//     return Container(
//       margin: const EdgeInsets.all(8.0),
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 11.0,
//                 backgroundImage: AssetImage(profileImage),
//               ),
//               const SizedBox(width: 8.0),
//               Text(
//                 userName,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             message,
//             style: const TextStyle(fontSize: 16.0),
//           ),
//           const SizedBox(height: 8.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                 icon: Icon(
//                   Icons.thumb_up,
//                   color: isLiked ? Colors.blue : Colors.grey,
//                 ),
//                 onPressed: () {
//                   // setState(() {
//                   //   isLiked = !isLiked;
//                   // });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.comment,
//                   color: isCommented ? Colors.blue : Colors.grey,
//                 ),
//                 onPressed: () {},
//                 // onPressed: () {
//                 //   setState(() {
//                 //     isCommented = !isCommented;
//                 //   });
//                 // },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:happy2help/Screens/Community/component/add_community_post.dart';
import 'package:happy2help/models/showPostModel.dart';
import 'package:happy2help/services/post_controller.dart'; // Import your model file

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final List<Map<String, String>> dummyPosts = [
    // ... (same as before)
  ];

  bool isLiked = false;
  bool isCommented = false;
  final PostService postService = PostService();
  List<Post> posts = [];
bool onLoading=false;
  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    final fetchedPosts = await postService.fetchPosts();
    setState(() {
      posts = fetchedPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPostPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return MessageTile(
                  userName: post.postedBy,
                  profileImage: "assets/icons/userr.png",
                  message: post.content,
                );
              },
            ),
    );
  }
}

// ListView.builder(
//         itemCount: dummyPosts.length,
//         itemBuilder: (context, index) {
//           final post = dummyPosts[index];
//           return MessageTile(
//             userName: post['userName']!,
//             profileImage: post['profileImage']!,
//             message: post['message']!,
//           );
//         },
//       ),
class MessageTile extends StatefulWidget {
  final String userName;
  final String profileImage;
  final String message;

  const MessageTile({
    required this.userName,
    required this.profileImage,
    required this.message,
  });

  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  bool isLiked = false;
  bool isCommented = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 11.0,
                backgroundImage: AssetImage(widget.profileImage),
              ),
              const SizedBox(width: 8.0),
              Text(
                widget.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            widget.message,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: isLiked ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: isCommented ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isCommented = !isCommented;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
