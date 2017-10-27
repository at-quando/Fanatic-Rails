# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_avatar = [
  'fxk2kslabpimvzyxebrn',
  'py0csgvvxqvh0i72mjps',
  'fmmv1yr8ahdsnusljetr',
  'rslewz8r7amtzmmkcc4x',
  'xdhvoqrc3fm4tablpxzp',
  'vbzamsgfdyrbip8zb8jg',
  'szqyjlu6ypzxdgf8hn7g',
  'fxk2kslabpimvzyxebrn',
  'py0csgvvxqvh0i72mjps',
  'fmmv1yr8ahdsnusljetr'
]


t = 0
10.times do
  User.create(
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    gender: 1,
    role: 2,
    avatar: user_avatar[t],
    address: 'Sơn Trà, Đà Nẵng'
  )
  t += 1
end

10.times do
  Authentication.create(
    password: '123456',
    uid: Faker::Internet.email,
    user_id: User.all.ids[rand(User.count)],
    access_token: [],
    confirm_at: Time.now
  )
end

User.create(
  name: "Nguyễn Phú Việt",
  phone: Faker::PhoneNumber.phone_number,
  gender: 0,
  role: 2,
  avatar: 'sa7cmaa1fenmclgpvale',
  address: '100 Thọ An, Thọ Quang, Sơn Trà, Đà Nẵng'
)

User.create(
  name: "Đỗ Hồng Quân",
  phone: Faker::PhoneNumber.phone_number,
  gender: 0,
  role: 2,
  avatar: 'rslewz8r7amtzmmkcc4x',
  address: '43 Tống Phước Phổ'
)

Authentication.create(
  password: '123456',
  uid: "vietdn1991@gmail.com",
  user_id: 11,
  access_token: [],
  confirm_at: Time.now
)

Authentication.create(
  password: '123456',
  uid: "dhquan1910@gmail.com",
  user_id: 12,
  access_token: [],
  confirm_at: Time.now
)

electronic = Category.create(title: 'Electronic')
computer = Category.create(title: 'Computer')
phone = Category.create(title: 'Phone & Tablet')
camera = Category.create(title: 'Camera & Recorder')
tv = Category.create(title: 'TV & Digital devices')

clothes = Category.create(title: 'Clothes')
man = Category.create(title: "Men's clothes")
woman = Category.create(title: "Women's clothes")
child = Category.create(title: "Child's clothes")

man.move_to_child_of(clothes)
woman.move_to_child_of(clothes)
child.move_to_child_of(clothes)

computer.move_to_child_of(electronic)
phone.move_to_child_of(electronic)
camera.move_to_child_of(electronic)
tv.move_to_child_of(electronic)

tablet = Category.create(title: 'Tablet')
mobiphone = Category.create(title: 'Mobile phone')
accossor = Category.create(title: 'Accossories')

baoda = Category.create(title: 'Holster')
baoda.move_to_child_of(accossor)

pin = Category.create(title: 'Battery')
pin.move_to_child_of(accossor)

tablet.move_to_child_of(phone)
mobiphone.move_to_child_of(phone)
accossor.move_to_child_of(phone)

lap = Category.create(title: 'Laptop')
pc = Category.create(title: 'PC')
console = Category.create(title: 'Console')

ps4 = Category.create(title: 'PS4')
ps4.move_to_child_of(console)

ram = Category.create(title: 'RAM')
vega = Category.create(title: 'Vega')

ram.move_to_child_of(pc)
vega.move_to_child_of(pc)

lap.move_to_child_of(computer)
pc.move_to_child_of(computer)
console.move_to_child_of(computer)

acctioncamera = Category.create(title: 'Action camera')
digitalcamera = Category.create(title: 'Digital camera')

acctioncamera.move_to_child_of(camera)
digitalcamera.move_to_child_of(camera)

smarttv = Category.create(title: 'Smart TV')
bigtv = Category.create(title: 'Big TV')

smarttv.move_to_child_of(tv)
bigtv.move_to_child_of(tv)

mshoes = Category.create(title: "Men's shoes")
wmshoes = Category.create(title: "Women's shoes")
childshoes = Category.create(title: "Child's shoes")

mwear = Category.create(title: "Men's wear")
wmwear = Category.create(title: "Women's wear")
childwear = Category.create(title: "Child's wear")

mshoes.move_to_child_of(man)
wmshoes.move_to_child_of(woman)
childshoes.move_to_child_of(child)

mwear.move_to_child_of(man)
wmwear.move_to_child_of(woman)
childwear.move_to_child_of(child)

Shop.create(
  name: 'Shop A',
  image: 'http://www.dawnpet.com/shop-online-4.jpg',
  address: 'Thọ An, Thọ Quang, Sơn Trà, Đà Nẵng',
  slogan: 'Slogan shop A',
  description: 'Description shop A',
  logo: 'https://image.freepik.com/free-vector/abstract-logo-in-flame-shape_1043-44.jpg'
)

Shop.create(
  name: 'Shop B',
  image: 'http://www.theonlinecandyshop.com/assets/templates/onlinecandyshop-html5/images/tocs_logo_072615.png',
  address: '43 Tống Phước Phổ, Đà Nẵng',
  slogan: 'Slogan shop A',
  description: 'Description shop A',
  logo: 'https://cdn.dribbble.com/users/64815/screenshots/1518220/attachments/229248/shop_logo_big.png'
)

brand_electronic = %w[
  Apple
  SamSung
  Nokia
  LG
  Sony
  Lenovo
  Oppo
  Asus
  DELL
]

