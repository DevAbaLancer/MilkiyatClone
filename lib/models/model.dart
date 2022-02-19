// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

class Model {
  Model({
    this.categories,
    this.data,
    this.transacts,
    this.backgroundImages,
  });

  List<CategoryElement>? categories;
  List<Datum>? data;
  List<Transact>? transacts;
  List<BackgroundImage>? backgroundImages;

  factory Model.fromRawJson(String str) => Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        categories: json["categories"] == null
            ? null
            : List<CategoryElement>.from(
                json["categories"].map((x) => CategoryElement.fromJson(x))),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        transacts: json["transacts"] == null
            ? null
            : List<Transact>.from(
                json["transacts"].map((x) => Transact.fromJson(x))),
        backgroundImages: json["background_images"] == null
            ? null
            : List<BackgroundImage>.from(json["background_images"]
                .map((x) => BackgroundImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "transacts": transacts == null
            ? null
            : List<dynamic>.from(transacts!.map((x) => x.toJson())),
        "background_images": backgroundImages == null
            ? null
            : List<dynamic>.from(backgroundImages!.map((x) => x.toJson())),
      };
}

class BackgroundImage {
  BackgroundImage({
    this.title,
    this.image,
    this.id,
  });

  String? title;
  String? image;
  int? id;

  factory BackgroundImage.fromRawJson(String str) =>
      BackgroundImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BackgroundImage.fromJson(Map<String, dynamic> json) =>
      BackgroundImage(
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "id": id == null ? null : id,
      };
}

class CategoryElement {
  CategoryElement({
    this.name,
    this.slug,
    this.icon,
  });

  CategoryName? name;
  CategorySlugEnum? slug;
  String? icon;

  factory CategoryElement.fromRawJson(String str) =>
      CategoryElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryElement.fromJson(Map<String, dynamic> json) =>
      CategoryElement(
        name:
            json["name"] == null ? null : categoryNameValues.map![json["name"]],
        slug: json["slug"] == null
            ? null
            : categorySlugEnumValues.map![json["slug"]],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : categoryNameValues.reverse![name],
        "slug": slug == null ? null : categorySlugEnumValues.reverse![slug],
        "icon": icon == null ? null : icon,
      };
}

enum CategoryName { LAND_PLOT, HOUSES, COMMERCIAL, APARTMENTS, PG_GUEST_HOUSES }

final categoryNameValues = EnumValues({
  "Apartments": CategoryName.APARTMENTS,
  "Commercial": CategoryName.COMMERCIAL,
  "Houses": CategoryName.HOUSES,
  "Land & Plot": CategoryName.LAND_PLOT,
  "PG & Guest Houses": CategoryName.PG_GUEST_HOUSES
});

enum CategorySlugEnum {
  LANDPLOT,
  HOUSEVILLA,
  COMMERCIAL,
  APARTMENTS,
  PG_GUEST_HOUSES
}

final categorySlugEnumValues = EnumValues({
  "apartments": CategorySlugEnum.APARTMENTS,
  "commercial": CategorySlugEnum.COMMERCIAL,
  "housevilla": CategorySlugEnum.HOUSEVILLA,
  "landplot": CategorySlugEnum.LANDPLOT,
  "pg-guest-houses": CategorySlugEnum.PG_GUEST_HOUSES
});

class Datum {
  Datum({
    this.type,
    this.items,
    this.title,
    this.summary,
    this.icon,
    this.twoLine,
    this.seeAll,
  });

  String? type;
  List<Item>? items;
  String? title;
  String? summary;
  int? icon;
  bool? twoLine;
  String? seeAll;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"] == null ? null : json["type"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        title: json["title"] == null ? null : json["title"],
        summary: json["summary"] == null ? null : json["summary"],
        icon: json["icon"] == null ? null : json["icon"],
        twoLine: json["two_line"] == null ? null : json["two_line"],
        seeAll: json["see_all"] == null ? null : json["see_all"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "title": title == null ? null : title,
        "summary": summary == null ? null : summary,
        "icon": icon == null ? null : icon,
        "two_line": twoLine == null ? null : twoLine,
        "see_all": seeAll == null ? null : seeAll,
      };
}

class Item {
  Item({
    this.title,
    this.image,
    this.link,
    this.minPrice,
    this.price,
    this.listingId,
    this.createdSince,
    this.updatedSince,
    this.category,
    this.categorySlug,
    this.slug,
    this.attributes,
    this.thumbnail,
    this.isSpam,
    this.isPremium,
    this.isVerified,
    this.expiryDate,
    this.offer,
    this.isChatAllowed,
    this.isOffensive,
    this.isAuction,
    this.outKashmir,
    this.viewers,
    this.status,
    this.locality,
    this.city,
    this.posted,
    this.transact,
    this.inWishlist,
  });

