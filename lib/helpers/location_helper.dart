import 'dart:convert';

import 'package:http/http.dart';

const apiKey =
'pk.eyJ1Ijoic2hlcmluMTE5IiwiYSI6ImNraGMwNDE4cTA2Y3QzMm4xd3Q1d2piZHIifQ.5HXKoRYCTa5f1MGSiy-11w';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude}){
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$apiKey';

  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/$lng,$lat.json?access_token=$apiKey';
    final response = await get(url);
    return jsonDecode(response.body)['features'][0]['place_name'];


  }
  }





// //'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,
// +Mountain+View,+CA&key=$apiKey'