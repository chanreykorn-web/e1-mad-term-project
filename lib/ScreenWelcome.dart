import 'package:flutter/material.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            // Navication bar custome
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, CHAN",
                                style: TextStyle(
                                  color: Color(0xFFfd8044),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                "Halal Lab office",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey Halal, Good Afternoom",
                      style: TextStyle(fontSize: 20),
                    ),

                    // search box customer
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFf6f6f6),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Add your search logic here
                                },
                                icon: Icon(Icons.search),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search...',

                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Catagories
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Categories",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF212f3d),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(color: Color(0xFF212f3d)),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 16,
                              color: Color(0xFF2c3e50),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //list categories
                    SizedBox(height: 30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // "All" chip - active
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 159, 47, 0.482),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff6f6f6),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.local_fire_department,
                                    color: Colors.orange,
                                    size: 35,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'All',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // "Hot Dog" chip
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfff0f3f4),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff6f6f6),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),

                                    child: Image.asset(
                                      'assets/images/pizza.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Pizza',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // "Burger" chip
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfff0f3f4),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff6f6f6),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),

                                    child: Image.asset(
                                      'assets/images/profile.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Burger',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfff0f3f4),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff6f6f6),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),

                                    child: Image.asset(
                                      'assets/images/profile.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Burger',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Open Restaurants",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF212f3d),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "See All",
                              style: TextStyle(color: Color(0xFF212f3d)),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 16,
                              color: Color(0xFF2c3e50),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/images/pizza.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Rose Garden Restaurant",
                      style: TextStyle(fontSize: 25, color: Color(0xFF273746)),
                    ),
                    Text(
                      'Burger-Chiken - Riche - Wings',
                      style: TextStyle(color: Color(0xFF808b96)),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: Color(0xFFfd8044),
                                    size: 22,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "4.7",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delivery_dining,
                                    color: Color(0xFFfd8044),
                                    size: 22,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Free",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_alarms_outlined,
                                    color: Color(0xFFfd8044),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "20 min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://famousdaves.ae/uploads/custom-images/cheeseburger-wings-2023-10-17-03-02-38-5510.jpg',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Cheeseburger & Wings",
                      style: TextStyle(fontSize: 25, color: Color(0xFF273746)),
                    ),
                    Text(
                      'Single Cheeseburger, Buffalo Wings 4 pcs.',
                      style: TextStyle(color: Color(0xFF808b96)),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: Color(0xFFfd8044),
                                    size: 22,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "4.7",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delivery_dining,
                                    color: Color(0xFFfd8044),
                                    size: 22,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Free",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_alarms_outlined,
                                    color: Color(0xFFfd8044),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "20 min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
