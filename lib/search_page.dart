import 'package:flutter/material.dart';
import 'news_page.dart'; // NewsPage কে রি-ইউজ করছি

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String searchText = "";

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
          // 🔍 সার্চ বার (যেখানে লিখবে)
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.redAccent,
            child: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Type here (e.g. Bitcoin, Messi)...",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      searchText = "";
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
              ),
              onSubmitted: (value) {
                // এন্টার চাপলে সার্চ শুরু হবে
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          // 👇 রেজাল্ট দেখানো (NewsPage কে কল করা হচ্ছে)
          Expanded(
            child: searchText.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 80, color: Colors.grey),
                  SizedBox(height: 10),
                  Text("Search for any news!", style: TextStyle(color: Colors.grey, fontSize: 18)),
                ],
              ),
            )
                : NewsPage(
              key: ValueKey(searchText), // কীওয়ার্ড চেঞ্জ হলে রিফ্রেশ হবে
              query: searchText,
            ),
          ),
        ],
      ),
    );
  }
}