k = 0
9.times do
  k += 1
  Brand.create(
    branch: brand_electronic[k - 1]
  )
end

l = 0
9.times do
  l += 1
  CategoryBrand.create(
    category_id: 11,
    brand_id: l
  )
end

l = 0
9.times do
  l += 1
  next if l == 3 || l == 7
  CategoryBrand.create(
    category_id: 10,
    brand_id: l
  )
end

l = 0
9.times do
  l += 1
  next if l == 2 || l == 3 || l == 7
  CategoryBrand.create(
    category_id: 15,
    brand_id: l
  )
end



product_mobilephone = [
  'Apple iPhone 7 32GB (Vàng Hồng)',
  'Apple iPhone 6S PLUS 32GB HỒNG',
  'Apple iPhone 6S 16GB Vàng',
  'Apple iPhone 5S 16GB (Bạc) ',
  'Samsung Galaxy J7 Prime 32GB (Trắng vàng)',
  'Samsung Galaxy J2 Prime 8GB (Vàng)',
  'Samsung Galaxy S8 64g Ram 4gb 5.8inch (Đen Huyền Bí)',
  'Samsung Galaxy J1 2016 8GB 2 SIM (Vàng)',
  'Asus ZenFone 3 ‏ZE520KL 64GB 4GB (Trắng)',
  'Asus Zenfone Go TV ZB551KL 32GB Gray',
  'OPPO F1s 32GB (Vàng)',
  'OPPO F3 4GB/64GB',
  'Oppo Neo 9 16Gb 2Gb Ram (Đen)'
]

property_product_mobilephone = [
  {
    color: 'Pink',
    storage: 32,
    price: 300
  },
  {
    color: 'Pink',
    storage: 32,
    price: 250
  },
  {
    color: 'Yellow',
    storage: 16,
    price: 150
  },
  {
    color: 'Silver',
    storage: 16,
    price: 100
  },
  {
    color: 'White',
    storage: 32,
    price: 150
  },
  {
    color: 'Yellow',
    storage: 8,
    price: 50
  },
  {
    color: 'Black',
    storage: 64,
    price: 250
  },
  {
    color: 'Yellow',
    storage: 8,
    price: 50
  },
  {
    color: 'White',
    storage: 64,
    price: 250
  },
  {
    color: 'Gray',
    storage: 32,
    price: 150
  },
  {
    color: 'Yellow',
    storage: 32,
    price: 150
  },
  {
    color: 'Black',
    storage: 64,
    price: 200
  },
  {
    color: 'Black',
    storage: 16,
    price: 50
  }
]

# images_product_mobilephone1 = [
#   'https://www.sosanhgia.com/images/product/16/iphone-7-32gb-1480303416.jpg',
#   'https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iPhone-6s-Plus-Gold.jpg',
#   'http://www.dienthoaisaigon.com/wp-content/uploads/2014/09/ip6vang.jpg',
#   'https://cdn.fptshop.com.vn/Uploads/Originals/2015/10/24/635812728625576328_iphone-5s-bac-chi-tiet.png',
#   'https://img.trananh.com.vn/trananh/2016/09/19/samsung-galaxy-j7-prime-g610f--vang.jpg',
#   'https://img.trananh.com.vn/trananh/2017/01/06/dien-thoai-samsung-galaxy-j2-prime-vang-1.jpg',
#   'https://vn-live-01.slatic.net/p/2/samsung-galaxy-s8-64g-ram-4gb-58inch-den-huyen-bi-hang-nhapkhauden-64gb-1493909828-1519365-41d9c2b1c4e876461ee7cdd26b8fc513-product.jpg',
#   'https://ph-live-02.slatic.net/p/2/samsung-galaxy-j1-mini-prime-2016-j106f-8gb-gold-1482217287-2602249-0851dab845deba4b7d034d52eca1f18d-product.jpg',
#   'https://vn-live-03.slatic.net/p/2/asus-zenfone3-ze520kl-64gb-trang-hang-phan-phoi-chinh-thuc-1477382949-3237292-e2e714113d553c144f1bf76632aa8fb8.jpg',
#   'https://i.ebayimg.com/thumbs/images/g/rO0AAOSw4CFYpyDj/s-l225.jpg',
#   'http://www.vatgia.com/upload_images/Image/2016/08/Oppo-F1s-Gold(1).png',
#   'https://n4.sdlcdn.com/imgs/f/d/0/Oppo-F3-Plus-64GB-Gold-SDL970897843-5-28626.jpg',
#   'http://vn-live-01.slatic.net/p/2/oppo-neo-9-16gb-2gb-ram-den-hang-phan-phoi-chinh-thuc-1503288139-67351801-a8da89f6998e065b2ca8994546241ed0-catalog_233.jpg'
# ]
images_product_mobilephone1 = [
  '1_nhav4l',
  '2_fzgmxp',
  '3_jol3i9',
  '4_rmwn1p',
  '5_nrwpbk',
  '6_aiwbav',
  '7_tet0re',
  '8_tatiin',
  '9_z53xaq',
  '10_tt84pt',
  '11_ecoozz',
  '12_valctg',
  '13_vmj3pd'
]
# images_product_mobilephone2 = [
#   'https://cdn02.static-adayroi.com/resize/502_502/100/0/2016/09/15/1473922323559_6977603.jpg',
#   'https://static3.rongbaycdn.com/original//rb_up_new/2017/08/31/902668/201708101734_photo_8_29_16__11_27_12.jpg',
#   'http://www.dienthoaisaigon.com/wp-content/uploads/2014/09/nnb.jpg',
#   'http://www.dienthoaisaigon.com/wp-content/uploads/2014/01/16.jpg',
#   'https://cdn.tgdd.vn/Products/Images/42/84798/samsung-galaxy-j7-prime-1-400x460.png',
#   'https://www.nguyenkim.com/images/companies/_1/Content/vien-thong/dien-thoai/samsung/j2-prime/g532-vang/dien-thoai-samsung-galaxy-j2-prime-g532-vang-05.jpg',
#   'https://vn-live-02.slatic.net/p/2/samsung-galaxy-s8-64g-ram-4gb-58inch-den-hang-phan-phoi-chinhthuc-1494234429-6077765-e33965110eaa33dd96e7b768bc4018c5-product.jpg',
#   'https://www.mytrendyphone.eu/images/Samsung-Galaxy-J1-2016-8GB-Gold-09052016-02-p.jpg',
#   'https://cellphones.com.vn/media/catalog/product/cache/7/image/500x500/9df78eab33525d08d6e5fb8d27136e95/z/e/zenone-3-ze552kl-white-back_5.png',
#   'https://cdn1.tgdd.vn/hoi-dap/962154/Thumbnail/1-Khac-phuc-loi-Asus-Zenphone-bi-loi-rat-tiec-ban-phiim-da-dung-lai.jpg',
#   'https://www.ninefar.com/wp-content/uploads/2016/08/OPPO-F1s-F1s_E-Gold.jpg',
#   'https://n3.sdlcdn.com/imgs/f/d/0/Oppo-F3-Plus-64GB-Gold-SDL970897843-7-a135e.jpg',
#   'https://cdn.fptshop.com.vn/Uploads/Originals/2016/1/22/635890746925858451_neo5-b2.jpg'
# ]
images_product_mobilephone2 = [
  '14_isqqzr',
  '15_bxccry',
  '16_ntrz91',
  '17_igpgg9',
  '18_whp8wl',
  '19_upmmdu',
  '20_tfydmh',
  '21_beejxl',
  '22_jmsbev',
  '23_rlaysy',
  '24_w3zsev',
  '25_dexflx',
  '26_afhpfi'
]

