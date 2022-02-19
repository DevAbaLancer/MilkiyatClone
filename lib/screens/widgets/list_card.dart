import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String? imageUrl;
  final String? saleRentTag;
  final String? titleCard;
  final String? descriptionCard;
  final String? descTag1;
  final String? descTag2;
  final String? locationCard;
  final String imageError =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/2048px-No_image_available.svg.png';
  const ListCard(
      {Key? key,
      this.imageUrl,
      this.saleRentTag,
      this.titleCard,
      this.descriptionCard,
      this.descTag1,
      this.descTag2,
      this.locationCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textThemeCustome = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      height: 400,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade900,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                    image: DecorationImage(
                        image: NetworkImage(imageUrl ?? imageError),
                        fit: BoxFit.fill)),
                height: 100,
                width: 250,
              ),
              Positioned(
                bottom: 5,
                right: 3,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'FOR ${saleRentTag.toString().split('.').last}',
                      style: textThemeCustome.headline3,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  titleCard ?? '',
                  style: textThemeCustome.headline3!.copyWith(fontSize: 15),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    size: 20,
                    color: Colors.white,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
            child: Text(
              descriptionCard ?? '',
              style: textThemeCustome.headline4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(3.0),
                child: Text(
                  descTag1.toString().split('.').last,
                  style: textThemeCustome.headline3,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Text(
                      descTag2 ?? '',
                      style: textThemeCustome.headline3,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.remove_red_eye,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
              child: Icon(
                Icons.pin_drop,
                size: 15,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
              child: Text(
                locationCard ?? '',
                style: textThemeCustome.headline4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
