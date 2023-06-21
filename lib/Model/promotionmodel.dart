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
    images:
        'https://images.pexels.com/photos/3800060/pexels-photo-3800060.jpeg?cs=srgb&dl=pexels-oleksandr-pidvalnyi-3800060.jpg&fm=jpg',
    flashname: "Cosmetics items",
    flashmainprice: '₹1020',
    flashofferprice: '₹890',
    flashavailable: '11 Available',
    flashlocation: 'India',
    promotionimages:
        'https://www.cosmeticsdesign-europe.com/var/wrbm_gb_food_pharma/storage/images/5/3/9/3/403935-1-eng-GB/The-future-of-beauty-tools-accessories-and-textures.jpg',
    offerpercentage: '40%',
    offertext: 'Discount ',
  ),
  PromotionItem(
      images:
          'https://i.pcmag.com/imagery/reviews/038Dr5TVEpwIv8rCljx6UcF-14.fit_lim.size_1050x591.v1588802180.jpg',
      flashname: "Apple Macbook pro 13 with Touch Bar",
      flashmainprice: '₹400000',
      flashofferprice: '₹300000',
      flashavailable: '4 Available',
      flashlocation: 'USA',
      promotionimages:
          'https://i.pcmag.com/imagery/reviews/038Dr5TVEpwIv8rCljx6UcF-14.fit_lim.size_1050x591.v1588802180.jpg',
      offerpercentage: '30%',
      offertext: 'Discount '),
  PromotionItem(
      images:
          'https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-mi-cc9-pro-1.jpg',
      flashname: "Mi Smart phone",
      flashmainprice: '₹14000',
      flashofferprice: '₹10100',
      flashavailable: '23 Available',
      flashlocation: 'India',
      promotionimages:
          'https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-mi-cc9-pro-1.jpg',
      offerpercentage: '50%',
      offertext: 'Discount '),
  PromotionItem(
      images:
          'https://5.imimg.com/data5/SELLER/Default/2022/9/QU/OJ/LX/53877097/mi-redmi-note-7-pro-4gb-64gb-mobile-phone.jpg',
      flashname: "Mi 7 Pro Smart phone",
      flashmainprice: '₹15000',
      flashofferprice: '₹11100',
      flashavailable: '6 Available',
      flashlocation: 'India',
      promotionimages:
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201901/redmi_note_7_1_3.jpeg?VersionId=mOTU3598mwTNuqu7GnMWqvKuvzJ1KfUK&size=690:388',
      offerpercentage: '20%',
      offertext: 'Discount '),
  PromotionItem(
      images:
          'https://i01.appmifile.com/webfile/globalimg/in/cms/0CA97AFF-F5FB-BB8C-F0AB-81F4DDC06E3B!800x800!85.jpg',
      flashname: "Mi Smart phone",
      flashmainprice: '₹20000',
      flashofferprice: '₹12700',
      flashavailable: '23 Available',
      flashlocation: 'India',
      promotionimages:
          'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1672876160.50773273!500x500.jpg',
      offerpercentage: '60%',
      offertext: 'Discount '),
  PromotionItem(
      images:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEOdcaBZGLWaVrBCFvGnDoBJfIANMhIceWHg&usqp=CAU',
      flashname: "Mens normal Spray and Body Sprey combo",
      flashmainprice: '₹900',
      flashofferprice: '₹700',
      flashavailable: '45 Available',
      flashlocation: 'Dubai',
      promotionimages:
          'https://cossouq.com/media/catalog/product/cache/835a3e791bf0e3b34b24d35546b6ba22/d/i/di04a1800029-01.jpg',
      offerpercentage: '10%',
      offertext: 'Discount '),
  PromotionItem(
      images:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1Ted234EVgJsNYQRY32xlAlp6QXwcEIpNhA&usqp=CAU',
      flashname: "Ipad",
      flashmainprice: '₹120000',
      flashofferprice: '₹100999',
      flashavailable: '9 Available',
      flashlocation: 'Korea',
      promotionimages:
          'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202211/4-one_one.jpg?VersionId=QpSMrAJEfoTwFeSDUA9HUsbU7BbjBvG',
      offerpercentage: '25%',
      offertext: 'Discount '),
];