product_tablet = [
  'Máy tính bảng Samsung Galaxy Tab 3V 8GB RAM 1GB Wifi',
  'Máy tính bảng Samsung Galaxy Tab A 7.0 T285 Wifi 4G 8GB',
  'Máy tính bảng Samsung Galaxy Tab E 9.6 SM-T561 8GB',
  'Máy tính bảng Samsung Tab A6 T285 7inch 8GB',
  'Ipad 2017 9.7 wifi 32Gb Gold',
  'IPad Pro 10.5inch 2017 Wifi 64Gb',
  'Apple iPad Mini4 32Gb 4G',
  'Máy tính bảng Lenovo Tab 3 730X 16GB',
  'Máy tính bảng Lenovo TB3-850M ZA180001VN',
  'Lenovo Yoga Book ZA150059VN',
  'Máy tính bảng ASUS ZENPAD C 7.0 Z170CG 8GB',
  'Máy tính bảng Asus fonepad 7 8GB 3G',
  'Máy tính bảng Asus Z370CG-1A002A 16GB Wifi 3G'
]

property_product_tablet = [
  {
    color: 'Black',
    storage: 8,
    price: 100
  },
  {
    color: 'White',
    storage: 8,
    price: 100
  },
  {
    color: 'Black',
    storage: 8,
    price: 150
  },
  {
    color: 'White',
    storage: 8,
    price: 100
  },
  {
    color: 'Pink',
    storage: 32,
    price: 250
  },
  {
    color: 'Black',
    storage: 64,
    price: 350
  },
  {
    color: 'Black',
    storage: 32,
    price: 250
  },
  {
    color: 'Black',
    storage: 16,
    price: 150
  },
  {
    color: 'Black',
    storage: 32,
    price: 200
  },
  {
    color: 'Black',
    storage: 64,
    price: 350
  },
  {
    color: 'White',
    storage: 8,
    price: 100
  },
  {
    color: 'Black',
    storage: 8,
    price: 150
  },
  {
    color: 'Black',
    storage: 16,
    price: 200
  }
]

