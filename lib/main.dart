import 'package:flutter/material.dart';
import 'news_page.dart'; // Import kora holo

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( // Tab control korar jonno
      length: 4, // Amra 4 ta category rakhbo
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BD News 24", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true, // Tab beshi hole scroll kora jabe
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "All News"),
              Tab(text: "Cricket"),
              Tab(text: "Business"),
              Tab(text: "Tech"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // 1. All News (Bangladesh)
            NewsPage(query: "bangladesh"),

            // 2. Cricket (Bangladesh Cricket)
            NewsPage(query: "bangladesh cricket"),

            // 3. Business (Bangladesh Economy)
            NewsPage(query: "bangladesh economy"),

            // 4. Tech (Global Tech or BD Tech)
            NewsPage(query: "technology"),
          ],
        ),
      ),
    );
  }
}