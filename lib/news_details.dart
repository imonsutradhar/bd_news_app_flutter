import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Map article; // Ei variable ta data dhorbe

  // Constructor er maddhome data nibe
  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Details")),
      body: SingleChildScrollView( // News onek boro hote pare, tai scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Image
            article['urlToImage'] != null
                ? Image.network(article['urlToImage'], width: double.infinity, fit: BoxFit.cover)
                : Container(height: 200, color: Colors.grey, child: const Icon(Icons.image)),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Title
                  Text(
                    article['title'] ?? "No Title",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // 3. Date & Author
                  Text(
                    "Published at: ${article['publishedAt']}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),

                  // 4. Description / Content
                  Text(
                    article['description'] ?? "No Details Available",
                    style: const TextStyle(fontSize: 18, height: 1.5), // height line spacing baray
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}