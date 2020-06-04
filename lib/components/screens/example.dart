import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Example{
  String name;
  String address;
  LatLng locationCoords;
  Widget image;
  String no;

  Example(
    {this.name,
    this.address,
    this.locationCoords,
    this.image,
    this.no,
    }
    );
}

 final List<Example> exnames = [
   Example(
          address: 'Ahmedabad Center',
          name: 'Ahmedabad_Foundation',
          no: '7812345678',
          locationCoords: LatLng(23.0225,72.5714),
          image:Image(
           image:AssetImage('images/a1.jpg'),
           width: 80.0,
        ),
        ),
         Example(
          address: 'Mumbai Center',
          name: 'Mumbai_ClothesFoundation',
          no: '6789123478',
          locationCoords: LatLng(19.0760,72.8777),
          image: Image(
          image:AssetImage('images/a2.jpg'),
          width:80.0
          ),
        ),
    Example(
      address: 'Delhi center',
      name: 'Delhi_ClothesFoundation',
      no: '9012345678',
      locationCoords: LatLng(28.7041, 77.1025),
      image:Image(
       image:AssetImage('images/a3.jpg'),
       width:80.0,
       height: 160.0,
      ),
    ),
      Example(
        address: 'Bangaluru Center',
        name: 'Bangaluru_ClothesFoundation',
        no:'1234567890',
        locationCoords: LatLng(12.9716,77.5946),
        image:Image(
         image:AssetImage('images/a4.jpg'),
          width: 80.0,
        
        ),
      ),
          Example(
            address: 'Hyderabad Center',
            name: 'Hyderabad_ClothesFoundation',
            no: '5643217890',
            locationCoords: LatLng(17.3850, 78.4867),
            image: Image(
            image:AssetImage('images/a5.jpg'),
            width:60.0
            ),
          ),
            Example(
            address: 'Kolkata Center',
            name: 'kolkata_ClothesFoundation',
            no: '9045673211',
            locationCoords: LatLng(22.5726, 88.3639),
            image: Image(
             image:AssetImage('images/a6.jpg'),
             width:60.0,
             height: 180.0,
             ), 
             ),
          
            Example(
            address: 'Chennai Center',
            name: 'Chennai_ClothesFoundation',
            no: '6754322299',
            locationCoords: LatLng(13.0827, 80.2707),
            image:Image(
              image: AssetImage('images/a7.jpg'),
              height: 150.0,
              width: 70.0,
            ),
            ),



  ];

