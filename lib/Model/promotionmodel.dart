class PromotionItem {
  String? images;
  String? promotionimages;
  String? offertext;
  String? offerpercentage;
  String? flashname;
  String? flashmainprice;
  String? flashofferprice;
  String? flashavailable;
  String? flashlocation;

  PromotionItem({
    required this.images,
    required this.promotionimages,
    required this.offerpercentage,
    required this.offertext,
    required this.flashname,
    required this.flashmainprice,
    required this.flashofferprice,
    required this.flashavailable,
    required this.flashlocation,
  });
}

//week promotion data's

List<PromotionItem> promotionitem = [
  PromotionItem(
    images: 'assets/promotions/cosmetics.webp',
    flashname: "Cosmetics items",
    flashmainprice: '₹1020',
    flashofferprice: '₹890',
    flashavailable: '11 Available',
    flashlocation: 'India',
    promotionimages: 'assets/promotions/mens1.webp',
    offerpercentage: '40%',
    offertext: 'Discount ',
  ),
  PromotionItem(
      images: 'assets/promotions/gaminglap.jpg',
      flashname: "Apple Macbook pro 13 with Touch Bar",
      flashmainprice: '₹400000',
      flashofferprice: '₹300000',
      flashavailable: '4 Available',
      flashlocation: 'USA',
      promotionimages: 'assets/promotions/womensdress.webp',
      offerpercentage: '30%',
      offertext: 'Discount '),
  PromotionItem(
      images: 'assets/promotions/mismartjpg.jpg',
      flashname: "Mi Smart phone",
      flashmainprice: '₹14000',
      flashofferprice: '₹10100',
      flashavailable: '23 Available',
      flashlocation: 'India',
      promotionimages: 'assets/promotions/tv.webp',
      offerpercentage: '50%',
      offertext: 'Discount '),
  PromotionItem(
      images: 'assets/promotions/mi7pro.webp',
      flashname: "Mi 7 Pro Smart phone",
      flashmainprice: '₹15000',
      flashofferprice: '₹11100',
      flashavailable: '6 Available',
      flashlocation: 'India',
      promotionimages: 'assets/promotions/furniture.jpg',
      offerpercentage: '20%',
      offertext: 'Discount '),
  PromotionItem(
      images: 'assets/promotions/Mismart.webp',
      flashname: "Mi Smart phone",
      flashmainprice: '₹20000',
      flashofferprice: '₹12700',
      flashavailable: '23 Available',
      flashlocation: 'India',
      promotionimages: 'assets/promotions/watches.webp',
      offerpercentage: '60%',
      offertext: 'Discount '),
  PromotionItem(
      images: 'assets/promotions/SprayforMen.jpg',
      flashname: "Mens normal Spray and Body Sprey combo",
      flashmainprice: '₹900',
      flashofferprice: '₹700',
      flashavailable: '45 Available',
      flashlocation: 'Dubai',
      promotionimages: 'assets/promotions/spray.jpg',
      offerpercentage: '10%',
      offertext: 'Discount '),
  PromotionItem(
      images: 'assets/promotions/ipad.png',
      flashname: "Ipad ",
      flashmainprice: '₹120000',
      flashofferprice: '₹100999',
      flashavailable: '9 Available',
      flashlocation: 'Korea',
      promotionimages: 'assets/promotions/sports-1.webp',
      offerpercentage: '25%',
      offertext: 'Discount '),
];
