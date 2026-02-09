import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'article_view.dart'; // <--- এই লাইনটা জরুরি

class NewsDetailsScreen extends StatelessWidget {
  final dynamic article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            article['urlToImage'] != null
                ? CachedNetworkImage(
              imageUrl: article['urlToImage'],
              width: double.infinity, height: 250, fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.broken_image),
            )
                : Container(height: 250, color: Colors.grey[200], child: const Icon(Icons.image)),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(article['title'] ?? "No Title", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  // Date
                  Text(article['publishedAt']?.substring(0, 10) ?? "", style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 20),

                  // Description
                  Text(article['description'] ?? "No Description", style: const TextStyle(fontSize: 16, height: 1.5)),
                  const SizedBox(height: 30),

                  // Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Button click action
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleView(blogUrl: article['url']),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: const Text("Read Full News", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}