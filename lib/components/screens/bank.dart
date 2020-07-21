import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';


class Bank{
  String name;
  String address;
  LatLng locationCoords;
  Widget image;
  String no;

  Bank(
    {this.name,
    this.address,
    this.locationCoords,
    this.image,
    this.no,
    }
    );
}

 final List<Bank> bbnames = [
  Bank(
          address: 'Rajkot Center',
          name: 'Rajot_Bloodbank',
          no: '7812345678',
          locationCoords: LatLng(22.3039,70.8022),
          image:Image(
           image:AssetImage('images/b1.jpg'),
           width: 80.0,
        ),
        ),
         Bank(
          address: 'Mumbai Center',
          name: 'Mumbai_Bloodbank',
          no: '6789123478',
          locationCoords: LatLng(19.0760,72.8777),
          image: Image(
          image:AssetImage('images/b7.png'),
          fit: BoxFit.cover,
          width:80.0
          ),
        ),
    Bank(
      address: 'Kerala center',
      name: 'Kerala Bloodbank',
      no: '9012345678',
      locationCoords: LatLng(10.8505,76.2711),
      image:Image(
       image:AssetImage('images/b3.jpg'),
       width: 80.0,
       height:160.0
      ),
    ),
      Bank(
        address: 'Bangaluru Center',
        name: 'Bangaluru_Bloddbank',
        no:'1234567890',
        locationCoords: LatLng(12.9716,77.5946),
        image:Image(
         image:AssetImage('images/b4.jpg'),
         width: 70.0,
         height: 120.0,
        ),
      ),
          Bank(
            address: 'Hyderabad Center',
            name: 'Hyderabad_Blodbank',
            no: '5643217890',
            locationCoords: LatLng(17.3850, 78.4867),
            image: Image(
            image:AssetImage('images/b5.jpg'),
            width:80.0
            ),
          ),
            Bank(
            address: 'Kolkata Center',
            name: 'kolkata_Bloodbank',
            no: '9045673211',
            locationCoords: LatLng(22.5726, 88.3639),
            image: Image(
             image:AssetImage('images/b6.jpg'),
            
             ), 
             ),
          
            Bank(
            address: 'Chennai Center',
            name: 'Chennai_Bloodbank',
            no: '6754322299',
            locationCoords: LatLng(13.0827, 80.2707),
            image:Image(
              image: AssetImage('images/b2.png'),
             
            ),
            ),



  ];

