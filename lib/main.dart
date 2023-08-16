import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Movie App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildSectionTitle("Most Watched Movies"),
            _buildImageSection('assets/Inception.jpeg'),
            const SizedBox(height: 24),
            _buildSectionTitle("Popular Movies"),
            _buildHorizontalImageList([
              'assets/Dunkirk.jpeg',
              'assets/Interstellar.jpeg',
              'assets/Oppenheimer.jpeg',
              'assets/The Dark Knight Rises.jpeg',
              'assets/The Prestige.jpg',
            ]),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\n\n'),
          Text(
            'Hello Huzaifa!',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 102), // Dim Yellow
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Watch Your favourite movies',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          CircleAvatar(
            backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Fvector-art%2F10054157-chat-bot-robot-avatar-in-circle-round-shape-isolated-on-white-background-stock-vector-illustration-ai-technology-futuristic-helper-communication-conversation-concept-in-flat-style&psig=AOvVaw3MZK988AuFZPBeB2CWx5Y7&ust=1692296795457000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCMC8tYLn4YADFQAAAAAdAAAAABAD'),
            radius: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: Colors.black38,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromARGB(255, 255, 255, 102), // Dim Yellow
            size: 24,
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: Color.fromARGB(255, 255, 255, 102), // Dim Yellow
            size: 24,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildImageSection(String imageUrl) {
    return Center(
      child: Image.asset(imageUrl),
    );
  }

  Widget _buildHorizontalImageList(List<String> imageUrls) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: imageUrls.map((imageUrl) {
          return Container(
            width: 130,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    const List<BottomNavigationBarItem> bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favorite',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.download_for_offline),
        label: 'Downloads',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavBarItems,
    );
  }
}
