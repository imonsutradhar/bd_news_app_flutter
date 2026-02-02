import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'news_details.dart';

class NewsPage extends StatefulWidget {
  final String query; // Ei variable ta category-r nam nibe (e.g., "sports")

  const NewsPage({super.key, required this.query});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    String apiKey = "bb2ef55792da40dc928077f131bc5517";
    // Ekhane 'widget.query' use korchi jate alada category search kora jay
    String url = "https://newsapi.org/v2/everything?q=${widget.query}&sortBy=publishedAt&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        if (mounted) { // Page close hole jeno error na dey
          setState(() {
            articles = decodedData['articles'];
            isLoading = false;
          });
        }
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsScreen(article: article)));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, spreadRadius: 2, offset: const Offset(0, 3))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: article['urlToImage'] != null
                      ? CachedNetworkImage(
                    imageUrl: article['urlToImage'],
                    height: 200, width: double.infinity, fit: BoxFit.cover,
                    placeholder: (context, url) => Container(height: 200, color: Colors.grey[200]),
                    errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                  )
                      : Container(height: 200, color: Colors.grey[200], child: const Icon(Icons.image)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(article['title'] ?? "No Title", maxLines: 2, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}