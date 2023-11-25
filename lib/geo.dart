import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:proj/obrgeo.dart';
import 'package:proj/loc.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}
Future<LocationMod> getLocation() async{
  var pos = await determinePosition();
  var data = {"lat": pos.latitude, "lon": pos.longitude};
  Map<String, dynamic> addr = json.decode(await getAddress(data));
  return LocationMod(pos.latitude, pos.longitude, addr['suggestions'][0]["value"]);
}