  String? title;
  String? image;
  String? link;
  double? minPrice;
  double? price;
  String? listingId;
  String? createdSince;
  String? updatedSince;
  ItemCategory? category;
  CategorySlugEnum? categorySlug;
  String? slug;
  List<Attribute>? attributes;
  String? thumbnail;
  bool? isSpam;
  bool? isPremium;
  bool? isVerified;
  ExpiryDate? expiryDate;
  dynamic offer;
  bool? isChatAllowed;
  bool? isOffensive;
  bool? isAuction;
  bool? outKashmir;
  int? viewers;
  Status? status;
  String? locality;
  String? city;
  int? posted;
  Transact? transact;
  bool? inWishlist;

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        link: json["link"] == null ? null : json["link"],
        minPrice: json["min_price"] == null ? null : json["min_price"],
        price: json["price"] == null ? null : json["price"],
        listingId: json["listing_id"] == null ? null : json["listing_id"],
        createdSince:
            json["created_since"] == null ? null : json["created_since"],
        updatedSince:
            json["updated_since"] == null ? null : json["updated_since"],
        category: json["category"] == null
            ? null
            : ItemCategory.fromJson(json["category"]),
        categorySlug: json["category_slug"] == null
            ? null
            : categorySlugEnumValues.map![json["category_slug"]],
        slug: json["slug"] == null ? null : json["slug"],
        attributes: json["attributes"] == null
            ? null
            : List<Attribute>.from(
                json["attributes"].map((x) => Attribute.fromJson(x))),
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        isSpam: json["is_spam"] == null ? null : json["is_spam"],
        isPremium: json["is_premium"] == null ? null : json["is_premium"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        expiryDate: json["expiry_date"] == null
            ? null
            : expiryDateValues.map![json["expiry_date"]],
        offer: json["offer"],
        isChatAllowed:
            json["is_chat_allowed"] == null ? null : json["is_chat_allowed"],
        isOffensive: json["is_offensive"] == null ? null : json["is_offensive"],
        isAuction: json["is_auction"] == null ? null : json["is_auction"],
        outKashmir: json["out_kashmir"] == null ? null : json["out_kashmir"],
        viewers: json["viewers"] == null ? null : json["viewers"],
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        locality: json["locality"] == null ? null : json["locality"],
        city: json["city"] == null ? null : json["city"],
        posted: json["posted"] == null ? null : json["posted"],
        transact: json["transact"] == null
            ? null
            : Transact.fromJson(json["transact"]),
        inWishlist: json["in_wishlist"] == null ? null : json["in_wishlist"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "link": link == null ? null : link,
        "min_price": minPrice == null ? null : minPrice,
        "price": price == null ? null : price,
        "listing_id": listingId == null ? null : listingId,
        "created_since": createdSince == null ? null : createdSince,
        "updated_since": updatedSince == null ? null : updatedSince,
        "category": category == null ? null : category!.toJson(),
        "category_slug": categorySlug == null
            ? null
            : categorySlugEnumValues.reverse![categorySlug],
        "slug": slug == null ? null : slug,
        "attributes": attributes == null
            ? null
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "thumbnail": thumbnail == null ? null : thumbnail,
        "is_spam": isSpam == null ? null : isSpam,
        "is_premium": isPremium == null ? null : isPremium,
        "is_verified": isVerified == null ? null : isVerified,
        "expiry_date":
            expiryDate == null ? null : expiryDateValues.reverse![expiryDate],
        "offer": offer,
        "is_chat_allowed": isChatAllowed == null ? null : isChatAllowed,
        "is_offensive": isOffensive == null ? null : isOffensive,
        "is_auction": isAuction == null ? null : isAuction,
        "out_kashmir": outKashmir == null ? null : outKashmir,
        "viewers": viewers == null ? null : viewers,
        "status": status == null ? null : statusValues.reverse![status],
        "locality": locality == null ? null : locality,
        "city": city == null ? null : city,
        "posted": posted == null ? null : posted,
        "transact": transact == null ? null : transact!.toJson(),
        "in_wishlist": inWishlist == null ? null : inWishlist,
      };
}

class Attribute {
  Attribute({
    this.id,
    this.key,
    this.keyId,
    this.value,
    this.required,
    this.ordering,
    this.unit,
  });

  int? id;
  String? key;
  int? keyId;
  String? value;
  bool? required;
  int? ordering;
  String? unit;

