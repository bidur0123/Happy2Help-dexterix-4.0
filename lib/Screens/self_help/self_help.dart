import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Color color;
  const CustomContainer({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(left: 15 , right: 15 , top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: color.withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelfHelp extends StatelessWidget {
  final List<Map<String, String>> selfHelpActivities = [
    {
      'title': 'Talk to family members or close friends',
      'description':
      'Having a conversation with loved ones can provide emotional support, reduce stress, and strengthen relationships.',
      'imageUrl': 'assets/self_help/SpendingTimeWithfamily.jpg',
    },
    {
      'title': 'Eat your favorite food',
      'description':
      'Indulging in your favorite food can bring joy and comfort, boosting your mood and providing a moment of pleasure.',
      'imageUrl': 'assets/self_help/eating.jpg',
    },
    {
      'title': 'Go for a quick run',
      'description':
      'Exercise, such as running, releases endorphins, which are natural mood lifters, helping to reduce stress and anxiety.',
      'imageUrl': 'assets/self_help/Jogging.jpg',
    },
    {
      'title': 'Play an instrument',
      'description':
      'Engaging in music can be therapeutic and a form of self-expression, providing relaxation and stress relief.',
      'imageUrl': 'assets/self_help/playInstrument.jpg',
    },
    {
      'title': 'Cook or bake your favorite dish',
      'description':
      'Cooking or baking can be a creative outlet, allowing you to focus on the present moment and enjoy the process.',
      'imageUrl': 'assets/self_help/Cooking.jpg',
    },
    {
      'title': 'Listen to some music',
      'description':
      'Music has the power to evoke emotions, uplift mood, and provide a sense of comfort and solace.',
      'imageUrl': 'assets/self_help/music.jpg',
    },
    {
      'title': 'Start some new hobby',
      'description':
      'Exploring new hobbies or interests can bring excitement and fulfillment, stimulating your mind and creativity.',
      'imageUrl': 'assets/self_help/Hobby.jpg',
    },
    {
      'title': 'Do some Yoga',
      'description':
      'Yoga combines physical postures, breathing exercises, and meditation, promoting relaxation, stress relief, and mindfulness.',
      'imageUrl': 'assets/self_help/Yoga.jpg',
    },
    {
      'title': 'Alternate-Nostril Breathing',
      'description':
      'Alternate-Nostril Breathing, also known as Nadi Shodhana, is a breathing technique that helps balance the mind, calm the nervous system, and reduce stress and anxiety.',
      'imageUrl': 'assets/self_help/Meditation.jpg',
    },
  ];
  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.indigo,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self-Help Activities'),
      ),
      body: ListView.builder(
        itemCount: selfHelpActivities.length,
        itemBuilder: (context, index) {
          final activity = selfHelpActivities[index];
          return CustomContainer(
            title: activity['title']!,
            description: activity['description']!,
            imageUrl: activity['imageUrl']!,
            color: colors[index % colors.length],
          );
        },
      ),
    );
  }
}

