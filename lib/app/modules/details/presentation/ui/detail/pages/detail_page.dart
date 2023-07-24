import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_app/app/core/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_app/app/core/pokedex/infra/models/pokemon_model.dart';
import 'package:pokedex_app/app/modules/details/presentation/ui/detail/controller/detail_controller.dart';

import '../../../../../../core/shared/consts/api_consts.dart';
import '../../../../../../core/shared/ui/controllers/custom_navigation_controller.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel? pokemonModel;
  const DetailPage({
    Key? key,
    required this.pokemonModel,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;
  final controllerBottomNavigation = Modular.get<CustomNavigationController>();
  final controller = Modular.get<DetailController>();

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppMetrics.isMobile(context);
    return InfoStateProvider(
      rotateController: _rotateController,
      slideController: _slideController,
      child: Column(
        children: [
          PokemonOverallInfo(
            isMobile: isMobile,
            isFavorite: widget.pokemonModel?.isFavorite ?? false,
            types: List.generate(
                widget.pokemonModel?.types?.length ?? 1,
                (index) =>
                    widget.pokemonModel?.types?[index].type?.name.toString().capitalize() ?? ""),
            onTap: () {
              controller.addOrRemoveFavorite(widget.pokemonModel as PokemonEntity);
              setState(() {});
            },
            name: widget.pokemonModel!.name.capitalize(),
            number: widget.pokemonModel?.id.toString() ?? "",
            urlImage:
                "${widget.pokemonModel?.sprites?.other?.officialArtwork?.frontDefault?.replaceAll("/media", ApiConst.imageUrl)}",
            color: AppUtils.getColorType(
                type: "${widget.pokemonModel?.types?.first.type?.name.toString().capitalize()}"),
          ),
          PokemonInfoCard(
            isMobile: isMobile,
            baseStat: List.generate(6, (index) {
              return widget.pokemonModel?.stats?[index].baseStat ?? 0;
            }),
            flavorText: widget.pokemonModel?.flavorText?.value.toString() ?? "",
            height: widget.pokemonModel?.height ?? 0,
            weight: widget.pokemonModel?.weight ?? 0,
            gender: widget.pokemonModel!.name.contains("-f") ? "famale" : "male",
            genus: widget.pokemonModel?.specieName?.genus
                    .toString()
                    .replaceAll("Pokémon", "")
                    .toLowerCase() ??
                "",
            abilityName: widget.pokemonModel?.abilities?.first.ability?.name?.toString() ?? "",
          ),
        ],
      ),
    );
  }
}
