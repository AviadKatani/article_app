import 'package:articles_app/business_logic/bloc/search/search_bloc.dart';
import 'package:articles_app/business_logic/bloc/search/search_event.dart';
import 'package:articles_app/business_logic/bloc/search/search_state.dart';
import 'package:articles_app/data/dataproviders/local/database.dart';
import 'package:articles_app/data/models/articles.dart';
import 'package:articles_app/data/models/response.dart';
import 'package:articles_app/presentation/widgets/article_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildButtonsRow(),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is ClearedSearchState) {
                    return const Text('Cleared all data. Please fetch.');
                  }
                  if (state is SearchLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is SearchLoadedState) {
                    return StreamBuilder(
                      stream: state.response,
                      builder:
                          (context, AsyncSnapshot<List<Article>> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong...');
                        }
                        if (snapshot.data == null || snapshot.data!.isEmpty) {
                          return const CircularProgressIndicator();
                        } else {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height - 150,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                thickness: 3,
                                color: Colors.black,
                              ),
                              itemBuilder: (context, index) =>
                                  ArticleWidget(article: snapshot.data![index]),
                              itemCount: snapshot.data!.length,
                            ),
                          );
                        }
                      },
                    );
                  } else if (state is SearchErrorState) {
                    return const Center(
                      child: Text('Oops, Something went wrong...'),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Row(
      children: [
        TextButton(
          child: const Text('Clear'),
          onPressed: () => context.read<SearchBloc>().add(ClearSearchResults()),
        ),
        TextButton(
          child: const Text('Fetch'),
          onPressed: () => context.read<SearchBloc>().add(LoadSearchResults()),
        ),
      ],
    );
  }
}
