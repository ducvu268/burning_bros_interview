import 'package:burning_bros_interview/core/configs/app_router.dart';
import 'package:burning_bros_interview/core/enums/shimmer_type_enum.dart';
import 'package:burning_bros_interview/core/extensions/text_style_ext.dart';
import 'package:burning_bros_interview/core/themes/app_color.dart';
import 'package:burning_bros_interview/core/utils/debouncer_util.dart';
import 'package:burning_bros_interview/core/widgets/appbar_global.dart';
import 'package:burning_bros_interview/core/widgets/input_field_global.dart';
import 'package:burning_bros_interview/core/widgets/m_scaffold.dart';
import 'package:burning_bros_interview/core/widgets/shimmer_animation_global.dart';
import 'package:burning_bros_interview/features/products/presentation/bloc/product_bloc.dart';
import 'package:burning_bros_interview/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final debouncer = DebouncerUtil(milliseconds: 500);

  final ScrollController scrollController = ScrollController();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((__) {
      context.read<ProductBloc>().add(LoadProductsEvent());
      scrollController.addListener(_onListenScroll);
    });
  }

  void _onListenScroll() {
    final productBloc = context.read<ProductBloc>();
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        productBloc.state.status != ProductStatus.loading &&
        !productBloc.state.hasReachedMax) {
      productBloc.add(LoadMoreProductsEvent());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    debouncer.dispose();
    super.dispose();
  }

  void _onNavigateToFavorite() {
    Navigator.pushNamed(
      context,
      AppRoutes.favorite,
      arguments: context.read<ProductBloc>().state.productsFavorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MScaffold(
        appBar: AppbarGlobal(
          title: Text(
            'Products',
            style: context.textStyle24.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.contentColorWhite,
            ),
          ),
          centerTitle: true,
          leadingWidth: 36,
          widgetRight: Stack(
            children: [
              IconButton(
                onPressed: _onNavigateToFavorite,
                icon: const Icon(Icons.favorite),
                color: AppColors.contentColorWhite,
                iconSize: 32,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppColors.contentColorRed,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (__, state) {
                      return Center(
                        child: Text(
                          state.productsFavorite.length.toString(),
                          style: context.textStyle10.copyWith(
                            color: AppColors.contentColorWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {
            searchController.clear();
            context.read<ProductBloc>().add(LoadProductsEvent());
          },
          child: Column(
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InputFieldGlobal(
                  ctrl: searchController,
                  onChanged: (value) {
                    debouncer.run(() {
                      context.read<ProductBloc>().add(
                        SearchProductsEvent(value),
                      );
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    }
                    return null;
                  },
                  hintText: 'Search by product name',
                  borderWidth: 0.5,
                  borderColor: Colors.grey.shade400,
                  borderRadius: 12,
                  keyboardType: TextInputType.text,
                  fillColor: Colors.white,
                  prefixIcon: Image.asset(
                    'assets/icons/ic_search.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<ProductBloc, ProductState>(
                builder: (__, state) {
                  if (state.status == ProductStatus.loading ||
                      state.status == ProductStatus.initial) {
                    return Expanded(
                      child: ShimmerAnimationGlobal(
                        isLoading: true,
                        type: ShimmerType.product,
                        itemCount: 20,
                        radius: 12,
                      ),
                    );
                  }

                  if (state.status == ProductStatus.failure) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          state.errorMessage,
                          style: context.textStyle16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  if (state.products.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          'List is empty',
                          style: context.textStyle14.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount:
                          state.products.length + (state.hasReachedMax ? 0 : 1),
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      separatorBuilder: (c, i) => const SizedBox(height: 16),
                      itemBuilder: (__, index) {
                        if (index < state.products.length) {
                          return ProductItem(
                            isShowIcon: true,
                            product: state.products[index],
                            icon:
                                state.products[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                            onToggleFavorite: (product) {
                              debouncer.run(() {
                                context.read<ProductBloc>().add(
                                  ToggleFavoriteEvent(product),
                                );
                              });
                            },
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 48),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                                strokeWidth: 5,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
