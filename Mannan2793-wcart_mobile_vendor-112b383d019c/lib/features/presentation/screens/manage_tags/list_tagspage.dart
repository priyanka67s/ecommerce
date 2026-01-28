import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/bloc/manage_tags_bloc.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/widgets/tag_shimmer.dart';
import 'package:wcart_vendor/router.dart';
import 'package:wcart_vendor/features/presentation/screens/manage_tags/controller/viewtag_controller.dart';
import 'package:wcart_vendor/util/app_utils.dart';
import 'package:wcart_vendor/util/color_resource.dart';
import 'package:wcart_vendor/util/custom_appbar.dart';
import 'package:wcart_vendor/util/string_resources.dart';
import 'package:wcart_vendor/util/svg_icon.dart';

import '../../../data/model/listtags_model.dart';
import '../add_product/screens/manage_simpleproduct/viewproduct/viewproduct_page.dart';

class ListTagsPage extends StatefulWidget {
  const ListTagsPage({super.key});
  static const String routeName = '/view_tags';
  @override
  State<ListTagsPage> createState() => _ListTagsPageState();
}

class _ListTagsPageState extends State<ListTagsPage> {
  ViewTagsModel viewTagsModel = ViewTagsModel();
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  bool _isNameSortedAscending = true;
  bool _isNameSortingEnabled = false;

  List<Tags> _allTags = [];
  List<Tags> get _paginatedItems {
    final filtered = _filteredProducts;
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = (_currentPage * _itemsPerPage).clamp(0, filtered.length);
    return filtered.sublist(start, end);
  }

  List<Tags> get _filteredProducts {
    List<Tags> filtered = [];

    if (_searchText.isEmpty) {
      filtered = _allTags;
    } else {
      filtered = _allTags
          .where((product) =>
              product.tagname?.toLowerCase().contains(_searchText) ?? false)
          .toList();
    }

    // Apply sorting if enabled
    if (_isNameSortingEnabled) {
      filtered.sort((a, b) {
        String nameA = a.tagname?.toLowerCase() ?? '';
        String nameB = b.tagname?.toLowerCase() ?? '';

        if (_isNameSortedAscending) {
          return nameA.compareTo(nameB);
        } else {
          return nameB.compareTo(nameA);
        }
      });
    }

    return filtered;
  }

  void _toggleNameSorting() {
    setState(() {
      if (_isNameSortingEnabled) {
        _isNameSortedAscending = !_isNameSortedAscending;
      } else {
        _isNameSortingEnabled = true;
        _isNameSortedAscending = true;
      }
      _currentPage = 1; // Reset to first page when sorting
    });
  }

  int get _totalPages => (_filteredProducts.length / _itemsPerPage).ceil();

