import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String? imageUrl;
  final String cardText;
  final String year;
  final Function? onTap;
  final BoxConstraints constraints;

  const ImageCard(
      {super.key,
      required this.imageUrl,
      required this.cardText,
      required this.year,
      this.onTap, required this.constraints});

  @override
  Widget build(BuildContext context) {
    Widget loadImage(String? url) {
      if (url == null) {
        return Image.asset('assets/placeholder-car.jpg',
            fit: BoxFit.cover, height: 200.0, width: constraints.maxWidth,);
      } else {
        return Image.network(url, fit: BoxFit.cover, height: 200.0, width: constraints.maxWidth,);
      }
    };

    return InkWell(
      onTap: () => {
        if (onTap != null) {onTap!()}
      },
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8.0), bottom: Radius.circular(8.0)),
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8.0), bottom: Radius.circular(8.0)),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
                child: loadImage(imageUrl),
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
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 224, 224, 224),
                    ),
                  ),
                  Text(
                    cardText,
                    style: const TextStyle(
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
