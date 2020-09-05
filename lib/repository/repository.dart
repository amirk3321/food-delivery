import 'package:food_delivery/model/category_item_data_model.dart';
import 'package:food_delivery/model/onboarding_model.dart';
import 'package:food_delivery/model/populer_items_model.dart';

class FakeRepository {

  static List<OnBoardingDataModel> data = [
    OnBoardingDataModel(
      image: "assets/selectFood.json",
      title: "Select Food Items",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",),
    OnBoardingDataModel(
      image: "assets/food.json",
      title: "Order food you like",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",),
    OnBoardingDataModel(
      image: "assets/delivery_services.json",
      title: "Deliver to your home",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",),
  ];
  static List<CategoryItemDataModel> categoryItems=[
    CategoryItemDataModel(
      title: "Vegetables",image: "assets/Vegetables.png"
    ),
    CategoryItemDataModel(
        title: "Meat",image: "assets/meat.png",
    ),
    CategoryItemDataModel(
        title: "Chickens",image: "assets/chicken.png"
    ),
    CategoryItemDataModel(
        title: "Fish",image: "assets/healthy-food.png"
    ),
    CategoryItemDataModel(
        title: "Salad",image: "assets/salad.png"
    ),
    CategoryItemDataModel(
        title: "Soaps",image: "assets/soup.png",
    ),
    CategoryItemDataModel(
        title: "Breakfast",image: "assets/croissant.png"
    ),
    CategoryItemDataModel(
        title: "Desserts",image: "assets/sweet.png"
    ),
  ];

  static List<PopularItemModel> popularItems=[
    PopularItemModel(
      image: "assets/vegetablesMeat.png",
      title: "Vegetables Meat",
      rating: 4,
    ),
    PopularItemModel(
      image: "assets/sambalShrimp.png",
      title: "Sambal Shrimp",
      rating: 5,
    ),
    PopularItemModel(
      image: "assets/vegetablesMeat.png",
      title: "Vegetables Meat",
      rating: 4,
    ),
    PopularItemModel(
      image: "assets/sambalShrimp.png",
      title: "Sambal Shrimp",
      rating: 3,
    ),
    PopularItemModel(
      image: "assets/vegetablesMeat.png",
      title: "Vegetables Meat",
      rating: 4,
    ),
    PopularItemModel(
      image: "assets/sambalShrimp.png",
      title: "Sambal Shrimp",
      rating: 2,
    ),
    PopularItemModel(
      image: "assets/vegetablesMeat.png",
      title: "Vegetables Meat",
      rating: 4,
    ),
    PopularItemModel(
      image: "assets/sambalShrimp.png",
      title: "Sambal Shrimp",
      rating: 5,
    ),
  ];
}