# images_product_tablet1 = [
#   'https://vn-live-01.slatic.net/p/image-2473152-310ba3e0cfff47481bde570834a06c10-product.jpg',
#   'https://www.phucanh.vn/media/product/23958_galaxy_tab_a_t285_white_01.jpg',
#   'https://cdn.tgdd.vn/Products/Images/522/73280/samsung-galaxy-tab-e-96-sm-t561-nk-300x300.jpg',
#   'https://www.phucanh.vn/media/product/23958_galaxy_tab_a_t285_white_03.jpg',
#   'https://www.bhphotovideo.com/images/images2500x2500/apple_mpgt2ll_a_ipad_wi_fi_32gb_9_7_1327825.jpg',
#   'https://cnet4.cbsistatic.com/img/q-Ks5OKwADkjZfs4zR3jXEJN6_o=/830x467/2017/06/08/019fd928-32c2-4922-83c0-bd180b00c08d/apple-ipad-pro-2017-002.jpg',
#   'https://www.bhphotovideo.com/images/images2500x2500/apple_mnwp2ll_a_7_9_ipad_mini_4_1280487.jpg',
#   'https://www.sosanhgia.com/images/product/17/may-tinh-bang-lenovo-tab-3-tb3-730x-1478415676.jpg',
#   'https://hc.com.vn/media/wysiwyg/may-tinh-bang-lenovo-tb3-710i-za0s0014vn-den_1.jpg',
#   'http://www.muahangtragop.com/vnt_upload/product/12_2016/tragop-maytinhbang-Lenovo-Yoga-Book-ZA150059VN.jpg',
#   'https://cdn3.tgdd.vn/Products/Images/522/60469/asus-fonepad-7_clip_image002.jpg',
#   'http://i2.giga-club.ru/1/3737/37369806/afacdb/1-jpg.jpg',
#   'https://hc.com.vn/media/catalog/product/cache/4/image/9df78eab33525d08d6e5fb8d27136e95/m/a/may-tinh-bang-asus-p01v-z370cg-black.jpg'
# ]
images_product_tablet1 = [
  '27_xmrpi9',
  '28_eyn3fo',
  '29_uyikpr',
  '30_t1et3o',
  '31_erlor6',
  '32_hqjaz1',
  '33_lbpnx9',
  '34_k0v99p',
  '35_x2eiat',
  '36_m0gn8z',
  '37_bh2fec',
  '38_jsuylb',
  '39_vqjayv'
]
# images_product_tablet2 = [
#   'https://dienmaycholon.vn/public/picture/product//product6430/product_6430_4.png',
#   'https://cdn3.tgdd.vn/Products/Images/522/75693/samsung-galaxy-tab-a-70-11-300x300.jpg',
#   'https://cdn.tgdd.vn/Products/Images/522/73280/samsung-galaxy-tab-e-96-sm-t561-400-400x400.png',
#   'https://images01.olx-st.com/ui/57/04/96/39/o_1483833477_981049113e6e7d83c231b1f015e7c862.jpg',
#   'https://tubby.scene7.com/is/image/tubby/IPADMP2F2KNA?$fullsize$',
#   'https://blogs-images.forbes.com/haroldstark/files/2017/06/ipad.jpg?width=960',
#   'http://istream.al/wp-content/uploads/2016/01/iPadMini2_Group_BW_hero_WW-EN-SCREEN.png',
#   'https://cdn.tgdd.vn/Products/Images/522/81793/lenovo-tab-3-7-400-400x460.png',
#   'https://www.sosanhgia.com/images/product/4/tablet-lenovo-tab-3-tb3-850m-1475057404.jpg',
#   'http://tech4you.vn/Image/Picture/Lenovo/Maytinhbang/lenovo-yoga-book-16.jpg',
#   'https://cdns.4clik.com/tablette/TAB4749/TAB4749-pic-1-lg.jpg',
#   'https://hc.com.vn/media/wysiwyg/May-tinh-bang/asus-fonepad-7-fe170cg-c.jpg',
#   'https://p.fast.ulmart.ru/p/mid/355/35511/3551152.jpg'
# ]
images_product_tablet2 = [
  '40_ktv0lt',
  '41_lb84ge',
  '42_vgxf8q',
  '43_blgnmu',
  '44_r0ny6l',
  '45_x885i1',
  '46_gjsabn',
  '47_vporgh',
  '48_ttionu',
  '49_plyqcw',
  '50_o8dvab',
  '51_fqmbmi',
  '52_mpdtob'
]

product_laptop = [
  'Laptop Dell Inspiron 3543 Core i5 5200U',
  'Laptop Dell 5559 Core I7-6500U Ram 8GB HDD 1000GB VGA ATI R5 M335 4G',
  'Laptop Dell inspiron 15 5567 I5-7200 8GB 1TB 2GB 15.6 W10',
  'Laptop ASUS GL753VE-GC059 - i7-7700HQ 2.8GHz, VGA GTX 1050 Ti 4GB, 17.3" FHD',
  'Laptop ASUS GX700VO-GB012T 17.3inch',
  'Apple MacBook Pro 13.3'' i5 2.3GHz 8GB 128GB MPXQ2',
  'APPLE MACBOOK PRO 2016 13.3 MLUQ2 8GB SSD 256GB',
  'Apple MacBook Air 13 inch 128GB MQD32 2017',
  'Laptop Lenovo Yoga 500-14 80R5000GVN 14 inches'
]

property_product_laptop = [
  {
    color: 'Black',
    storage: 8,
    price: 300
  },
  {
    color: 'Black',
    storage: 8,
    price: 350
  },
  {
    color: 'Black',
    storage: 8,
    price: 350
  },
  {
    color: 'Black',
    storage: 4,
    price: 350
  },
  {
    color: 'Black',
    storage: 8,
    price: 300
  },
  {
    color: 'Gray',
    storage: 8,
    price: 300
  },
  {
    color: 'White',
    storage: 16,
    price: 400
  },
  {
    color: 'Black',
    storage: 4,
    price: 200
  },
  {
    color: 'Black',
    storage: 16,
    price: 350
  }
]

product_laptop_images1 = [
  '77_buqcmh',
  '79_ptzzq6',
  '81_lzupjp',
  '83_vxaaws',
  '85_fppsxm',
  '87_ezaizi',
  '89_hvx4bl',
  '91_rowt3e',
  '93_fjn7ph'
]
product_laptop_images2 = [
  '78_x3q4du',
  '80_y3hkyv',
  '82_dwdtgy',
  '84_fahjca',
  '86_knjxto',
  '88_huzk9h',
  '90_dllzyu',
  '92_zbktmt',
  '94_th3ggo'
]

brand_clothes = [
  'Nike',
  'Adidas',
  'Puma',
  'Salvatore Ferragamo Italia',
  'Allen Edmons',
  'John Lobb Bootmaker',
  'Gucci',
  'Bruno Magli',
  'Johnston & Murphy',
]

