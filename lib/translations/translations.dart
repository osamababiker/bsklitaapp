import 'package:get/get.dart';

abstract class AppTranslation  extends Translations {
  @override
  static Map<String, Map<String, String>>  translationsKeys  = {
    'en': en,
    'ar': ar
  };
}

final Map<String, String> ar = {
  'app_name': 'بسكليتة',
  'app_title': 'مرسال البيت', 
  'view_all': 'عرض الجميع',

  /* home screen translation */
  'home_screen_header_market_btn': 'السوق',
  'home_screen_header_deliver_btn': 'وصلي لي',
  'home_screen_header_confirm_btn': 'اتأكد لي',
  'home_screen_search_hint': 'ما الذي تبحث عنه ؟',
  'home_screen_delivery_to_hint': 'توصيل الى ',
  'home_screen_item_quantity_lable': 'ادخل الكمية التي تريد',
  'home_screen_item_quantity_hint': 'الكمية التي تريد',
  'home_screen_item_price_lable': 'ادخل سعر العنصر التي تريد',
  'home_screen_item_price_hint': 'سعر العنصر',
  'home_screen_add_to_shopping_list_btn': 'حفظ في قائمة التسوق',
  'home_screen_add_to_shopping_list_title': 'حدد الكمية والسعر',
  'home_screen_item_name_validation_error': 'الرجاء ادخال اسم العنصر',
  'home_screen_item_price_validation_error': 'الرجاء ادخال سعر صحيح',
  'home_screen_item_quantity_validation_error': 'الرجاء ادخال كمية صحيحة',

  /* profile screen translation */
  'profile_screen_settings_btn': 'الاعدادات',
  'profile_screen_orders_btn': 'مراسيلي',
  'profile_screen_logout_btn': 'تسجيل خروج',

  /* customOrder screen translation */
  'customOrder_screen_title': 'اضف عنصر لقائمة الشراء الخاصة بك',
  'customOrder_screen_item_name_field_lable': 'اسم المنتج',
  'customOrder_screen_item_name_field_hint': 'ماذا تريد ان تطلب ؟',
  'customOrder_screen_item_quantity_field_lable': 'الكمية المطلوبة',
  'customOrder_screen_item_quantity_field_hint': 'كم عنصر تريد من هذا المنتد ؟',
  'customOrder_screen_item_price_field_lable': 'سعر العنصر',
  'customOrder_screen_item_price_field_hint': 'ادخل سعر العنصر هنا',
  'customOrder_screen_item_image_field_lable': 'ارفاق صورة للعنصر',
  'customOrder_screen_item_notes_field_lable': 'اي ملاحظات اخرى',
  'customOrder_screen_item_notes_field_hint': 'هل لديك اي ملاحظات تود ارفاقها ؟',
  'customOrder_screen_save_btn': 'اضف للقائمة ',
 
  /* confirmForMe screen translation */
  'confirmForMe_screen_title': 'اتأكد لي',
  'confirmForMe_screen_order_field_lable': 'اتأكد من ماذا',
  'confirmForMe_screen_order_field_hint': 'ما الذي تود ان تتأكد من ؟',
  'confirmForMe_screen_confirm_btn': 'ارسال الطلب',
  'confirm_for_me_screen_confirm_field_error': 'الرجاء ادخال طلب التأكد',

  /* deliverForMe screen translation */
  'deliverForMe_screen_title': 'وصل لي',
  'deliverForMe_screen_item_name_field_lable': 'اسم العنصر',
  'deliverForMe_screen_item_name_field_hint': 'ماذا تريد ان توصل ؟',
  'deliverForMe_screen_item_quantity_field_lable': 'الكمية',
  'deliverForMe_screen_item_quantity_field_hint': 'كم عدد العناصر التي تود ايصالها ؟',
  'deliverForMe_screen_item_image_field_lable': 'ارفق صورة للعنصر',
  'deliverForMe_screen_item_pickup_location_lable': 'حدد موقع الاستلام',
  'deliverForMe_screen_item_delivery_location_lable': 'حدد موقع التوصيل',
  'deliverForMe_screen_item_notes_lable': 'ارفاق ملاحظة',
  'deliverForMe_screen_item_notes_hint': 'هل لديك اي ملاحظة تود ارفاقها ؟',
  'deliverForMe_screen_deliver_btn': 'ارسال الطلب',
  'deliverForMe_screen_name_field_validation_error': 'الرجاء ادخال اسم العنصر ',
  'deliverForMe_screen_quantity_field_validation_error': 'الرجاء ادخال الكمية المطلوبة',
  'deliverForMe_screen_delivery_address_field_validation_error': 'الرجاء تحديد عنوان التوصيل',
  'deliverForMe_screen_pickup_address_field_validation_error': 'الرجاء تحديد عنوان الاستلام',



  /* couriers screen translation */
  'couriers_screen_title': 'انضم للعمل معنا كمندوب',
  'couriers_screen_name_field_label': 'ادخل الاسم رباعي',
  'couriers_screen_name_field_hint': 'الرجاء ادخال الاسم الرباعي',
  'couriers_screen_phone_field_lable': 'رقم الهاتف',
  'couriers_screen_phone_field_hint': 'الرجاء ادخال رقم الهاتف',
  'couriers_screen_id_card_image': 'قم بارفاق صورة الهوية',
  'couriers_screen_delivery_methods_image': 'قم بارفاق صورة لوسيلة التوصيل ان وجدت',
  'couriers_screen_register_btn': 'سجلني كمندوب',

  /* Signin screen translation */
  'signin_screen_title': 'تسجيل دخول',
  'signin_screen_description': 'خدمة توصيل من الافراد للأفراد',
  'signin_screen_name_validation_error': 'الرجاء ادخال اسم صحيح',
  'signin_screen_phone_validation_error': 'الرجاء ادخال رقم هاتف صحيح',
  'signin_screen_otp_validation_error': 'الرقم المدخل غير صحيح',
  'signin_screen_name_field_label': 'ادخل الاسم',
  'signin_screen_name_field_hint': 'الرجاء ادخال الاسم',
  'signin_screen_phone_field_label': 'ادخل رقم الهاتف',
  'signin_screen_phone_field_hint': 'الرجاء ادخال رقم الهاتف',
  'signin_screen_otp_field_label': 'ادخل رمز التحقق',
  'signin_screen_otp_field_hint': 'الرجاء ادخال رمز التحقق من الهاتف',
  'signin_screen_signin_btn': 'تسجيل دخول',

  /* otp screen translation */
  'otp_screen_signin_btn': 'تحقق من الرقم',
  'otp_screen_wrong_otp_title': 'كود تحقق خاطئ',
  'otp_screen_wrong_otp_message': 'الرمز المدخل غير صحيح',

  /* settings screen translation */
  'settings_screen_title': 'الاعدادت',
  'settings_screen_change_langauge': 'الرجاء اختيار اللغة',
  'settings_screen_app_name_lable': 'اسم التطبيق',
  'settings_screen_app_version_lable': 'اصدار  التطبيق',
  'settings_screen_app_email_lable': 'ايميل الدعم الفني',
  'settings_screen_work_with_us_lable': 'هل ترغب في كسب دخل اضافي ؟ ',
  'settings_screen_work_with_us_btn': 'سجلني كمندوب',

  /* shooping list translation */
  'cart_screen_choose_delivry_time_title': 'قم باختيار وقت التوصيل',
  'cart_screen_choose_delivry_time_label': 'وقت التوصيل',
  'cart_screen_send_order_btn': 'ارسال الطلب',
  'cart_screen_delivery_time_lable': 'توصيل بعد',
  'cart_screen_more_than_one_day_option': 'أكثر من يوم',
  'cart_screen_less_than_one_hour': 'أقل من ساعة',
  'cart_screen_order_has_been_send_title': 'تم ارسال الطلب',
  'cart_screen_order_has_been_send_message': 'لقد تم ارسال طلبك لمناديب التوصيل',

  /* bottom navigation translation */
  'bottom_nav_settings': 'الاعدادات',
  'bottom_nav_orders': 'طلباتي',
  'bottom_nav_shopping_list': 'قائمة الشراء',
  'bottom_nav_notification': 'الاشعارات',
  'bottom_nav_profile': 'حسابي',

  /* general translation */
  'arabic': 'العربية',
  'english': 'الانجليزية',
  'error': 'خطأ',
  'image_picker_not_select_image_error': 'لم يتم اختيار صورة',
  'no_internet_connection_error': 'فشل في الاتصال بالانترنت',
  'adding_to_list_successfully_title': 'تمت اضافة العنصر بنجاح',
  'adding_to_list_successfully_message': 'تم اضافة العنصر لقائمة التسوق بنجاح',
  'item_deleted_from_shoppingList_title': 'تم ازالة العنصر',
  'item_deleted_from_shoppingList_message': 'تمت ازالة العنصر من سلة التسوق بنجاح',
  'hour': 'ساعة',
  'next': 'التالي',
  'previous': 'السابق',
  'skip': 'تخطي'
};

