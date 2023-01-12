import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow/home/presentation/bloc/home_bloc.dart';
import 'package:rainbow/home/presentation/bloc/home_event.dart';
import 'package:rainbow/home/presentation/bloc/home_state.dart';
import 'package:rainbow/home/presentation/constants/app_colors.dart';
import 'package:rainbow/home/presentation/widgets/home_body.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 156, 238, 206),
              Color.fromARGB(255, 58, 131, 208),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: _getAppBar(context),
          body: const SafeArea(
            child: HomeBody(),
          ),
        ),
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: _getSearchBox(context),
      titleSpacing: 0,
    );
  }

  Widget _getSearchBox(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 22,
          bottom: 14,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 46,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(
                    Iconsax.search_normal_1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        BlocProvider.of<HomeBloc>(context)
                            .add(FetchWeather(value));
                      },
                      decoration: const InputDecoration(
                        hintText: 'جستجوی شهر...',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
