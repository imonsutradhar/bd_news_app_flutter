import 'package:flutter/material.dart';
import 'news_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";

  void triggerSearch() {
    if (searchController.text.isNotEmpty) {
      setState(() {
        searchText = searchController.text;
      });
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.redAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.redAccent,
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search here (e.g. Messi, Bitcoin)...",
                hintStyle: const TextStyle(color: Colors.white70),

                prefixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      searchText = "";
                    });
                  },
                ),

                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white, size: 30),
                  onPressed: triggerSearch,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
              ),
              onSubmitted: (value) => triggerSearch(),
            ),
          ),

          Expanded(
            child: searchText.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.manage_search, size: 100, color: Colors.grey),
                  SizedBox(height: 10),
                  Text("Search for any topic...", style: TextStyle(color: Colors.grey, fontSize: 18)),
                ],
              ),
            )
                : NewsPage(
              key: ValueKey(searchText), // কীওয়ার্ড চেঞ্জ হলে নিউজ রিফ্রেশ হবে
              query: searchText,
            ),
          ),
        ],
      ),
    );
  }
}