  @override
  void initState() {
    getTagsData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageTagsBloc, ManageTagsState>(
      listener: (context, state) {
        if (state is ManageTagsLoaded) {
          if (state.viewTagsModel.status == "true") {
            viewTagsModel = state.viewTagsModel;
            _allTags = viewTagsModel.tags ?? [];
            _currentPage = 1;
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorResource.colorF3F4F8,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomAppBar(
                        titleText: "Manage Tags",
                        onBackButtonPressed: () {
                          getTagsData(context);
                        },
                        showAction: true,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorResource.colorFFFFFF,
                            // border: Border.all(
                            //   color: Color(0xffe3e3e5),
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 40,
                            ),
                            child: (state is ManageTagsLoaded &&
                                        state.viewTagsModel.tags == null ||
                                    state is ManageTagsLoaded &&
                                        state.viewTagsModel.tags?.isEmpty ==
                                            true)
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/empty_tags.png',
                                          height: 150,
                                          width: 150,
                                        ),
                                        Text(
                                          "No Tags Found",
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Get started by adding a new Tags!",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.addTags,
                                                      arguments: {
                                                    'fromScreen':
                                                        StringResources.addBrand
                                                  })!
                                                  .then((value) {
                                                getTagsData(context);
                                              });
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color:
                                                    ColorResource.color0D5EF8,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    3.0,
                                                  ),
                                                ),
                                              ),
                                              height: 40,
                                              width: AppUtils.vs(300, context),
                                              child: const Center(
                                                child: Text(
                                                  "Add Tags",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: const Text(
                                              "All Tags",
                                              style: TextStyle(fontSize: 19),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: SizedBox(
                                                    height: 35,
                                                    child: TextField(
                                                      controller:
                                                          _searchController,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                      onChanged: (value) {
                                                        setState(
                                                          () {
                                                            _searchText = value
                                                                .toLowerCase();
                                                            _currentPage =
                                                                1; // Reset page on new search
                                                          },
                                                        );
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10),
                                                        hintStyle:
                                                            const TextStyle(
                                                          fontSize: 15,
                                                          color: Color(
                                                              0xffffbbbbbb),
                                                        ),
                                                        hintText: "Search",
                                                        // suffixIcon: IconButton(
                                                        //   onPressed: () {},
                                                        //   icon: Icon(
                                                        //     Icons.search,
                                                        //   ),
                                                        // ),

                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                              Routes.addTags,
                                                              arguments: {
                                                            'fromScreen':
                                                                StringResources
                                                                    .addBrand
                                                          })!
                                                          .then(
                                                        (value) {
                                                          getTagsData(context);
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: ColorResource
                                                            .color0D5EF8,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            3.0,
                                                          ),
                                                        ),
                                                      ),
                                                      height: 40,
                                                      width: AppUtils.vs(
                                                          200, context),
                                                      child: const Center(
                                                        child: Text(
                                                          "Add Tags",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "Tag ID",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Image",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: MouseRegion(
                                                child: GestureDetector(
                                                  onTap: _toggleNameSorting,
                                                  child: Align(
                                                    child: Text(
                                                      StringResources.name,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Align(
                                                child: Text(
                                                  "Slug",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Align(
                                                child: Text(
                                                  "Status",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                child: Text(
                                                  "Type",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  "Action",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 0.5,
                                        color: ColorResource.colorDDDDDD,
                                      ),
                                      Expanded(
                                        child: state is ManageTagsLoading
                                            ? tagShimmer()
                                            : viewTagsModel.tags != null &&
                                                    _paginatedItems.isNotEmpty
                                                ? dataLayer(
                                                    _paginatedItems)
                                                : SizedBox(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Wrap(
                                              spacing: 5,
                                              children: [
                                                paginationBorderWidget(
                                                  child: IconButton(
                                                    icon:
                                                        Icon(Icons.first_page),
                                                    onPressed: _currentPage > 1
                                                        ? () => setState(() =>
                                                            _currentPage = 1)
                                                        : null,
                                                    padding: EdgeInsets.all(0),
                                                    iconSize: 18,
                                                  ),
                                                ),
                                                paginationBorderWidget(
                                                  child: IconButton(
                                                    icon: Icon(
                                                        Icons.chevron_left),
                                                    onPressed: _currentPage > 1
                                                        ? () => setState(() =>
                                                            _currentPage--)
                                                        : null,
                                                    padding: EdgeInsets.all(0),
                                                    iconSize: 18,
                                                  ),
                                                ),
                                                ...List.generate(_totalPages,
                                                    (index) {
                                                  final pageNumber = index + 1;
                                                  return GestureDetector(
                                                    onTap: () => setState(() =>
                                                        _currentPage =
                                                            pageNumber),
                                                    child: paginationBorderWidget(
                                                        child: Center(
                                                      child: Text(
                                                        "$pageNumber",
                                                        style: TextStyle(
                                                          color: _currentPage ==
                                                                  pageNumber
                                                              ? Colors.blue
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    )
                                                        // TextButton(
                                                        //   onPressed: () => setState(() =>
                                                        //       _currentPage = pageNumber),
                                                        //   style: TextButton.styleFrom(
                                                        //     backgroundColor:
                                                        //         _currentPage == pageNumber
                                                        //             ? Colors.blue
                                                        //             : Colors.transparent,
                                                        //   ),
                                                        //   child: Text(
                                                        //     "$pageNumber",
                                                        //     style: TextStyle(
                                                        //       color:
                                                        //           _currentPage == pageNumber
                                                        //               ? Colors.white
                                                        //               : Colors.black,
                                                        //     ),
                                                        //   ),

                                                        // ),
                                                        ),
                                                  );
                                                }),
                                                paginationBorderWidget(
                                                  child: IconButton(
                                                    icon: Icon(
                                                        Icons.chevron_right),
                                                    onPressed: _currentPage <
                                                            _totalPages
                                                        ? () => setState(() =>
                                                            _currentPage++)
                                                        : null,
                                                    padding: EdgeInsets.all(0),
                                                    iconSize: 18,
                                                  ),
                                                ),
                                                paginationBorderWidget(
                                                  child: IconButton(
                                                    icon: Icon(Icons.last_page),
                                                    onPressed: _currentPage <
                                                            _totalPages
                                                        ? () => setState(() =>
                                                            _currentPage =
                                                                _totalPages)
                                                        : null,
                                                    padding: EdgeInsets.all(0),
                                                    iconSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  ListView dataLayer(List<Tags> paginatedItems) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: ColorResource.colorDDDDDD,
          thickness: 0.5,
        );
      },
      itemCount: paginatedItems.length,
      itemBuilder: (context, i) {
        final tags = paginatedItems![i];
        int sNo = i + 1;
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "$sNo",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: CachedNetworkImage(
                      imageUrl:
                          '${tags.imageUrl}${tags.tagbanner}',
                      errorWidget: (context, url, error) => Image.network(
                        'https://wcartnode.webnexs.org/products/default.png',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    tags.tagname ?? '',
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    tags.tagslug ?? '',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  tags.status == 1
                      ? "Enable"
                      : "Disable",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  tags.tagtype == 1
                      ? "Basic"
                      : tags.tagtype == 2
                          ? "Offer"
                          : "Deals",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.addTags,
                            arguments: {
                              'fromScreen': StringResources.editTag,
                              'tagId': tags.tagid
                            },
                          )!
                              .then(
                            (value) {
                              if (value ?? false) {}
                            },
                          );
                        },
                        child: const SvgIcon(
                          'assets/icon/svg/edit.svg',
                          height: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void getTagsData(BuildContext context) {
  context.read<ManageTagsBloc>().add(GetTagsDataEvent());
}
