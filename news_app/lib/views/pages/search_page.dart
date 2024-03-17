import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view_models/search_cubit/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a word!',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: TextButton(
                    onPressed: () async {
                      await cubit.searchArticles(_searchController.text);
                    },
                    child: const Text('Search')),
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              bloc: cubit,
              buildWhen: (previous, current) =>
                  current is SearchLoading ||
                  current is SearchLoaded ||
                  current is SearchError,
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is SearchLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        final article = state.articles[index];

                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              article.urlToImage ?? '',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            article.title ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            article.description ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is SearchError) {
                  return const Center(
                    child: Text('Error loading articles'),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: Text('You didn\'t search for anything yet!'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
