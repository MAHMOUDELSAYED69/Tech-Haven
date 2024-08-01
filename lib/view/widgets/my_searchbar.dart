import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_haven/utils/constants/colors.dart';
import 'package:tech_haven/utils/extentions/extentions.dart';

class MySearchBar extends StatefulWidget {
  final List<String> data;

  const MySearchBar({super.key, required this.data});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  late TextEditingController _controller;
  List<String> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _filteredData = widget.data;
    _controller.addListener(_filterData);
  }

  void _filterData() {
    setState(() {
      _filteredData = widget.data
          .where((item) =>
              item.toLowerCase().contains(_controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadowManager.searchBarShadow![0],
              ],
            ),
            child: TextField(
              controller: _controller,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              style: context.textTheme.bodySmall,
              onChanged: (_) => _filterData(),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 13.h),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _controller.clear(),
                      ),
              ),
            ),
          ),
        ),
        _controller.text.isNotEmpty
            ? _filteredData.isNotEmpty
                ? AnimatedList(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    initialItemCount: _filteredData.length,
                    itemBuilder: (context, index, animation) {
                      return GestureDetector(
                        onTap: () {},
                        child: SizeTransition(
                          sizeFactor: animation,
                          axisAlignment: 0.0,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: BoxShadowManager.cardShadow,
                            ),
                            child: Text(
                              _filteredData[index],
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 10,
                    ),
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: BoxShadowManager.cardShadow,
                    ),
                    child: Text(
                      'No results found! Try again.',
                      style: context.textTheme.bodySmall,
                    ))
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_filterData);
    _controller.dispose();
    super.dispose();
  }
}
