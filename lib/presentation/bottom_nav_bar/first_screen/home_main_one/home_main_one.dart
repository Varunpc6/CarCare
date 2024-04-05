import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
// import 'package:car_maintanance/presentation/all_data_cars.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/presentation/bottom_nav_bar/first_screen/home_main_one/car_card/current_car_widget.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  final String head;
  const PageOne({Key? key, required this.head}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool _isListView = true;
  double scaleFactor = 1.0;

  void _toggleView() {
    setState(() {
      _isListView = !_isListView;
    });
  }

  final List<String> backgroundImagePaths = [
    ImageConstant.refuelImg,
    ImageConstant.serviceImg,
    ImageConstant.incomeImg,
    ImageConstant.expensesImg,
    ImageConstant.routeImg,
    ImageConstant.reminderImg,
    // ImageConstant.reminderImg,
  ];

  String _getContainerName(int index) {
    switch (index) {
      case 0:
        return ConstName.refule;
      case 1:
        return ConstName.service;
      case 2:
        return ConstName.income;
      case 3:
        return ConstName.expense;
      case 4:
        return ConstName.route;
      case 5:
        return ConstName.document;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CarCard(),
              IconButton(
                onPressed: _toggleView,
                icon: Icon(_isListView ? Icons.grid_view : Icons.list),
              ),
              // // Data inputShowing
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => const DataCar()));
              //   },
              //   child: const Text('Car Details'),
              // ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: ResSize.height68(context),
            // width: double.infinity,
            child: _isListView ? _buildListView() : _buildGridView(),
          ),
        ],
      ),
    );
  }

  void navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.refuelListScreen);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.serviceListScreen);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.incomeListScreen);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.expenseListScreen);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.routeListScreen);
        break;
      case 5:
        Navigator.pushNamed(context, AppRoutes.documentListScreen);
        break;
      // Add cases for other indices as needed
      default:
      // Handle the case where the index is out of bounds or not handled
    }
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6, // Same number of items as in the GridView
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to the new page and pass the index
            navigateToPage(index);
          },
          child: Container(
            height: 100, // Adjust the height as needed
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  backgroundImagePaths[
                      index], // Assuming you have this list defined somewhere
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ListTile(
              title: Text(
                _getContainerName(index),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10.0, // Add vertical spacing between items
      crossAxisSpacing: 10.0, // Add horizontal spacing between items
      children: List.generate(6, (index) {
        return GestureDetector(
          onTap: () {
            // onTap(context);
            navigateToPage(index);
            // Perform action here if needed
            // print('Tapped on item at index $index');
          },
          child: Material(
            elevation: 4.0,
            color:
                const Color.fromARGB(122, 0, 0, 0), // Make material transparent
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    backgroundImagePaths[index],
                  ), // Change to your asset image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  _getContainerName(index),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  // // click Next Button
  // onTap(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.refuelListScreen);
  // }
}
