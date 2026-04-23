import 'package:flutter/material.dart';
import 'news_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String selectedCategory = "General";

  // category list
  final List<String> categories = [
    "General",
    "Business",
    "Sports",
    "Technology",
    "Entertainment",
    "Health",
    "Science",
    "Politics",
    "Startup",
    "Bangladesh",
    "Cricket",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        iconTheme: const IconThemeData(color: Colors.white),

        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.redAccent,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.newspaper, size: 35, color: Colors.redAccent),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "BD News 24",
                    style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text("Select Category", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.arrow_right, color: Colors.redAccent),
                    title: Text(
                      categories[index],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      body: NewsPage(
        key: ValueKey(selectedCategory),
        query: selectedCategory == "General" ? "bangladesh" : selectedCategory,
      ),
    );
  }
}