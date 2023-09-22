import 'package:flutter/material.dart';
import 'package:weather/controller/weather_provider.dart';
import 'package:weather/view/widgets/additional_information.dart';
import 'package:weather/view/widgets/current_weather.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    Provider.of<WeatherProvider>(context, listen: false).getData('Calicut');
    //getData('Calicut');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 223, 223),
        elevation: 0.0,
        title: const Text(
          "Weather",
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<WeatherProvider>(builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  onFieldSubmitted: (String place) {
                    value.getData(place);

                    //getData(place);
                  },
                  controller: value.searchController,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 18, left: 10),
                    isDense: true,
                    hintText: "Search",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.location_searching_sharp,
                        size: 26,
                      ),
                    ),
                    suffixIcon: value.searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              value.searchController.clear();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.grey,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (value.data != null)
                currentWeather(
                  Icons.wb_sunny_rounded,
                  '${value.data!.temp}',
                  value.searchController.text.isEmpty
                      ? "Calicut"
                      : value.searchController.text,
                ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Additional Information",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const SizedBox(
                height: 10.0,
              ),
              if (value.data != null)
                additionaInformation(
                  "${value.data!.wind}",
                  "${value.data!.humidity}",
                  "${value.data!.pressure}",
                  "${value.data!.feelsLike}",
                ),
            ],
          );
        }),
      ),
    );
  }
}
