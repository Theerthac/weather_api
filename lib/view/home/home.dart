import 'package:flutter/material.dart';
import 'package:weather/controller/weather_provider.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/weather_api_client.dart';
import 'package:weather/view/widgets/additional_information.dart';
import 'package:weather/view/widgets/current_weather.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiclient client = WeatherApiclient();

  Weather? data;

  TextEditingController searchController = TextEditingController();

  Future<void> getData(String place) async {
    data = await client.getCurrentWeather(place);
    Provider.of<WeatherProvider>(context, listen: false).changeValue();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData('Calicut');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 223, 223),
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
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  onFieldSubmitted: (String place) {
                    getData(place);
                  },
                  controller: searchController,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 18, left: 10),
                    isDense: true,
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    )),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.location_searching_sharp,
                        size: 26,
                      ),
                    ),
                    suffixIcon: searchController.text.length > 0
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.grey,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (data != null)
                currentWeather(
                  Icons.wb_sunny_rounded,
                  '${data!.temp}',
                  searchController.text.isEmpty
                      ? "Calicut"
                      : searchController.text,
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
              if (data != null)
                additionaInformation(
                  "${data!.wind}",
                  "${data!.humidity}",
                  "${data!.pressure}",
                  "${data!.feelsLike}",
                ),
            ],
          );
        }),
      ),
    );
  }
}
