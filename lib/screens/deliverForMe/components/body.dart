import 'dart:io';
import 'package:bsklita/constants.dart';
import 'package:bsklita/controllers/imagePickerController.dart';
import 'package:bsklita/controllers/locationController.dart';
import 'package:bsklita/screens/components/default_button.dart';
import 'package:bsklita/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controllers/authController.dart';
import '../../../controllers/ordersController.dart';
import '../../components/custom_suffix_icon.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final ImagePickerController _imagePickerController =
    Get.find<ImagePickerController>();
final LocationControler _locationController = Get.find<LocationControler>();
final OrdersController _ordersController = Get.find<OrdersController>();
final AuthController _authController = Get.find<AuthController>();

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "deliverForMe_screen_title".tr,
              style: const TextStyle(fontSize: 18, color: kTextColor),
            ),
            const VerticalSpacing(of: 2.0),
            buildItemNameFormField(),
            const VerticalSpacing(of: 1.0),
            buildItemQuantityFormField(),
            const VerticalSpacing(of: 1.0),
            buildItemImageFormField(),
            const VerticalSpacing(of: 1.0),
            buildPickupLocationFormField(context),
            const VerticalSpacing(of: 1.0),
            buildDeliveryLocationFormField(context),
            const VerticalSpacing(of: 1.0),
            buildNotesFormField(),
            const VerticalSpacing(of: 2.0),
            DefaultButton(
                text: "customOrder_screen_save_btn".tr,
                press: () async {
                  if (!_authController.authenticated) {
                    Get.toNamed('/signin');
                  }
                  var deliveryCoordinates =
                      await _locationController.getCoordinates(
                          address:
                              _ordersController.deliveryAddressController.text);
                  var pickupCoordinates =
                      await _locationController.getCoordinates(
                          address:
                              _ordersController.pickUpAddressController.text);
                  Map formData = {
                    'type': 3,
                    'userId': _authController.user.id,
                    'itemName': _ordersController.itemNameController.text,
                    'itemQuantity':
                        _ordersController.itemQuantityController.text,
                    'deliveryNotes':
                        _ordersController.deliveryNotesController.text,
                    'pickUpAddress':
                        _ordersController.pickUpAddressController.text,
                    'pickUpLat': pickupCoordinates[0],
                    'pickUpLng': pickupCoordinates[1],
                    'deliveryAddress':
                        _ordersController.deliveryAddressController.text,
                    'deliveryLat': deliveryCoordinates[0],
                    'deliveryLng': deliveryCoordinates[1]
                  };
                  //_ordersController.sendOrder(formData: formData);
                })
          ],
        ),
      ),
    );
  }

  buildItemNameFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: TextFormField(
        controller: _ordersController.itemNameController,
        onSaved: (value) {
          _ordersController.itemNameController.text = value!;
        },
        validator: (value) {
          _ordersController.validateItemName(value!);
        },
        decoration: InputDecoration(
          labelText: "deliverForMe_screen_item_name_field_lable".tr,
          hintText: "deliverForMe_screen_item_name_field_hint".tr,
          hintStyle: const TextStyle(color: kTextColor),
          suffixIcon: const CustomSuffixIcon(
            svgIcon: "assets/icons/gift-box.svg",
          ),
        ),
      ),
    );
  }

  buildItemQuantityFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: TextFormField(
        controller: _ordersController.itemQuantityController,
        keyboardType: TextInputType.number,
        onSaved: (value) {
          _ordersController.itemQuantityController.text = value!;
        },
        validator: (value) {
          _ordersController.validateItemQuantity(value!);
        },
        decoration: InputDecoration(
          labelText: "deliverForMe_screen_item_quantity_field_lable".tr,
          hintText: "deliverForMe_screen_item_quantity_field_hint".tr,
          hintStyle: const TextStyle(color: kTextColor),
          suffixIcon: const CustomSuffixIcon(
            svgIcon: "assets/icons/Plus Icon.svg",
          ),
        ),
      ),
    );
  }

  Padding buildItemImageFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding / 2),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "deliverForMe_screen_item_image_field_lable".tr,
              style:
                  TextStyle(color: kTextColor.withOpacity(0.6), fontSize: 16),
            ),
            const VerticalSpacing(of: 1.0),
            GestureDetector(
                onTap: () {
                  _imagePickerController.pickImage(ImageSource.camera);
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg")),
            Obx(() => _imagePickerController.selectedImagePath.value == ''
                ? const Text("")
                : Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
                    child: Image.file(
                        File(_imagePickerController.selectedImagePath.value)),
                  )),
          ],
        ),
      ),
    );
  }
}

Padding buildDeliveryLocationFormField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          controller: _ordersController.deliveryAddressController,
          onSaved: (value) {
            _ordersController.deliveryAddressController.text = value!;
          },
          validator: (value) {
            _ordersController.validateDeliveryAddress(value!);
          },
          decoration: InputDecoration(
            labelText: "deliverForMe_screen_item_delivery_location_lable".tr,
            suffixIcon: const CustomSuffixIcon(
              svgIcon: "assets/icons/Location_point.svg",
            ),
          ),
        ),
        const VerticalSpacing(of: 1.0),
        Obx(
          () => SizedBox(
            width: double.infinity,
            height: getScreenSize(context) * 20.0,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(_locationController.lat.value,
                      _locationController.lng.value),
                  zoom: 15),
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _locationController.mapController.complete(controller);
              },
              mapToolbarEnabled: true,
              markers: Set<Marker>.of(_locationController.markers.values),
            ),
          ),
        )
      ],
    ),
  );
}

Padding buildPickupLocationFormField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          controller: _ordersController.pickUpAddressController,
          onSaved: (value) {
            _ordersController.pickUpAddressController.text = value!;
          },
          validator: (value) {
            _ordersController.validatePickupAddress(value!);
          },
          decoration: InputDecoration(
            labelText: "deliverForMe_screen_item_pickup_location_lable".tr,
            suffixIcon: const CustomSuffixIcon(
              svgIcon: "assets/icons/Location_point.svg",
            ),
          ),
        ),
        const VerticalSpacing(of: 1.0),
        Obx(
          () => SizedBox(
            width: double.infinity,
            height: getScreenSize(context) * 20.0,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(_locationController.lat.value,
                      _locationController.lng.value),
                  zoom: 15),
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _locationController.mapController.complete(controller);
              },
              mapToolbarEnabled: true,
              markers: Set<Marker>.of(_locationController.markers.values),
            ),
          ),
        )
      ],
    ),
  );
}

buildNotesFormField() {
  return Padding(
    padding: const EdgeInsets.only(top: kDefaultPadding / 2),
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: _ordersController.deliveryNotesController,
      onSaved: (value) {
        _ordersController.deliveryNotesController.text = value!;
      },
      validator: (value) {},
      decoration: InputDecoration(
          labelText: "deliverForMe_screen_item_notes_lable".tr,
          hintText: "deliverForMe_screen_item_notes_hint".tr,
          hintStyle: const TextStyle(color: kTextColor),
          suffixIcon:
              const CustomSuffixIcon(svgIcon: "assets/icons/Conversation.svg"),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding * 2)),
    ),
  );
}
