import 'package:breweries/brewery_dto.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'API Consumer App',
      home: BreweryWidget(),
    );
  }
}

class BreweryWidget extends StatefulWidget {
  const BreweryWidget({super.key});

  @override
  BreweryWidgetState createState() => BreweryWidgetState();
}

class BreweryWidgetState extends State<BreweryWidget> {
  final String apiUrl = 'https://api.openbrewerydb.org/v1/breweries';
  final Dio _dio = Dio();
  List<BreweryDto> breweries = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchBreweries();
  }

  Future<void> fetchBreweries() async {
    try {
      final response = await _dio.get(apiUrl);
      setState(() {
        breweries = (response.data as List)
            .map((json) => BreweryDto.fromJson(json))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load breweries';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breweries'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : ListView.builder(
                  itemCount: breweries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(breweries[index].name ?? 'No Name'),
                      subtitle: Text(breweries[index].breweryType ?? 'No Type'),
                      onTap: () {
                        // You can add navigation or any other action here
                      },
                    );
                  },
                ),
    );
  }
}
