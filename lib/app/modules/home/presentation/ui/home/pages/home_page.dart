import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:design_system/ui/widgets/card/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/shared/consts/api_consts.dart';
import '../../../../../../core/shared/ui/controllers/custom_navigation_controller.dart';
import '../../../../../details/presentation/ui/detail/pages/detail_page.dart';
import '../controller/home_controller.dart';
import '../states/home_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _pokeballWidthFraction = 0.664;
  static const double _endReachedThreshold = 200;
  final controllerBottomNavigation = Modular.get<CustomNavigationController>();
  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchListPokemons();
    scheduleMicrotask(() {
      _scrollKey.currentState?.innerController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollKey.currentState?.innerController.dispose();
    _scrollKey.currentState?.dispose();

    super.dispose();
  }

  void _onScroll() {
    final innerController = _scrollKey.currentState?.innerController;
    if (innerController == null || !innerController.hasClients) return;
    final thresholdReached = innerController.position.extentAfter < _endReachedThreshold;
    if (thresholdReached) {
      // Load more!
      controller.loadMoreListPokemons();
    }
  }

  Future _onRefresh() async {
    controller.fetchListPokemons();
  }

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final pokeballSize = MediaQuery.of(context).size.width * _pokeballWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = 28;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin = -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeballSize / 2 - iconButtonPadding - iconSize / 2);

    final currentSize = MediaQuery.of(context).size;
    final isMobile = AppMetrics.isMobile(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: pokeballTopMargin,
            right: pokeballRightMargin,
            child: Image.asset(
              AppImages.pokeball,
              package: PackageUtils.pakcageImportName,
              width: pokeballSize,
              height: pokeballSize,
              color: AppColors.grey.withOpacity(0.1),
            ),
          ),
          NestedScrollView(
            key: _scrollKey,
            headerSliverBuilder: (_, __) => [
              if (isMobile)
                MainSliverAppBar(
                  isMobile: isMobile,
                  context: context,
                ),
            ],
            body: ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                if (value is HomeSuccessState) {
                  return CustomScrollView(
                    slivers: [
                      PokemonRefreshComponent(onRefresh: _onRefresh),
                      if (!isMobile)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controllerBottomNavigation.changePage(0);
                                  },
                                  child: SvgPicture.asset(
                                    controllerBottomNavigation.selectedIndex == 0
                                        ? AppIcons.homeSelectedDesktop
                                        : AppIcons.homeDesktop,
                                    package: PackageUtils.pakcageImportName,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    controllerBottomNavigation.changePage(1);
                                  },
                                  child: SvgPicture.asset(
                                    controllerBottomNavigation.selectedIndex == 1
                                        ? AppIcons.favoritesSelectedDesktop
                                        : AppIcons.favoritesDesktop,
                                    package: PackageUtils.pakcageImportName,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    controllerBottomNavigation.changePage(2);
                                  },
                                  child: SvgPicture.asset(
                                    controllerBottomNavigation.selectedIndex == 2
                                        ? AppIcons.perfilSelectedDesktop
                                        : AppIcons.perfilDesktop,
                                    package: PackageUtils.pakcageImportName,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                          child: Center(
                            child: Text(
                              "Qual Pokémon você está procuranto",
                              style: isMobile
                                  ? AppTextStylesMobile.extraBold32px.copyWith(
                                      color: Colors.black,
                                    )
                                  : AppTextStylesDesktop.semiBold32px.copyWith(
                                      color: Colors.black,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(28),
                        sliver: SliverGrid(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: currentSize.width > 750
                                ? currentSize.width > 1000
                                    ? currentSize.width > 1500
                                        ? 4
                                        : 3
                                    : 2
                                : 1,
                            childAspectRatio: 2.5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (_, index) {
                              final pokemonModel = value.listPokemons[index];
                              return PokemonCard(
                                isFavorite: pokemonModel.isFavorite,
                                colorPokemon: AppUtils.getColorType(
                                    type:
                                        "${pokemonModel.types?.first.type?.name.toString().capitalize()}"),
                                number: pokemonModel.id.toString(),
                                imageUrl:
                                    "${pokemonModel.sprites?.other?.officialArtwork?.frontDefault?.replaceAll("/media", ApiConst.imageUrl)}",
                                name: pokemonModel.name.capitalize(),
                                types: List.generate(
                                    pokemonModel.types?.length ?? 1,
                                    (index) =>
                                        pokemonModel.types?[index].type?.name
                                            .toString()
                                            .capitalize() ??
                                        ""),
                                onTap: () {
                                  controller.addOrRemoveFavorite(pokemonModel);
                                  setState(() {});
                                },
                                onPress: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    constraints:
                                        const BoxConstraints(maxWidth: 540, maxHeight: 600),
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => DetailPage(
                                      pokemonModel: pokemonModel,
                                    ),
                                  );
                                },
                              );
                            },
                            childCount: value.listPokemons.length,
                          ),
                        ),
                      ),
                      if (value is HomeLoadMore)
                        SliverToBoxAdapter(
                          child: Center(
                            child: Image.asset(
                              AppImages.pikloader,
                              package: PackageUtils.pakcageImportName,
                            ),
                          ),
                        ),
                      if (value is HomeLoadMoreError)
                        SliverFillRemaining(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 28),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.warning_amber_rounded,
                              size: 60,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                    ],
                  );
                }
                if (value is HomeErrorState) {
                  return CustomScrollView(
                    slivers: [
                      PokemonRefreshComponent(onRefresh: _onRefresh),
                      SliverFillRemaining(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 28),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.warning_amber_rounded,
                            size: 60,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (value is HomeLoadingState) {
                  return Center(
                    child: Image.asset(
                      AppImages.pikloader,
                      package: PackageUtils.pakcageImportName,
                    ),
                  );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
