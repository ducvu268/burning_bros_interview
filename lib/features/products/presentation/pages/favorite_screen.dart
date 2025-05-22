import 'package:burning_bros_interview/core/enums/shimmer_type_enum.dart';
import 'package:burning_bros_interview/core/extensions/text_style_ext.dart';
import 'package:burning_bros_interview/core/themes/app_color.dart';
import 'package:burning_bros_interview/core/utils/debouncer_util.dart';
import 'package:burning_bros_interview/core/widgets/appbar_global.dart';
import 'package:burning_bros_interview/core/widgets/m_scaffold.dart';
import 'package:burning_bros_interview/core/widgets/shimmer_animation_global.dart';
import 'package:burning_bros_interview/features/products/presentation/bloc/product_bloc.dart';
import 'package:burning_bros_interview/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final debouncer = DebouncerUtil(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((__) {
      context.read<ProductBloc>().add(LoadProductsEvent());
    });
  }

  @override
  void dispose() {
    debouncer.dispose();
    super.dispose();
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
            'Favorite Products',
            style: context.textStyle24.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.contentColorWhite,
            ),
          ),
          centerTitle: true,
          leadingWidth: 36,
          widgetLeft: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.contentColorWhite,
            ),
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (__, state) {
            if (state.status == ProductStatus.loading ||
                state.status == ProductStatus.initial) {
              return ShimmerAnimationGlobal(
                isLoading: true,
                type: ShimmerType.product,
                itemCount: 20,
                radius: 12,
              );
            }

            return Column(
              children: [
                const SizedBox(height: 16),
                if (state.productsFavorite.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'List is empty',
                        style: context.textStyle14.copyWith(color: Colors.grey),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.productsFavorite.length,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      separatorBuilder: (c, i) => const SizedBox(height: 16),
                      itemBuilder: (__, index) {
                        return ProductItem(
                          isShowIcon: false,
                          product: state.productsFavorite[index],
                          icon: Icons.favorite,
                          onToggleFavorite: (product) {
                            debouncer.run(() {
                              context.read<ProductBloc>().add(
                                ToggleFavoriteEvent(product),
                              );
                            });
                          },
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