k = 0
9.times do
  k += 1
  Brand.create(
    branch: brand_clothes[k - 1]
  )
end

l = 9
9.times do
  l += 1
  CategoryBrand.create(
    category_id: 25,
    brand_id: l
  )
end

l = 9
9.times do
  l += 1
  next if l == 16 || l == 18
  CategoryBrand.create(
    category_id: 26,
    brand_id: l
  )
end

product_men_shoes = [
  'Nike Air VaporMax Flyknit iD',
  'Nike Flyknit Trainer',
  'Nike SB Air Force 2 Low x Supereme',
  'Nike Flight Bonafide',
  'ADIDAS ATHLETICS TRAINER SHOES',
  'CRAZYTRAIN ELITE SHOES',
  'CRAZYTRAIN 2.0 CLOUDFOAM SHOES',
  'CRAZYTRAIN PRO SHOES',
  'CRAZYTRAIN ELITE SHOES',
  'CLYDE FASHION KIKU SNEAKERS',
  'PUMA X SOLEBOX B.O.G LIMITLESS SNEAKERS',
  'CLYDE CORE MID SNEAKERS',
  'PARMA OXFORD LACE UP',
  'PISA OXFORD LACE UP',
  'NINO LACE-UP',
  'NUNCIO BOOT'
]

property_product_menshoes = [
  {
    color: 'White',
    size: 32,
    price: 200
  },
  {
    color: 'White',
    size: 31,
    price: 250
  },
  {
    color: 'Blue',
    size: 33,
    price: 200
  },
  {
    color: 'Black',
    size: 32,
    price: 300
  },
  {
    color: 'Black',
    size: 32,
    price: 250
  },
  {
    color: 'Gray',
    size: 33,
    price: 300
  },
  {
    color: 'Black',
    size: 33,
    price: 300
  },
  {
    color: 'Gray',
    size: 33,
    price: 300
  },
  {
    color: 'White',
    size: 33,
    price: 350
  },
  {
    color: 'White',
    size: 33,
    price: 200
  },
  {
    color: 'Black',
    size: 32,
    price: 250
  },
  {
    color: 'White',
    size: 32,
    price: 180
  },
  {
    color: 'Black',
    size: 32,
    price: 450
  },
  {
    color: 'Black',
    size: 32,
    price: 450
  },
  {
    color: 'Black',
    size: 32,
    price: 425
  },
  {
    color: 'Black',
    size: 33,
    price: 475
  }
]

# product_men_shoes_image1 = [
#   'https://content.nike.com/content/dam/one-nike/en_us/season-2017-sp/LAUNCH_S17/NikeAirVapormax_M/P1%20(5).jpg.transform/default/P1%20(5).jpg',
#   'https://newsneakernews-wpengine.netdna-ssl.com/wp-content/uploads/2017/07/nike-flyknit-trainer-white-black-global-release-date.jpg',
#   'https://newsneakernews-wpengine.netdna-ssl.com/wp-content/uploads/2017/09/supreme-nike-sb-air-force-2-low-teal-1.jpg',
#   'https://sneakerbardetroit.com/wp-content/uploads/2017/04/nike-zoom-flight-bonafide-black-release-date.jpg',
# ]
product_men_shoes_image1 = [
  '53_cxi5c5',
  '54_ufjsg3',
  '55_afsmin',
  '56_gftlxh',
  '61_gisolt',
  '63_llauji',
  '65_gz5hgf',
  '67_xq4omi',
  '69_o1wqqu',
  '71_ht6cps',
  '73_xqiqum',
  '75_gesrk1',
  '95_l0ltf6',
  '97_nack23',
  '99_yt7c1i',
  '101_vztmvs'
]

# product_men_shoes_image2 = [
#   'https://content.nike.com/content/dam/one-nike/en_us/season-2017-sp/LAUNCH_S17/NikeAirVapormax_M/849558_004_C_PREM.jpg.transform/default/849558_004_C_PREM.jpg',
#   'https://www.flightclub.com/media/catalog/product/cache/1/image/1600x1140/9df78eab33525d08d6e5fb8d27136e95/n/i/nike-flyknit-trainer-white-black-051785_2.png',
#   'https://newsneakernews-wpengine.netdna-ssl.com/wp-content/uploads/2017/09/supreme-nike-sb-air-force-2-low-teal-2.jpg',
#   'https://s3.amazonaws.com/stockx-sneaker-analysis/wp-content/uploads/2017/04/Nike-Flight-Bonafide-Black-White.png',
# ]
product_men_shoes_image2 = [
  '57_p9yf2s',
  '58_a4jeu0',
  '59_no4ahf',
  '60_rhtal6',
  '62_quug6f',
  '64_mlsq7e',
  '66_wrzgh6',
  '68_pu213k',
  '70_ndfzx1',
  '72_ectxvy',
  '74_clq6dz',
  '76_bozt66',
  '96_zs2qnc',
  '98_qmrhyu',
  '100_le5sqy',
  '102_gg8ox8'
]


product_women_shoes = [
  'CLYDE FASHION KIKU SNEAKERS',
  'PLATFORM MID KIKU WOMEN’S SNEAKERS',
  'SUEDE XL LACE VR WOMEN\'S SNEAKERS',
  'SUEDE SUMMER SATIN PLATFORM SNEAKERS',
  'CRAZYTRAIN RPU PRO SHOES',
  'CRAZYTRAIN ELITE SHOES',
  'CRAZYTRAIN SHOES',
  'NIKE CORTEZ iD',
  'NIKE FREE RN FLYKNIT 2017'
]

