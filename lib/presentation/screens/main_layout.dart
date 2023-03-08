import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/constants/colors.dart';

import '../../business_logic/global/global_cubit.dart';
import '../widgets/default_text.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late GlobalCubit globalCubit;

  @override
  void initState() {
    globalCubit = GlobalCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Scaffold(
          appBar: globalCubit.screenCurrentIndex !=0 && globalCubit.screenCurrentIndex !=4  ?
          AppBar(
            centerTitle: true,
            title:  DefaultText(
              text: globalCubit.mainScreensTitles[globalCubit.screenCurrentIndex],
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            backgroundColor:globalCubit.screenCurrentIndex !=4 ? Colors.white :selectedTileColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () =>  globalCubit.changeScreen(globalCubit.screenPreviousIndex),
              icon: const Icon(Icons.arrow_back,color: Colors.black,),
            ),
          ) : null ,
          body: globalCubit.mainScreens[globalCubit.screenCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: globalCubit.screenCurrentIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor:Colors.black54,
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  color: Colors.black54,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message_outlined,
                    color: Colors.black54,
                  ),
                  label: 'Messages'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.luggage_rounded,
                    color: Colors.black54,
                  ),
                  label: 'Applied'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    color: Colors.black54,
                  ),
                  label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.black54,
                  ),
                  label: 'Profile'),
            ],
            onTap: (index) {
              globalCubit.changeScreen(index);
            },
          ),

        );
      },
    );
  }
}
