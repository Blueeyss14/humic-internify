import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<dynamic> items = [];
  int page = 1;
  final int limit = 10;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  Future<void> fetchData({bool isRefresh = false}) async {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$limit',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> newData = json.decode(response.body);

        if (isRefresh) {
          items = newData;
        } else {
          items.addAll(newData);
        }

        setState(() {});
        if (isRefresh) {
          _refreshController.refreshCompleted();
        } else {
          if (newData.isEmpty) {
            _refreshController.loadNoData();
          } else {
            _refreshController.loadComplete();
          }
        }
      } else {
        _handleError(isRefresh);
      }
    } catch (e) {
      _handleError(isRefresh);
    }
  }

  void _handleError(bool isRefresh) {
    if (isRefresh) {
      _refreshController.refreshFailed();
    } else {
      _refreshController.loadFailed();
    }
  }

  void _onRefresh() async {
    page = 1;
    await fetchData(isRefresh: true);
  }

  void _onLoading() async {
    page++;
    await fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pull to Refresh API")),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        footer: CustomFooter(
          builder: (context, mode) {
            if (mode == LoadStatus.idle) {
              return const Center(child: Text("Tarik ke atas untuk load"));
            } else if (mode == LoadStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (mode == LoadStatus.failed) {
              return const Center(child: Text("Gagal load, coba lagi"));
            } else if (mode == LoadStatus.canLoading) {
              return const Center(child: Text("Lepaskan untuk load"));
            } else {
              return const Center(child: Text("Tidak ada data lagi"));
            }
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item['title']),
              subtitle: Text(item['body']),
            );
          },
        ),
      ),
    );
  }
}