property_product_womenshoes1 = [
  {
    color: 'White',
    size: 32,
    price: 110
  },
  {
    color: 'White',
    size: 32,
    price: 130
  },
  {
    color: 'Black',
    size: 32,
    price: 95
  },
  {
    color: 'Pink',
    size: 32,
    price: 110
  },
  {
    color: 'Black',
    size: 32,
    price: 200
  },
  {
    color: 'White',
    size: 32,
    price: 180
  },
  {
    color: 'Yellow',
    size: 32,
    price: 180
  },
  {
    color: 'Black',
    size: 32,
    price: 160
  },
  {
    color: 'Red',
    size: 32,
    price: 180
  },
]

product_women_shoes_image1 = [
  '105_d1ygq4',
  '107_nv3dps',
  '109_bofv2p',
  '111_kv10ki',
  '113_ljr6mo',
  '115_kymumo',
  '117_q9qxqc',
  '119_imwlm3',
  '121_xxip7v',

]
product_women_shoes_image2 = [
  '106_t87syk',
  '108_qzitc2',
  '110_yeptec',
  '112_zhbrpl',
  '114_ardqmw',
  '116_ldid0g',
  '118_ycmmqp',
  '120_uvub9z',
  '122_n62zw2'
]

property_product_womenshoes2 = [
  {
    color: 'Blue',
    size: 33,
    price: 110
  },
  {
    color: 'Black',
    size: 32,
    price: 140
  },
  {
    color: 'Gray',
    size: 32,
    price: 110
  },
  {
    color: 'White',
    size: 32,
    price: 110
  },
  {
    color: 'White',
    size: 32,
    price: 200
  },
  {
    color: 'Black',
    size: 31,
    price: 160
  },
  {
    color: 'Silver',
    size: 33,
    price: 180
  },
  {
    color: 'White',
    size: 32,
    price: 170
  },
  {
    color: 'Blue',
    size: 32,
    price: 180
  }
]

product_women_shoes_image3 = [
  '137_anztfz',
  '139_af5kxt',
  '127_ckqubp',
  '129_euujq8',
  '135_dp7ghp',
  '133_h1n42m',
  '131_jflgm2',
  '123_rpe607',
  '125_jfvaxb'
]
product_women_shoes_image4 = [
  '138_aojnom',
  '140_exq6ra',
  '128_vc7egb',
  '130_ksnr84',
  '136_spvw8j',
  '134_xan16x',
  '132_inynd4',
  '124_s5tdlw',
  '126_bqotf0'
]
### MOBILE PHONE

Shop.create(
  name: 'Shop C',
  image: 'http://blog.polipay.co.nz/online-shopping.gif',
  address: '43 Tống Phước Phổ, Đà Nẵng',
  slogan: 'Slogan shop C',
  description: 'Description shop C',
  logo: 'http://www.truthmedia.gr/sites/default/files/online-shopping-ecommerce-ss-1920_1.png'
)

Shop.create(
  name: 'Shop D',
  image: 'http://listdose.co/wp-content/uploads/2013/08/deprives-you-of-tangibility.jpg',
  address: '43 Tống Phước Phổ, Đà Nẵng',
  slogan: 'Slogan shop D',
  description: 'Description shop D',
  logo: 'https://thumbs.dreamstime.com/z/mobile-technology-shopping-concept-illustration-28893578.jpg'
)

Shop.create(
  name: 'Shop E',
  image: 'https://evolvinglolo.files.wordpress.com/2015/06/shop-online-24-7.gif?w=325&h=232&crop=1',
  address: '43 Tống Phước Phổ, Đà Nẵng',
  slogan: 'Slogan shop E',
  description: 'Description shop E',
  logo: 'https://thumbs.dreamstime.com/z/colored-paper-shopping-bags-online-shop-text-white-background-44092868.jpg'
)

Shop.create(
  name: 'Shop F',
  image: 'https://thumbs.dreamstime.com/z/online-shopping-23044026.jpg',
  address: '43 Tống Phước Phổ, Đà Nẵng',
  slogan: 'Slogan shop C',
  description: 'Description shop F',
  logo: 'https://thumbs.dreamstime.com/z/online-shopping-cart-white-background-34993217.jpg'
)

Shop.create(
  name: 'Shop G',
  image: 'http://cdn.indiamarks.com/wp-content/uploads/Online-shopping-in-India.jpg',
  address: '43 Tống Phước Phổ, Đà Nẵng',
  slogan: 'Slogan shop G',
  description: 'Description shop G',
  logo: 'https://static7.depositphotos.com/1003153/721/v/950/depositphotos_7216236-stock-illustration-i-love-shopping-icon.jpg'
)

10.times do
Admin.create(
  name: Faker::Name.name,
  user_name: Faker::Name.name,
  email: Faker::Internet.email,
  role: 1,
  password: '123456',
  avatar: Faker::Avatar.image,
  shop_id: rand(1..8)
  )
end
Admin.create(
  name: "Do Hong Quan",
  user_name: "adminquan",
  email: "dhquan1910@gmail.com",
  password: "123456",
  phone: "1234124141",
  avatar: "https://robohash.org/quamoptiovel.png?size=300x300&set=set1",
  shop_id: 1,
  gender: 0,
  role: 0
  )
Admin.create(
  name: "Shop Quan",
  user_name: "shopquan",
  email: "dhquan19102@gmail.com",
  password: "123456",
  phone: "1234124112321341",
  avatar: "https://robohash.org/estquilibero.png?size=300x300&set=set1",
  gender: 0,
  shop_id: 2,
  role: 1
  )
