import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:krishokbondhu/features/advisory/presentation/pages/advisory_page.dart';
import 'package:krishokbondhu/features/disease_detection/presentation/pages/disease_capture_page.dart';
import 'package:krishokbondhu/features/disease_detection/presentation/pages/disease_list_page.dart';
import 'package:krishokbondhu/features/disease_detection/presentation/pages/disease_upload_page.dart';
import 'package:krishokbondhu/features/education/presentation/pages/education_page.dart';
import 'package:krishokbondhu/features/helpline/presentation/pages/helpline_page.dart';
import 'package:krishokbondhu/features/home/presentation/pages/home_page.dart';
import 'package:krishokbondhu/features/market_price/presentation/pages/market_price_page.dart';
import 'package:krishokbondhu/features/weather/presentation/pages/weather_page.dart';
import 'package:krishokbondhu/shared/presentation/pages/assistant_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/disease/capture',
      builder: (context, state) => const DiseaseCapturePage(),
    ),
    GoRoute(
      path: '/disease/upload',
      builder: (context, state) => const DiseaseUploadPage(),
    ),
    GoRoute(
      path: '/disease/list',
      builder: (context, state) => const DiseaseListPage(),
    ),
    GoRoute(
      path: '/assistant',
      builder: (context, state) => const AssistantPage(),
    ),
    GoRoute(
      path: '/advisory',
      builder: (context, state) => const AdvisoryPage(),
    ),
    GoRoute(path: '/weather', builder: (context, state) => const WeatherPage()),
    GoRoute(
      path: '/market',
      builder: (context, state) => const MarketPricePage(),
    ),
    GoRoute(
      path: '/helpline',
      builder: (context, state) => const HelplinePage(),
    ),
    GoRoute(
      path: '/education',
      builder: (context, state) => const EducationPage(),
    ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('পাতাটি খুঁজে পাওয়া যায়নি'))),
  debugLogDiagnostics: true,
);
