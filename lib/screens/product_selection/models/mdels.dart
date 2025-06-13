import 'dart:convert';

VendorCategoryModel vendorCategoryModelFromJson(String x) =>
    VendorCategoryModel.fromJson(jsonDecode(x));



class VendorCategoryModel {
  String? message;
  List<Data>? data;

  VendorCategoryModel({this.message, this.data});

  VendorCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  List<Products>? products;
  String? createdAt;

  Data({this.id, this.name, this.description, this.products, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? price;
  Null? discountPrice;
  String? stock;
  List<String>? preparationSteps;
  Null? rating;
  String? imageUrl;
  List<Ingredients>? ingredients;
  String? createdAt;

  Products(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.discountPrice,
      this.stock,
      this.preparationSteps,
      this.rating,
      this.imageUrl,
      this.ingredients,
      this.createdAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discountPrice = json['discount_price'];
    stock = json['stock'];
    preparationSteps = json['preparation_steps'].cast<String>();
    rating = json['rating'];
    imageUrl = json['image_url'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['stock'] = this.stock;
    data['preparation_steps'] = this.preparationSteps;
    data['rating'] = this.rating;
    data['image_url'] = this.imageUrl;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Ingredients {
  int? id;
  String? name;
  String? description;
  String? price;
  String? unit;
  String? stock;
  Null? imageUrl;
  String? createdAt;

  Ingredients(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.unit,
      this.stock,
      this.imageUrl,
      this.createdAt});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    unit = json['unit'];
    stock = json['stock'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['unit'] = this.unit;
    data['stock'] = this.stock;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    return data;
  }
}
