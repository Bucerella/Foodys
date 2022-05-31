import 'package:foodys_app/model/categories.dart';
import 'package:foodys_app/model/products.dart';

class Datas {
  static List<Categories> categoryList = [
    Categories(
      1,
      "Sandwiches",
      "https://simply-delicious-food.com/wp-content/uploads/2020/07/Easy-salad-sandwiches-with-herb-mayo-5.jpg",
    ),
    Categories(
      2,
      "Soups",
      "https://insanelygoodrecipes.com/wp-content/uploads/2021/06/Bowl-of-Vegetarian-Soup-Carrot-Tomato-and-Spinach-Soup.jpg",
    ),
    Categories(
      3,
      "Salads",
      "https://hips.hearstapps.com/hmg-prod/images/avocado-salad-1524672116.png",
    ),
    Categories(
      4,
      "Coffees",
      "https://images.deliveryhero.io/image/fd-tr/LH/ays0-hero.jpg",
    ),
  ];

  static List<Products> productsList = [
    ///Sandwiches Categories Items
    Products(
      1,
      "Grilled cheese",
      "Take the cheese toastie to another level with this four-cheese grilled sandwich – a tasty mix of ricotta, parmesan, mozzarella and gorgonzola on white bread",
      6.5,
      1,
      "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/quatro-fromaggi-grilled-cheese-5306c9c.jpg?quality=90&webp=true&resize=440,400",
      true,
      "Sandwiches",
    ),
    Products(
      2,
      "Turkish Sandwich",
      "Bread, Cheese, Sliced turkye meat, Optional Extras - leaf lettuce, romain lettuce, tomato, cucumber, avocado, or bacon.",
      10.50,
      1,
      "https://www.valyastasteofhome.com/wp-content/uploads/2022/01/Turkey-Sandwich-Recipe.jpg",
      true,
      "Sandwiches",
    ),

    ///Soup Categories Items
    Products(
      3,
      "Tomato Soup",
      "This classic tomato soup recipe is full of bold flavor: easy to make and perfectly seasoned! Serve with grilled cheese for a cozy meal.",
      10.0,
      2,
      "https://www.acouplecooks.com/wp-content/uploads/2021/09/Tomato-Soup-002s.jpg",
      true,
      "Soups",
    ),
    Products(
      4,
      "Broccoli Soups",
      "An easy foolproof recipe for cream of broccoli soup with heavy cream and Parmesan.",
      9.90,
      2,
      "https://healthyrecipesblogs.com/wp-content/uploads/2015/12/cream-of-broccoli-soup-featured-2022.jpg",
      true,
      "Soups",
    ),
    Products(
      5,
      "Spicy Mexico Bean",
      "This hearty, warming Mexican bean soup uses basic store cupboard ingredients and is cooked from scratch in the microwave. Add extra chilli powder for a spicy kick.",
      7.90,
      2,
      "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/spicy_mexican_bean_soup_91809_16x9.jpg",
      true,
      "Soups",
    ),

    ///Salads Category Items
    Products(
      6,
      "Caesar Salad",
      "Caesar Salad very delicious",
      3.20,
      3,
      "https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/Quick-Chicken-Caesar-Salad_EXPS_FTTMZ21_12217_E03_05_4b.jpg",
      true,
      "Salads",
    ),
    Products(
      7,
      "Indian Salad",
      "Indian Salad very delicious and This spicy, tangy Indian salad, also known as kachumber is delicious served with raan lamb or curry. ",
      3.20,
      3,
      "https://food-images.files.bbci.co.uk/food/recipes/indian_salad_74172_16x9.jpg",
      true,
      "Salads",
    ),
    Products(
      8,
      "Rice Salad",
      "This colourful rice salad gives you different flavours and textures in every mouthful. It really doesn’t take long to make, but you do have to let the rice cool after cooking, and then leave the salad to chill for an hour to allow all the flavours to mingle. Perfect for a picnic or party table. ",
      12.20,
      3,
      "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/rice_salad_86761_16x9.jpg",
      true,
      "Salads",
    ),

    ///Coffee Category Items
    Products(
      9,
      "Coffee Latte",
      "Healthy milk & coffee",
      5.55,
      4,
      "https://i0.wp.com/bikafein.com/wp-content/uploads/2021/04/image.jpg?resize=534%2C374&ssl=1",
      true,
      "Coffee Lover",
    ),
    Products(
      9,
      "Esspresso",
      "Made with your choice of meat, onion, egg, scallions and rice. Choose from: Chicken, Pork, and Shrimp. Combination includes: Chicken, Pork, and Shrimp.",
      3.70,
      4,
      "https://www.tchiboblog.com.tr/wp-content/uploads/2019/02/Resim10-1200x900.jpg",
      true,
      "Coffee Lover",
    ),
  ];
}
