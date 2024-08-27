import 'package:evaluation_app/features/domain/entity/grocery.dart';

// OptionModel class
class OptionModel extends Option {
  const OptionModel({
    required String id,
    required String name,
    required double price,
  }) : super(
          id: id,
          name: name,
          price: price,
        );

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  @override
  Option toEntity() => Option(
        id: id,
        name: name,
        price: price,
      );

  static List<Option> listToEntity(List<OptionModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}

// GroceryModel class
class GroceryModel extends Grocery {
  const GroceryModel({
    required String id,
    required String title,
    required String imageUrl,
    required double rating,
    required double price,
    required double discount,
    required String description,
    required List<Option> options,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          rating: rating,
          price: price,
          discount: discount,
          description: description,
          options: options,
        );

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    var optionsFromJson = (json['options'] as List)
        .map((optionJson) => OptionModel.fromJson(optionJson))
        .toList();

    return GroceryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      description: json['description'] as String,
      options: optionsFromJson,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options': options.map((option) => (option as OptionModel).toJson()).toList(),
    };
  }

  @override
  Grocery toEntity() => Grocery(
        id: id,
        title: title,
        imageUrl: imageUrl,
        rating: rating,
        price: price,
        discount: discount,
        description: description,
        options: OptionModel.listToEntity(options.map((e) => e as OptionModel).toList()),
      );

  static List<Grocery> listToEntity(List<GroceryModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
