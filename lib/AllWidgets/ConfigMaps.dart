import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver_app/models/allUsers.dart';
import 'package:geolocator/geolocator.dart';

String mapKey = "AIzaSyA2rullfsikFqmWLhjXFewIUp6krKEAxqE";

User firebaseUser;

Users userCurrentInfo;

User currentfirebaseUser;

StreamSubscription<Position> homeTabPageStreamSubscription;