  factory Attribute.fromRawJson(String str) =>
      Attribute.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"] == null ? null : json["id"],
        key: json["key"] == null ? null : json["key"],
        keyId: json["key_id"] == null ? null : json["key_id"],
        value: json["value"] == null ? null : json["value"],
        required: json["required"] == null ? null : json["required"],
        ordering: json["ordering"] == null ? null : json["ordering"],
        unit: json["unit"] == null ? null : json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "key": key == null ? null : key,
        "key_id": keyId == null ? null : keyId,
        "value": value == null ? null : value,
        "required": required == null ? null : required,
        "ordering": ordering == null ? null : ordering,
        "unit": unit == null ? null : unit,
      };
}

class ItemCategory {
  ItemCategory({
    this.name,
    this.slug,
    this.id,
    this.description,
    this.icon,
  });

  CategoryName? name;
  CategorySlugEnum? slug;
  int? id;
  Description? description;
  String? icon;

  factory ItemCategory.fromRawJson(String str) =>
      ItemCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemCategory.fromJson(Map<String, dynamic> json) => ItemCategory(
        name:
            json["name"] == null ? null : categoryNameValues.map![json["name"]],
        slug: json["slug"] == null
            ? null
            : categorySlugEnumValues.map![json["slug"]],
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null
            ? null
            : descriptionValues.map![json["description"]],
        icon: json["icon"] == null ? null : json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : categoryNameValues.reverse![name],
        "slug": slug == null ? null : categorySlugEnumValues.reverse![slug],
        "id": id == null ? null : id,
        "description": description == null
            ? null
            : descriptionValues.reverse![description],
        "icon": icon == null ? null : icon,
      };
}

enum Description {
  EMPTY_LANDS,
  INDIVIDUAL_HOUSE,
  SHOPS_OFFICES_BUILDINGS_ETC,
  FLATS_APARTMENTS_AND_PENTHOUSES
}

final descriptionValues = EnumValues({
  "Empty Lands": Description.EMPTY_LANDS,
  "Flats, Apartments and Penthouses.":
      Description.FLATS_APARTMENTS_AND_PENTHOUSES,
  "Individual House": Description.INDIVIDUAL_HOUSE,
  "Shops, Offices, buildings, etc.": Description.SHOPS_OFFICES_BUILDINGS_ETC
});

enum ExpiryDate { NONE }

final expiryDateValues = EnumValues({"None": ExpiryDate.NONE});

enum Status { APPROVED, PENDING_FOR_APPROVAL, RETIRED_REMOVED }

final statusValues = EnumValues({
  "Approved": Status.APPROVED,
  "Pending for Approval": Status.PENDING_FOR_APPROVAL,
  "Retired/Removed": Status.RETIRED_REMOVED
});

class Transact {
  Transact({
    this.name,
    this.id,
    this.slug,
    this.labelSeller,
    this.labelBuyer,
    this.icon,
    this.priceUnit,
  });

  TransactName? name;
  int? id;
  TransactSlug? slug;
  LabelSeller? labelSeller;
  LabelBuyer? labelBuyer;
  String? icon;
  PriceUnit? priceUnit;

  factory Transact.fromRawJson(String str) =>
      Transact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transact.fromJson(Map<String, dynamic> json) => Transact(
        name:
            json["name"] == null ? null : transactNameValues.map![json["name"]],
        id: json["id"] == null ? null : json["id"],
        slug:
            json["slug"] == null ? null : transactSlugValues.map![json["slug"]],
        labelSeller: json["label_seller"] == null
            ? null
            : labelSellerValues.map![json["label_seller"]],
        labelBuyer: json["label_buyer"] == null
            ? null
            : labelBuyerValues.map![json["label_buyer"]],
        icon: json["icon"] == null ? null : json["icon"],
        priceUnit: json["price_unit"] == null
            ? null
            : priceUnitValues.map![json["price_unit"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : transactNameValues.reverse![name],
        "id": id == null ? null : id,
        "slug": slug == null ? null : transactSlugValues.reverse![slug],
        "label_seller": labelSeller == null
            ? null
            : labelSellerValues.reverse![labelSeller],
        "label_buyer":
            labelBuyer == null ? null : labelBuyerValues.reverse![labelBuyer],
        "icon": icon == null ? null : icon,
        "price_unit":
            priceUnit == null ? null : priceUnitValues.reverse![priceUnit],
      };
}

enum LabelBuyer { BUY, RENT }

final labelBuyerValues =
    EnumValues({"Buy": LabelBuyer.BUY, "Rent": LabelBuyer.RENT});

enum LabelSeller { SALE, RENT }

final labelSellerValues =
    EnumValues({"Rent": LabelSeller.RENT, "Sale": LabelSeller.SALE});

enum TransactName { SELL, RENT }

final transactNameValues =
    EnumValues({"Rent": TransactName.RENT, "Sell": TransactName.SELL});

enum PriceUnit { MONTH }

final priceUnitValues = EnumValues({"month": PriceUnit.MONTH});

enum TransactSlug { SELL, RENT }

final transactSlugValues =
    EnumValues({"rent": TransactSlug.RENT, "sell": TransactSlug.SELL});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
