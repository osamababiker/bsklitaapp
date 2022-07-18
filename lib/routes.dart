import 'package:bsklita/bindings/auth_controller_binding.dart';
import 'package:bsklita/bindings/couriers_controller_binding.dart';
import 'package:bsklita/bindings/image_picker_controller_binding.dart';
import 'package:bsklita/bindings/items_controller_binding.dart';
import 'package:bsklita/bindings/location_controller_binding.dart';
import 'package:bsklita/bindings/orders_controller_binding.dart';
import 'package:bsklita/bindings/shopping_list_controller_binding.dart';
import 'package:bsklita/bindings/sliders_controller_binding.dart';
import 'package:bsklita/screens/items/items_screen.dart';
import 'package:bsklita/screens/otp/otp_screen.dart';
import 'package:get/get.dart';
import 'package:bsklita/bindings/settings_controller_binding.dart';
import 'package:bsklita/screens/confirmForMe/confirm_for_me_screen.dart';
import 'package:bsklita/screens/couriers/couriers_screen.dart';
import 'package:bsklita/screens/deliverForMe/deliver_for_me_screen.dart';
import 'package:bsklita/screens/cart/cart_screen.dart';
import 'package:bsklita/screens/customOrder/custom_order_screen.dart';
import 'package:bsklita/screens/chats/chats_screen.dart';
import 'package:bsklita/screens/messages/message_screen.dart';
import 'package:bsklita/screens/notifications/notifications_screen.dart';
import 'package:bsklita/screens/profile/profile_screen.dart';
import 'package:bsklita/screens/settings/settings_screen.dart';
import 'package:bsklita/screens/signin/sign_in_screen.dart';
import 'package:bsklita/screens/splash/splash_screen.dart';
import 'package:bsklita/screens/home/home_screen.dart';
import 'package:bsklita/bindings/categories_controller_binding.dart';

class Routes {
  static final routes = [
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/chat', page: () => const ChatsScreen()),
    GetPage(name: '/profile', page: () => const ProfileScreen()),
    GetPage(
      name: '/signin', 
      page: () => const SignInScreen(),
      bindings: [
        AuthControllersBindings(),
        LocationControllersBindings()
      ]
    ),
    GetPage(
      name: '/otp', 
      page: () => const OtpScreen(),
      binding: AuthControllersBindings()
    ),
    GetPage(
      name: '/settings', 
      page: () => const SettingsScreen(),
      binding: SettingsControllersBindings()
    ),
    GetPage(
      name: '/cart', 
      page: () => const CartScreen(),
      bindings: [
        ShoppingLisrControllersBindings(),
        OrdersControllersBindings(),
        CouriersControllersBindings(),
        AuthControllersBindings()
      ] 
    ),
    GetPage(name: '/messages', page: () => const MessagesScreen()),
    GetPage(name: '/notifications', page: () => const NotificationsScreen()),
    GetPage(
      name: '/home', 
      page: () => const HomeScreen(),
      bindings: [
        CategoriesControllersBindings(),
        ItemsControllersBindings(),
        ShoppingLisrControllersBindings(),
        SlidersControllersBindings(), 
        LocationControllersBindings(),
        SettingsControllersBindings()
      ]
    ),
    GetPage(name: '/notifications', page: () => const NotificationsScreen()),
    GetPage(
      name: '/customOrder', 
      page: () => const CustomOrderScreen(),
      bindings: [
        ShoppingLisrControllersBindings(),
        ImagePickerControllersBindings(),
      ]
    ),
    GetPage(
      name: '/confirmForMe', 
      page: () => const ConfirmForMeScreen(),
      bindings: [
        AuthControllersBindings(),
        OrdersControllersBindings()
      ]
    ),
    GetPage(
      name: '/deliverForMe', 
      page: () => const DeliverForMeScreen(),
      bindings: [
        ImagePickerControllersBindings(),
        LocationControllersBindings(),
        AuthControllersBindings(),
        OrdersControllersBindings()
      ]
    ),
    GetPage(name: '/couriers', page: () => const CouriersScreen()),
    GetPage(
      name: '/items', 
      page: () => const ItemsScreen(),
      bindings: [
        ItemsControllersBindings()
      ]
    )
  ];
}
