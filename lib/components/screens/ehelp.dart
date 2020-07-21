import 'package:flash_chat/models/center_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/center_model.dart';

class Ehelp extends StatefulWidget {
  static const String id = 'ehelp';
  @override
  _EhelpState createState() => _EhelpState();
}

class _EhelpState extends State<Ehelp> {
  GoogleMapController mapController;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();
    centerNames.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.name),
          draggable: false,
          infoWindow: InfoWindow(title: element.name, snippet: element.address),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _centerNamesList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.6).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            //  moveCamera();
          },
          child: Stack(children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 0.4),
                          blurRadius: 10.0),
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Row(
                    children: <Widget>[
                      centerNames[index].image,
                      SizedBox(width: 10.0),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              centerNames[index].name,
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              centerNames[index].address,
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 170.0,
                              child: Text(
                                centerNames[index].no,
                                style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Banks',
          style: GoogleFonts.acme(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(28.7041, 77.1025), zoom: 12.0),
              onMapCreated: mapCreated,
              markers: Set.from(allMarkers),
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: centerNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return _centerNamesList(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  moveCamera() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: centerNames[_pageController.page.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
