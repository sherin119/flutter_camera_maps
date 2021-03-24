import 'package:flutter/material.dart';
import 'package:flutter_camera_maps/screens/place_detail_screen.dart';
import 'package:flutter_camera_maps/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_camera_maps/providers/great_places.dart';
import 'package:flutter_camera_maps/screens/add_place_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListScreen(),
        routes: {
          '/second': (ctx) => AddPlaceScreen(),
          '/third': (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
