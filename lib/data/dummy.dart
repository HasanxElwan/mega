import '../models/address_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

/// BANERS
List<String> banersData = [
  'https://img.freepik.com/free-vector/black-friday-sale-banner-with-limited-time-offer-details_1017-28051.jpg?w=2000',
  'https://i0.wp.com/bukhamsen.com/wp-content/uploads/2020/01/Web-Banner-Exclusive-Offers-1920x600-1.gif?fit=1200%2C375&ssl=1',
  'https://mostaql.hsoubcdn.com/uploads/portfolios/367430/62a25558374ae/01.png'
];

/// CATEGORY
List<CategoryModel> categoriesData = [
  CategoryModel(
      image:
          'https://2allk-fen.com/wp-content/uploads/2022/02/Fatafeat-24sept-article2_756316-1.png',
      categoryName: 'Category Name'),
  CategoryModel(
      image:
          'https://m2.mestores.com/pub/media/catalog/category/Artboard_5_copy_27.png',
      categoryName: 'Category Name'),
  CategoryModel(
      image:
          'https://www.mexatk.com/wp-content/uploads/2016/08/%D8%A7%D8%AF%D9%88%D8%A7%D8%AA-%D9%85%D9%86%D8%B2%D9%84%D9%8A%D9%87-%D9%84%D9%84%D9%85%D8%B7%D8%A8%D8%AE-%D8%A8%D8%A7%D9%84%D8%B5%D9%88%D8%B1-1-1.jpg',
      categoryName: 'Category Name'),
];

/// ITEMS
List<ProductModel> productsData = [
  ProductModel(
      id: 1,
      name: 'HP 255 G8 Laptop',
      image: 'https://m.media-amazon.com/images/I/81PXHmO+KeL._AC_SX569_.jpg',
      price: 9777,
      oldPrice: 12463,
      discount: 20,
      isFavourite: false,
      inCart: false,
      quantity: 0,
      details:
          'HP 255 G8 Laptop - Ryzen 5 3500U, 8 GB RAM, 1 TB HDD, AMD Radeon Vega 8 Graphics, 15.6-Inch HD, DOS - Asteroid silver Good Quality with a high end HP 255 G8 Laptop - Ryzen 5 3500U, 8 GB RAM, 1 TB HDD, AMD Radeon Vega 8 Graphics, 15.6-Inch HD, DOS - Asteroid silver Easy to use Personal Computer type',
      imageList: [
        'https://m.media-amazon.com/images/I/31GyOM5XZ3L._AC_.jpg',
        'https://m.media-amazon.com/images/I/31bHB6xhqVL._AC_.jpg',
        'https://m.media-amazon.com/images/I/31kM7YzCY-L._AC_.jpg',
        'https://m.media-amazon.com/images/I/11RQSJsQzaL._AC_.jpg'
      ],
      rate: 4.5,
      review: [
        Review(
          name: 'Hasan Elwan',
          image:
              'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          rate: 4,
          review: 'The best product',
          date: 'January1, 2023',
        ),
      ]),
  ProductModel(
      id: 2,
      name: 'Oppo A55 4GB RAM, 128GB - STARRY BALCK',
      image: 'https://m.media-amazon.com/images/I/71qtoX2dbyL._AC_SX569_.jpg',
      price: 7000,
      oldPrice: 7000,
      discount: 0,
      isFavourite: false,
      inCart: false,
      quantity: 0,
      details:
          'Oppo A55 4GB RAM, 128GB - STARRY BALCK Oppo A55 4GB RAM, 128GB - STARRY BALCK Oppo A55 4GB RAM, 128GB - STARRY BALCK',
      imageList: [
        'https://m.media-amazon.com/images/I/71qtoX2dbyL._AC_SX569_.jpg',
        'https://m.media-amazon.com/images/I/61571qQePRL._AC_SX569_.jpg',
        'https://m.media-amazon.com/images/I/61571qQePRL._AC_SX569_.jpg'
      ],
      rate: 4,
      review: [
        Review(
          name: 'Hasan Elwan',
          image:
              'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          rate: 4,
          review: 'The best product',
          date: 'January1, 2023',
        ),
      ]),
  ProductModel(
      id: 3,
      name: '2 in 1 Food Spoon Strainer',
      image: 'https://m.media-amazon.com/images/I/51mICO-LFLL._AC_SX569_.jpg',
      price: 60,
      oldPrice: 80,
      discount: 20,
      isFavourite: false,
      inCart: false,
      quantity: 0,
      details:
          '2 in 1 Food Spoon Strainer Stainless Steel Fried Food Oil-Frying Filter Spoon with Clip Kitchen Tool',
      imageList: [
        'https://m.media-amazon.com/images/I/51pOxW56bHL._AC_.jpg',
        'https://m.media-amazon.com/images/I/61jXnd4iueL._AC_.jpg',
      ],
      rate: 4,
      review: [
        Review(
          name: 'Hasan Elwan',
          image:
              'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          rate: 4,
          review: 'The best product',
          date: 'January1, 2023',
        ),
      ]),
  ProductModel(
      id: 4,
      name: 'Zercon Underwear',
      image: 'https://m.media-amazon.com/images/I/51W7+SRDHTL._AC_SX679_.jpg',
      price: 100,
      oldPrice: 100,
      discount: 0,
      isFavourite: false,
      inCart: false,
      quantity: 0,
      details:
          'Zercon Underwear Colored Set For Newborn Babies 11053 Zercon Underwear Colored Set For Newborn Babies 11053',
      imageList: [
        'https://m.media-amazon.com/images/I/51W7+SRDHTL._AC_SX679_.jpg',
        'https://m.media-amazon.com/images/I/61qbJASz5NL._AC_SX679_.jpg',
      ],
      rate: 4,
      review: [
        Review(
          name: 'Hasan Elwan',
          image:
              'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
          rate: 4,
          review: 'The best product',
          date: 'January1, 2023',
        ),
      ]),
];

// ADDRESSES
List<AddressModel> addressesData = [
  AddressModel(
      title: 'Hasan',
      details: 'MeetAssas/Samannoud/Gharbia',
      phone: '+201060336156'),
];
