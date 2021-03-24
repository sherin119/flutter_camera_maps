import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_camera_maps/providers/great_places.dart';
import 'package:flutter_camera_maps/screens/map_screen.dart';

class PlaceDetailScreen extends StatefulWidget {
  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(selectedPlace.image,
                fit: BoxFit.cover, width: double.infinity),
          ),
          SizedBox(height: 10),
          Text(
            selectedPlace.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 10),
          TextButton(
            child: Text('View on Map', style: TextStyle(color: Theme.of(context).primaryColor,),),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => MapScreen(
                        initialLocation: selectedPlace.location,
                        isSelecting: false),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
