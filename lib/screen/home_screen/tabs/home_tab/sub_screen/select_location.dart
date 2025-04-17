import 'package:fish_caster/import_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  TextEditingController searchController = TextEditingController();
  LatLng _selectedLocation = LatLng(
    40.7128,
    -74.0060,
  ); // New York City coordinates
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _selectedLocation = position;
    });
  }

  void _confirmLocation() {
    Navigator.pop(context, _selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: ClrCons.primaryColor,),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialZoom: 14.0,
              initialCenter:
                  _selectedLocation, // Start with New York City as the initial center
              onTap: (tapPosition, point) {
                _onMapTap(point);
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: _selectedLocation,
                    child: Icon(
                      Icons.location_pin, // Marker icon
                      color: Colors.red,
                      size: 40.0, // Size of the marker
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Fake Search Bar
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 120),
              child: Container(
                width: SizeCons.getWidth(context) * 0.8,
                child: CustomTextField(
                  controller: searchController,
                  hintText: 'Search',
                  suffixIcon: ImgCons.searchIcon,
                ),
              ),
            ),
          ),

          // Confirm Location Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: SizeCons.getWidth(context) * 0.2,
              ),
              child: CustomButton(
                width: SizeCons.getWidth(context) * 0.5,
                text: 'Confirm Location',
                onPressed: _confirmLocation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
