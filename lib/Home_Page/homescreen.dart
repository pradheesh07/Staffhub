import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:staffhub/Api_Integration/api.dart';
import 'package:staffhub/Api_Integration/json_convert.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late SharedPreferences loginData;
  late String email;

  Future<void> initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      email = loginData.getString('email')!;
    });
  }

  var selectedIndex = 0;
  var widgetList = [const HomeIcon(), const UserIcon()];

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: widgetList[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
        child: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Users')
          ],
        ),
      ),
    );
  }
}

class HomeIcon extends StatefulWidget {
  const HomeIcon({super.key});

  @override
  State<HomeIcon> createState() => _HomeIconState();
}

class _HomeIconState extends State<HomeIcon> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Container(
            margin: const EdgeInsets.only(top: 40, right: 22),
            height: 40,
            width: 40,
            child: const Image(
              image: AssetImage('assets/group.png'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            )),
        SingleChildScrollView(
            child: Column(children: [
          const Padding(padding: EdgeInsets.only(top: 50)),
          const Align(
            alignment: Alignment.center,
          ),
          Container(
            height: 71,
            width: 70,
            child: const Image(
              image: AssetImage('assets/home_logo.png'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          const SizedBox(
            height: 39,
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                child: Container(
                  width: 328,
                  height: 45,
                  decoration: BoxDecoration(color: Colors.grey.shade700),
                  child: const Center(
                    child: Text(
                      'Employee Productivity Dashboard',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                  width: 328,
                  height: 495,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                    ),
                  ),
                  child: Column(children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(
                          // color: Colors.red,
                          height: 20,
                          width: 170,
                          margin: const EdgeInsets.only(left: 31, top: 42),
                          child: const Text(
                            'Productivity on Monday',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(
                        width: 44,
                      ),
                      Container(
                          //color: Colors.red,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 42, left: 21),
                          height: 20,
                          width: 30,
                          child: const Text(
                            '4%',
                            style: TextStyle(color: Colors.green),
                          )),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 292),
                      height: 13,
                      width: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green),
                    ),
                    Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // color: Colors.red,
                                height: 20,
                                width: 170,
                                margin: const EdgeInsets.only(left: 31, top: 21),
                                child: const Text(
                                  'Productivity on Tuesday',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              width: 44,
                            ),
                            Container(
                                // color: Colors.red,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 21, left: 21),
                                height: 20,
                                width: 30,
                                child: const Text(
                                  '92%',
                                  style: TextStyle(color: Colors.green),
                                )),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 122),
                        height: 13,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green),
                      ),
                    ]),
                    Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // color: Colors.red,
                                height: 20,
                                width: 187,
                                margin: const EdgeInsets.only(left: 31, top: 21),
                                child: const Text(
                                  'Productivity on Wednesday',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              width: 44,
                            ),
                            Container(
                                // color: Colors.red,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 21, right: 12),
                                height: 20,
                                width: 38,
                                child: const Text(
                                  '122%',
                                  style: TextStyle(color: Colors.green),
                                )),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 76),
                        height: 13,
                        width: 224,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green),
                      ),
                    ]),
                    Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // color: Colors.red,
                                height: 20,
                                width: 170,
                                margin: const EdgeInsets.only(left: 31, top: 21),
                                child: const Text(
                                  'Productivity on Thursday',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              width: 44,
                            ),
                            Container(
                                // color: Colors.red,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 21, left: 21),
                                height: 20,
                                width: 30,
                                child: const Text(
                                  '93%',
                                  style: TextStyle(color: Colors.green),
                                )),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 135),
                        height: 13,
                        width: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green),
                      ),
                    ]),
                    Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // color: Colors.red,
                                height: 20,
                                width: 170,
                                margin: const EdgeInsets.only(left: 31, top: 21),
                                child: const Text(
                                  'Productivity on Friday',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              width: 44,
                            ),
                            Container(
                                // color: Colors.red,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 21, left: 21),
                                height: 20,
                                width: 30,
                                child: const Text(
                                  '89%',
                                  style: TextStyle(color: Colors.green),
                                )),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 152),
                        height: 13,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green),
                      ),
                    ]),
                    Column(children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                // color: Colors.red,
                                height: 20,
                                width: 170,
                                margin: const EdgeInsets.only(left: 31, top: 42),
                                child: const Text(
                                  'Productivity on Saturday',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              width: 44,
                            ),
                            Container(
                                // color: Colors.red,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 42, left: 21),
                                height: 20,
                                width: 30,
                                child: const Text(
                                  '98%',
                                  style: TextStyle(color: Colors.green),
                                )),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 115),
                        height: 13,
                        width: 191,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green),
                      ),
                    ])
                  ]))
            ],
          )
        ])),
      ]),
    );
  }
}

class UserIcon extends StatefulWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  State<UserIcon> createState() => _UserIconState();
}

class _UserIconState extends State<UserIcon> {
  late Future<List<Datum>?> employees;
  List<Datum>? allEmployees;
  List<Datum>? filteredEmployees;
  final ScrollController _scrollController = ScrollController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    employees = Api().getEmplyoeedetails();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, right: 22),
            height: 40,
            width: 40,
            child: const Image(
              image: AssetImage('assets/group.png'),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 71,
                    width: 70,
                    child: const Image(
                      image: AssetImage('assets/home_logo.png'),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 17),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 298,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          filteredEmployees = allEmployees!
                              .where((employee) => employee.employeeName
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Search by name',
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                      if (!isSearching) {
                        filteredEmployees = null;
                      }
                    },
                    icon: Icon(
                      isSearching ? Icons.close : Icons.search,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 27),
          FutureBuilder<List<Datum>?>(
            future: employees,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                allEmployees = snapshot.data;
                if (allEmployees != null) {
                  return Column(
                    children: [
                      if (!isSearching) buildEmployeeList(allEmployees!),
                      if (isSearching && filteredEmployees != null)
                        buildEmployeeList(filteredEmployees!),
                      if (isSearching && filteredEmployees == null)
                        const Center(
                          child: Text(
                            'No matching employees found.',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  );
                }
              }
              return const Center(
                  child: Text(
                'No data',
                style: TextStyle(color: Colors.white),
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget buildEmployeeList(List<Datum> employees) {
    return Column(
      children: employees
          .map(
            (employee) => Column(
              children: [
                const SizedBox(height: 27),
                Container(
                  margin: EdgeInsets.only(
                    left: employees.indexOf(employee).isOdd ? 20 : 0,
                    right: employees.indexOf(employee).isEven ? 10 : 0,
                  ),
                  width: 360,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.grey[900],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 20, left: 22)),
                        Text(
                          'Emp ID : ${employees.indexOf(employee) + 1}',
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Name: ${employee.employeeName}',
                          style: GoogleFonts.openSans(
                              fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(height: 32),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 16),
                            children: [
                              const TextSpan(
                                text: 'Age: ',
                              ),
                              TextSpan(
                                text: '${employee.employeeAge}',
                                style: GoogleFonts.roboto(
                                    color: Colors.orangeAccent),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.nunito(
                                color: Colors.white, fontSize: 16),
                            children: [
                              const TextSpan(
                                text: 'Employee Salary: ',
                              ),
                              TextSpan(
                                text: '${employee.employeeSalary}',
                                style: GoogleFonts.nunito(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
