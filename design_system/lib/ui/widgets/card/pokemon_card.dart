import 'package:cached_network_image/cached_network_image.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:design_system/consts/icons/app_icons.dart';
import 'package:design_system/utils/app_utils.dart';
import 'package:design_system/utils/extension/blur.dart';
import 'package:design_system/utils/package_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/images/app_images.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokeballFraction = 1;
  static const double _pokemonFraction = 0.9;

  final void Function()? onPress;
  final String name;
  final String number;
  final String imageUrl;
  final Color colorPokemon;
  final List<String> types;
  final void Function()? onTap;
  final bool isFavorite;

  const PokemonCard({
    super.key,
    this.onPress,
    required this.number,
    required this.imageUrl,
    required this.colorPokemon,
    required this.name,
    required this.types,
    this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: colorPokemon,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorPokemon.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: colorPokemon,
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokeballDecoration(height: itemHeight),
                    _buildPokemon(height: itemHeight, imageUrl: imageUrl),
                    Positioned(
                      top: 18,
                      right: 20,
                      child: InkWell(
                        onTap: onTap,
                        child: SvgPicture.asset(
                          isFavorite ? AppIcons.favoriteSelected : AppIcons.favorite,
                          package: PackageUtils.pakcageImportName,
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    _CardContent(name: name, number: number, types: types),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPokeballDecoration({required double height}) {
    final pokeballSize = height * _pokeballFraction;
    return Positioned(
        bottom: -height * 0,
        right: -height * 0,
        child: Image.asset(
          AppImages.pokeball,
          package: PackageUtils.pakcageImportName,
          width: pokeballSize,
          height: pokeballSize,
          color: Colors.black.withOpacity(0.1),
        ).blurred(blur: 2.5, blurColor: colorPokemon));
  }

  Widget _buildPokemon({required double height, required String imageUrl}) {
    final pokemonSize = height * _pokemonFraction;

    return Positioned(
      bottom: -6,
      right: height * 0.5,
      child: PokemonImage(
        size: Size.square(pokemonSize),
        imgUrl: imageUrl,
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({
    Key? key,
    required this.number,
    required this.name,
    required this.types,
  }) : super(key: key);

  final String number;
  final String name;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "#${number.padLeft(3, "0")}",
              style: TextStyle(
                fontSize: 15,
                height: 1,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Hero(
              tag: number + name,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 30,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            Row(
              children: types
                  .take(2)
                  .map(
                    (type) => Padding(
                      padding: const EdgeInsets.only(bottom: 6, right: 5),
                      child: SvgPicture.asset(
                        AppUtils.getIconType(type: type),
                        package: PackageUtils.pakcageImportName,
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

class PokemonType extends StatelessWidget {
  const PokemonType({
    Key? key,
    this.large = false,
    this.colored = false,
    required this.colorType,
    this.extra = '',
    required this.value,
  }) : super(key: key);

  final Color colorType;
  final String value;
  final String extra;
  final bool large;
  final bool colored;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 5,
        ),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppUtils.getIconType(type: value),
              package: PackageUtils.pakcageImportName,
            ),
            const SizedBox(width: 5),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HSpacer extends SizedBox {
  const HSpacer(double size, {super.key}) : super(width: size);
}

class VSpacer extends SizedBox {
  const VSpacer(double size, {super.key}) : super(height: size);
}

class PokemonImage extends StatelessWidget {
  static const Size _cacheMaxSize = Size(700, 700);

  final String imgUrl;
  final EdgeInsets padding;
  final bool useHero;
  final Size size;
  final String placeholder;
  final Color? tintColor;

  const PokemonImage({
    Key? key,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.placeholder = AppImages.bulbasaur,
    this.tintColor,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: imgUrl,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutQuint,
          padding: padding,
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
            useOldImageOnUrlChange: true,
            maxWidthDiskCache: _cacheMaxSize.width.toInt(),
            maxHeightDiskCache: _cacheMaxSize.height.toInt(),
            fadeInDuration: const Duration(milliseconds: 120),
            fadeOutDuration: const Duration(milliseconds: 120),
            imageBuilder: (_, image) => Image(
              image: image,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: tintColor,
              fit: BoxFit.contain,
            ),
            placeholder: (_, __) => Image.asset(
              placeholder,
              package: PackageUtils.pakcageImportName,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: Colors.black12,
              fit: BoxFit.contain,
            ),
            errorWidget: (_, __, ___) => Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  placeholder,
                  package: PackageUtils.pakcageImportName,
                  width: size.width,
                  height: size.height,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  size: size.width * 0.3,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
