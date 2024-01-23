import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String cardText;
  final String year;

  const ImageCard(
      {super.key,
      required this.imageUrl,
      required this.cardText,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.0), bottom: Radius.circular(8.0)),
      onTap: () => print('Ripple'),
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8.0), bottom: Radius.circular(8.0)),
              child:
                  // Use ColorFiltered to apply a color filter to the image
                  ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black
                      .withOpacity(0.5), // Adjust the opacity for darkness
                  BlendMode.darken,
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 200.0, // Set the desired height for the image
                ),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          221, 224, 224, 224), // Darker color for the year
                    ),
                  ), // Add some space between the texts
                  Text(
                    cardText,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color set to white
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
