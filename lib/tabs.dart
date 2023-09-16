import 'package:app_todays_food/favorite/main_favorite.dart';
import 'package:app_todays_food/home/home.dart';
import 'package:app_todays_food/ifmt/main_ifmt.dart';
import 'package:app_todays_food/profile/ProfileTab.dart';
import 'package:app_todays_food/search/main_search.dart';
import 'package:flutter/material.dart';

import 'home/meals/grid_meals.dart';

final tab = [
  Container(
    child: Center(
      child: home(),
    ),
  ),
  Container(
    child: main_favorite(),
  ),
  Container(
    child: main_search(),
  ),
  Container(
    child: main_ifmt(),
  ),
  Container(
    child: Center(
      child: ProfileTab(),
    ),
  ),
];
