import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/text_styles_light.dart' as light;
import '../../utils/text_styles_dark.dart' as dark;
import '../profile/faq_screen.dart';

// HelpCenterScreen
class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  HelpCenterScreenState createState() => HelpCenterScreenState();
}

class HelpCenterScreenState extends State<HelpCenterScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor:
              themeController.isDarkMode.value ? dark4Color : whiteColor,
          elevation: 4.0,
          title: Text(
            helpCenter,
            style: themeController.isDarkMode.value
                ? dark.heading5
                : light.heading5,
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/left_arrow.svg',
              colorFilter: ColorFilter.mode(
                themeController.isDarkMode.value
                    ? whiteColor
                    : greyScale900Color,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TabBar(
                controller: _tabController,
                labelColor: primaryColor,
                unselectedLabelColor: greyScale500Color,
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: primaryColor,
                      width: 4.0,
                    ),
                  ),
                ),
                tabs: const [
                  Tab(text: fAQ),
                  Tab(text: support),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            FAQScreen(),
            const Center(
              child: Text('Tab 2 Content'),
            ),
          ],
        ),
      ),
    );
  }
}
