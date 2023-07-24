import 'package:design_system/design_system.dart';
import 'package:design_system/ui/widgets/card/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonOverallInfo extends StatefulWidget {
  const PokemonOverallInfo({
    super.key,
    required this.name,
    required this.number,
    required this.urlImage,
    required this.color,
    required this.types,
    required this.onTap,
    required this.isFavorite,
    required this.isMobile,
  });
  final String name;
  final String number;
  final String urlImage;
  final Color color;
  final List<String> types;
  final void Function()? onTap;
  final bool isFavorite;
  final bool isMobile;

  @override
  PokemonOverallInfoState createState() => PokemonOverallInfoState();
}

class PokemonOverallInfoState extends State<PokemonOverallInfo> with TickerProviderStateMixin {
  final GlobalKey _currentTextKey = GlobalKey();
  final GlobalKey _targetTextKey = GlobalKey();

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;
  final PageController _pageController = PageController();
  late AnimationController _horizontalSlideController;

  AnimationController get slideController => InfoStateProvider.of(context).slideController;
  AnimationController get rotateController => InfoStateProvider.of(context).rotateController;

  Animation<double> get textFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(slideController);
  Animation<double> get sliderFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: slideController,
        curve: const Interval(0.0, 0.5, curve: Curves.ease),
      ));

  @override
  void initState() {
    _horizontalSlideController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 300),
    )..forward();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _horizontalSlideController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  void _calculatePokemonNamePosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final targetTextBox = _targetTextKey.currentContext?.findRenderObject() as RenderBox?;
      final currentTextBox = _currentTextKey.currentContext?.findRenderObject() as RenderBox?;

      if (targetTextBox == null || currentTextBox == null) return;

      final targetTextPosition = targetTextBox.localToGlobal(Offset.zero);
      final currentTextPosition = currentTextBox.localToGlobal(Offset.zero);

      final newDiffLeft = targetTextPosition.dx - currentTextPosition.dx;
      final newDiffTop = targetTextPosition.dy - currentTextPosition.dy;

      if (newDiffLeft != textDiffLeft || newDiffTop != textDiffTop) {
        setState(() {
          textDiffLeft = newDiffLeft;
          textDiffTop = newDiffTop;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _calculatePokemonNamePosition();
    final screenSize = MediaQuery.of(context).size;
    final pokemonSize = screenSize.height * 0.3;
    return Stack(
      children: [
        ClipShadowPath(
          shadow: const Shadow(blurRadius: 20.0, color: Colors.black54),
          clipper: RoundedDiagonalPathClipper(),
          child: Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: widget.color,
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              width: screenSize.width,
              height: 30,
            )),
        Positioned(
          left: 50,
          bottom: -10,
          child: PokemonImage(
            imgUrl: widget.urlImage,
            placeholder: AppImages.bulbasaur,
            size: Size.square(pokemonSize),
            useHero: true,
          ),
        ),
        Positioned(
          left: 280,
          bottom: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroText(
                "#${widget.number.padLeft(3, "0")}",
                style: widget.isMobile
                    ? AppTextStylesMobile.regular16px.copyWith(
                        color: Colors.white,
                      )
                    : AppTextStylesDesktop.regular16px.copyWith(
                        color: Colors.white,
                      ),
              ),
              HeroText(
                widget.name,
                textKey: _currentTextKey,
                style: widget.isMobile
                    ? AppTextStylesMobile.extraBold32px.copyWith(
                        color: Colors.white,
                      )
                    : AppTextStylesDesktop.semiBold32px.copyWith(
                        color: Colors.white,
                      ),
              ),
              const SizedBox(height: 15),
              Row(
                children: widget.types
                    .take(2)
                    .map(
                      (type) => Padding(
                        padding: const EdgeInsets.only(bottom: 6, right: 5, top: 0),
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
        Positioned(
          right: 18,
          top: 15,
          child: InkWell(
            onTap: widget.onTap,
            child: SvgPicture.asset(
              widget.isFavorite ? AppIcons.favoriteSelected : AppIcons.favorite,
              height: 40,
              width: 40,
              package: PackageUtils.pakcageImportName,
            ),
          ),
        ),
      ],
    );
  }
}