final Map<String, String> en = {
  'app_name': 'bsklita',
  'app_title': 'Home Courier',
  'view_all': 'View All',

  /* home screen translation */
  'home_screen_header_market_btn': 'Market',
  'home_screen_header_deliver_btn': 'Deliver For Me',
  'home_screen_header_confirm_btn': 'Confirm For Me',
  'home_screen_search_hint': 'What are you looking for ?',
  'home_screen_delivery_to_hint': 'Delivery to ',
  'home_screen_item_quantity_lable': 'Enter the quantity you need',
  'home_screen_item_quantity_hint': 'Quantity you need',
  'home_screen_item_price_lable': 'Enter the price',
  'home_screen_item_price_hint': 'Item Price',
  'home_screen_add_to_shopping_list_btn': 'Save to shopping list',
  'home_screen_add_to_shopping_list_title': 'Determin Price and Quantity',
  'home_screen_item_name_validation_error': 'Plase enter the name of the item',
  'home_screen_item_price_validation_error': 'Place enter valide price',
  'home_screen_item_quantity_validation_error': 'Place enter valide quantity',

  /* profile screen translation */
  'profile_screen_settings_btn': 'Settings',
  'profile_screen_orders_btn': 'Orders',
  'profile_screen_logout_btn': 'Logout',

  /* customOrder screen translation */
  'customOrder_screen_title': 'Add Item to Your Shopping List',
  'customOrder_screen_item_name_field_lable': 'Product Name',
  'customOrder_screen_item_name_field_hint': 'What you want to order ?',
  'customOrder_screen_item_quantity_field_lable': 'Product Quantity',
  'customOrder_screen_item_quantity_field_hint': 'How many items do you want ?',
  'customOrder_screen_item_price_field_lable': 'Product Price',
  'customOrder_screen_item_price_field_hint': 'Enter the product price',
  'customOrder_screen_item_image_field_lable': 'Attach a picture of the item',
  'customOrder_screen_item_notes_field_lable': 'Any notes',
  'customOrder_screen_item_notes_field_hint': 'Any notes you would like to attach ?',
  'customOrder_screen_save_btn': 'Add to list',

  /* confirmForMe screen translation */
  'confirmForMe_screen_title': 'Confirm For Me',
  'confirmForMe_screen_order_field_lable': 'Confirm What',
  'confirmForMe_screen_order_field_hint': 'What do you want to make sure of ?',
  'confirmForMe_screen_confirm_btn': 'Send Order',
  'confirm_for_me_screen_confirm_field_error': 'Plase enter your confirmation order',

  /* deliverForMe screen translation */
  'deliverForMe_screen_title': 'Deliver For Me',
  'deliverForMe_screen_item_name_field_lable': 'Item Name',
  'deliverForMe_screen_item_name_field_hint': 'What do you want to Deliver ?',
  'deliverForMe_screen_item_quantity_field_lable': 'Quantity',
  'deliverForMe_screen_item_quantity_field_hint': 'How Many Item You want to Deliver ?',
  'deliverForMe_screen_item_image_field_lable': 'Attach a picture of the item',
  'deliverForMe_screen_item_pickup_location_lable': 'Select the pick-up location',
  'deliverForMe_screen_item_delivery_location_lable': 'Select the delivery location',
  'deliverForMe_screen_item_notes_lable': 'attach a note',
  'deliverForMe_screen_item_notes_hint': 'Any notes you would like to attach?',
  'deliverForMe_screen_deliver_btn': 'Send Order',
  'deliverForMe_screen_name_field_validation_error': 'Plase enter item name',
  'deliverForMe_screen_quantity_field_validation_error': 'Plase enter item quantity',
  'deliverForMe_screen_delivery_address_field_validation_error': 'Plase enter delivery address',
  'deliverForMe_screen_pickup_address_field_validation_error': 'Plase enter pickup address',


  /* couriers screen translation */
  'couriers_screen_title': 'Join us as Courier',
  'couriers_screen_name_field_lable': 'Full name',
  'couriers_screen_name_field_hint': 'Please enter the full name',
  'couriers_screen_phone_field_lable': 'Phone number',
  'couriers_screen_phone_field_hint': 'Please enter phone number',
  'couriers_screen_id_card_image': 'Attach a photo of your ID',
  'couriers_screen_delivery_methods_image': 'Attach a picture of the delivery method, if any',
  'couriers_screen_register_btn': 'Register me as a Courier',

  /* Signin screen translation */
  'signin_screen_title': 'Sign in',
  'signin_screen_description': 'Delivery service from individuals to individuals',
  'signin_screen_name_validation_error': 'Please enter a valid name',
  'signin_screen_phone_validation_error': 'Please enter a valid phone number',
  'signin_screen_otp_validation_error': 'The number entered is incorrect',
  'signin_screen_name_field_label': 'Enter the name',
  'signin_screen_name_field_hint': 'Please enter the name',
  'signin_screen_phone_field_label': 'Enter a phone number',
  'signin_screen_phone_field_hint': 'Please enter the phone number',
  'signin_screen_otp_field_label': 'Enter the verification code',
  'signin_screen_otp_field_hint': 'Please enter the phone verification code',
  'signin_screen_signin_btn': 'Sign in',

  /* otp screen translation */
  'otp_screen_signin_btn': 'Verify number',
  'otp_screen_wrong_otp_title': 'Wrong verification code',
  'otp_screen_wrong_otp_message': 'The entered code is incorrect',

  /* settings screen translation */
  'settings_screen_title': 'Settings',
  'settings_screen_change_langauge': 'Plase Choose a language',
  'settings_screen_app_name_lable': 'App Name',
  'settings_screen_app_version_lable': 'App Version',
  'settings_screen_app_email_lable': 'Technical support email',
  'settings_screen_work_with_us_lable': 'Do you want to earn extra income ?',
  'settings_screen_work_with_us_btn': 'Register me as a Courier',

  /* shooping list translation */
  'cart_screen_choose_delivry_time_title': 'Choose the delivery time',
  'cart_screen_choose_delivry_time_label': 'Delivery time',
  'cart_screen_send_order_btn': 'Send Order',
  'cart_screen_delivery_time_lable': 'delivery after',
  'cart_screen_more_than_one_day_option': 'More than one day',
  'cart_screen_less_than_one_hour': 'Less than one hour',
  'cart_screen_order_has_been_send_title': 'Order has been send',
  'cart_screen_order_has_been_send_message': 'Order has been send to delivery couriers',

   /* bottom navigation translation */
  'bottom_nav_settings': 'Settings',
  'bottom_nav_orders': 'My orders',
  'bottom_nav_shopping_list': 'Shopping list',
  'bottom_nav_notification': 'Notifications',
  'bottom_nav_profile': 'My profile',

  /* general translation */
  'arabic': 'Arabic',
  'english': 'English',
  'error': 'Error',
  'image_picker_not_select_image_error': 'No Image has been selected',
  'no_internet_connection_error': 'Failed to connect to the internet',
  'adding_to_list_successfully_title': 'Added Successfully',
  'adding_to_list_successfully_message': 'Item has been added to shopping list',
  'item_deleted_from_shoppingList_title': 'Item removed successfully',
  'item_deleted_from_shoppingList_message': 'Item has been removed from shopping list successfully',
  'hour': 'Hour',
  'next': 'NEXT',
  'previous': 'Previous',
  'skip': 'Skip',
};