Admin.create(
  name: "Assist Quan",
  user_name: "assistquan",
  email: "dhquan19103@gmail.com",
  password: "123456",
  phone: "1234124112321341",
  avatar: "https://robohash.org/estquilibero.png?size=300x300&set=set1",
  gender: 0,
  shop_id: 2,
  role: 2
  )

4.times do
  Order.create(
    status: rand(0..2),
    receiver: Faker::Name.name,
    address: "DaNang, VIetNam",
    phone: "12345565",
    user_id: rand(1..10)
    )
end

i = 0
4.times do
  i += 1
  Product.create(
    name: product_mobilephone[i - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 11,
    brand_id: 1,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_mobilephone[i - 1][:price],
    storage: property_product_mobilephone[i - 1][:storage],
    color: property_product_mobilephone[i - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_mobilephone1[i - 1]
  )
  next unless images_product_mobilephone2[i - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_mobilephone2[i - 1]
  )
end

i = 4
4.times do
  i += 1
  Product.create(
    name: product_mobilephone[i - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 11,
    brand_id: 2,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_mobilephone[i - 1][:price],
    storage: property_product_mobilephone[i - 1][:storage],
    color: property_product_mobilephone[i - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_mobilephone1[i - 1]
  )
  next unless images_product_mobilephone2[i - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_mobilephone2[i - 1]
  )
end

i = 8
2.times do
  i += 1
  Product.create(
    name: product_mobilephone[i - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 11,
    brand_id: 8,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_mobilephone[i - 1][:price],
    storage: property_product_mobilephone[i - 1][:storage],
    color: property_product_mobilephone[i - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_mobilephone1[i - 1]
  )
  next unless images_product_mobilephone2[i - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_mobilephone2[i - 1]
  )
end

i = 10
3.times do
  i += 1
  Product.create(
    name: product_mobilephone[i - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 11,
    brand_id: 7,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_mobilephone[i - 1][:price],
    storage: property_product_mobilephone[i - 1][:storage],
    color: property_product_mobilephone[i - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_mobilephone1[i - 1]
  )
  next unless images_product_mobilephone2[i - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_mobilephone2[i - 1]
  )
end

## TABLET
j = 0
4.times do
  j += 1
  i += 1
  Product.create(
    name: product_tablet[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 10,
    brand_id: 2,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_tablet[j - 1][:price],
    storage: property_product_tablet[j - 1][:storage],
    color: property_product_tablet[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_tablet1[j - 1]
  )
  next unless images_product_tablet2[j - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_tablet2[j - 1]
  )
end

j = 4
3.times do
  j += 1
  i += 1
  Product.create(
    name: product_tablet[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 10,
    brand_id: 1,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_tablet[j - 1][:price],
    storage: property_product_tablet[j - 1][:storage],
    color: property_product_tablet[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_tablet1[j - 1]
  )
  next unless images_product_tablet2[j - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_tablet2[j - 1]
  )
end

j = 7
3.times do
  j += 1
  i += 1
  Product.create(
    name: product_tablet[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 10,
    brand_id: 8,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_tablet[j - 1][:price],
    storage: property_product_tablet[j - 1][:storage],
    color: property_product_tablet[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_tablet1[j - 1]
  )
  next unless images_product_tablet2[j - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_tablet2[j - 1]
  )
end

j = 10
3.times do
  j += 1
  i += 1
  Product.create(
    name: product_tablet[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 10,
    brand_id: 7,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_tablet[j - 1][:price],
    storage: property_product_tablet[j - 1][:storage],
    color: property_product_tablet[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: images_product_tablet1[j - 1]
  )
  next unless images_product_tablet2[j - 1] != nil
  Image.create(
    property_id: i,
    image: images_product_tablet2[j - 1]
  )
end


### MEN'S SHOES

j = 0
4.times do
  j += 1
  i += 1
  Product.create(
    name: product_men_shoes[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 25,
    brand_id: 10,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_menshoes[j - 1][:price],
    size: property_product_menshoes[j - 1][:size],
    color: property_product_menshoes[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_men_shoes_image1[j - 1]
  )
  next unless product_men_shoes_image2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_men_shoes_image2[j - 1]
  )
end

OrderItem.create(
  quantity: rand(0..2),
  total: rand(0..100),
  property_id: 8,
  order_id: rand(1..4),
  status: rand(0..2)  
)
OrderItem.create(
  quantity: rand(0..2),
  total: rand(0..100),
  property_id: 12,
  order_id: rand(1..4),
  status: rand(0..2)  
)
OrderItem.create(
  quantity: rand(0..2),
  total: rand(0..100),
  property_id: 13,
  order_id: rand(1..4),
  status: rand(0..2)  
)
OrderItem.create(
  quantity: rand(0..2),
  total: rand(0..100),
  property_id: 17,
  order_id: rand(1..4),
  status: rand(0..2)  
)

j = 4
5.times do
  j += 1
  i += 1
  Product.create(
    name: product_men_shoes[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 25,
    brand_id: 11,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_menshoes[j - 1][:price],
    size: property_product_menshoes[j - 1][:size],
    color: property_product_menshoes[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_men_shoes_image1[j - 1]
  )
  next unless product_men_shoes_image2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_men_shoes_image2[j - 1]
  )
end

j = 9
3.times do
  j += 1
  i += 1
  Product.create(
    name: product_men_shoes[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 25,
    brand_id: 12,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_menshoes[j - 1][:price],
    size: property_product_menshoes[j - 1][:size],
    color: property_product_menshoes[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_men_shoes_image1[j - 1]
  )
  next unless product_men_shoes_image2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_men_shoes_image2[j - 1]
  )
end

j = 12
4.times do
  j += 1
  i += 1
  Product.create(
    name: product_men_shoes[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 25,
    brand_id: 17,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_menshoes[j - 1][:price],
    size: property_product_menshoes[j - 1][:size],
    color: property_product_menshoes[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_men_shoes_image1[j - 1]
  )
  next unless product_men_shoes_image2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_men_shoes_image2[j - 1]
  )
end

### LAPTOP

j = 0
3.times do
  j += 1
  i += 1
  Product.create(
    name: product_laptop[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 15,
    brand_id: 9,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_laptop[j - 1][:price],
    storage: property_product_laptop[j - 1][:storage],
    color: property_product_laptop[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_laptop_images1[j - 1]
  )
  next unless product_laptop_images2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_laptop_images2[j - 1]
  )
end

j = 3
2.times do
  j += 1
  i += 1
  Product.create(
    name: product_laptop[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 15,
    brand_id: 8,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_laptop[j - 1][:price],
    storage: property_product_laptop[j - 1][:storage],
    color: property_product_laptop[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_laptop_images1[j - 1]
  )
  next unless product_laptop_images2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_laptop_images2[j - 1]
  )
end

j = 5
3.times do
  j += 1
  i += 1
  Product.create(
    name: product_laptop[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 15,
    brand_id: 1,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_laptop[j - 1][:price],
    storage: property_product_laptop[j - 1][:storage],
    color: property_product_laptop[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_laptop_images1[j - 1]
  )
  next unless product_laptop_images2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_laptop_images2[j - 1]
  )
end

j = 8
1.times do
  j += 1
  i += 1
  Product.create(
    name: product_laptop[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 15,
    brand_id: 6,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_laptop[j - 1][:price],
    storage: property_product_laptop[j - 1][:storage],
    color: property_product_laptop[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_laptop_images1[j - 1]
  )
  next unless product_laptop_images2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_laptop_images2[j - 1]
  )
end

# proper = Property.create(
#   product_id: 39,
#   price: 450,
#   size: 33,
#   color: 'Gray'
# )

# Image.create(
#   property_id: proper.id,
#   image: '103_d4om3p'
# )
# Image.create(
#   property_id: proper.id,
#   image: '104_fuyxfp'
# )

### WOMEN'S SHOES

j = 0
4.times do
  j += 1
  i += 1
  Product.create(
    name: product_women_shoes[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 26,
    brand_id: 12,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_womenshoes1[j - 1][:price],
    size: property_product_womenshoes1[j - 1][:size],
    color: property_product_womenshoes1[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_women_shoes_image1[j - 1]
  )
  next unless product_women_shoes_image2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_women_shoes_image2[j - 1]
  )
end

j = 4
3.times do
  j += 1
  i += 1
  Product.create(
    name: product_women_shoes[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 26,
    brand_id: 11,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_womenshoes1[j - 1][:price],
    size: property_product_womenshoes1[j - 1][:size],
    color: property_product_womenshoes1[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_women_shoes_image1[j - 1]
  )
  next unless product_women_shoes_image2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_women_shoes_image2[j - 1]
  )
end

j = 7
2.times do
  j += 1
  i += 1
  Product.create(
    name: product_women_shoes[j - 1],
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    number_review: rand(1..100),
    category_id: 26,
    brand_id: 10,
    shop_id: rand(1..2)
  )
  Property.create(
    product_id: i,
    price: property_product_womenshoes1[j - 1][:price],
    size: property_product_womenshoes1[j - 1][:size],
    color: property_product_womenshoes1[j - 1][:color]
  )
  Image.create(
    property_id: i,
    image: product_women_shoes_image1[j - 1]
  )
  next unless product_women_shoes_image2[j - 1] != nil
  Image.create(
    property_id: i,
    image: product_women_shoes_image2[j - 1]
  )
end

k = 52
y = 0
9.times do
  y += 1
  proper = Property.create(
    product_id: k,
    price: property_product_womenshoes2[y - 1][:price],
    size: property_product_womenshoes2[y - 1][:size],
    color: property_product_womenshoes2[y - 1][:color]
  ) if property_product_womenshoes2[y - 1] != nil
  Image.create(
    property_id: proper.id,
    image: product_women_shoes_image3[y - 1]
  ) if product_women_shoes_image3[y - 1] != nil
  Image.create(
    property_id: proper.id,
    image: product_women_shoes_image4[y - 1]
  ) if product_women_shoes_image4[y - 1] != nil
  k += 1
end

proper = Property.create(
    product_id: 54,
    price: 200,
    size: 33,
    color: "pink"
  )
Image.create(
  property_id: proper.id,
  image: product_women_shoes_image3[y - 1]
)

proper = Property.create(
    product_id: 54,
    price: 200,
    size: 33,
    color: "yellow"
  )
Image.create(
      property_id: proper.id,
      image: product_women_shoes_image3[y - 1]
    )

Comment.create(
  title: "Where can I get some?",
  content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as ",
  product_id: 54,
  user_id: 12
  )
Comment.create(
  title: "Where does it come from?",
  content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as ",
  product_id: 54,
  user_id: 10
  )
Comment.create(
  title: "Where can I get some?",
  content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as ",
  product_id: 54,
  user_id: 9
  )
Comment.create(
  title: "Where can I get some?",
  content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as ",
  product_id: 54,
  user_id: 8
  )

