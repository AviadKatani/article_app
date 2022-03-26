import 'package:articles_app/business_logic/bloc/search/search_bloc.dart';
import 'package:articles_app/business_logic/bloc/search/search_event.dart';
import 'package:articles_app/data/dataproviders/local/database.dart';
import 'package:articles_app/data/repositories/search_repository.dart';
import 'package:articles_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(SearchRepository())..add(LoadSearchResults()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Articles',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
