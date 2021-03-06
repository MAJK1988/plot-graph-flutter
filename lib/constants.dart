import 'package:flutter/cupertino.dart';

const kPrimaryColor = Color(0xff0c9869);
const kTextColor = Color(0xff3c4046);
const kBackgroundColor = Color(0xfff9f0fd);
const kDefaultPadding = 20.0;
const kColoryellow = Color(0xFFF9A825);

List<String> timeScalerSlectedString = ["Hour", "Day", "Week", "Month"];
List<bool> stateTileScaler =
    List<bool>.filled(timeScalerSlectedString.length, false);

// data class
class ConsomeElectricPowerData {
  ConsomeElectricPowerData(this.time, this.consumerFate);
  final String time;
  final double consumerFate;
}

List<ConsomeElectricPowerData> hourConsumerData = [
  ConsomeElectricPowerData("00", 0.001),
  ConsomeElectricPowerData("01", 0.101),
  ConsomeElectricPowerData("02", 0.101),
  ConsomeElectricPowerData("03", 0.201),
  ConsomeElectricPowerData("04", 0.121),
  ConsomeElectricPowerData("05", 0.158),
  ConsomeElectricPowerData("06", 0.201),
  ConsomeElectricPowerData("07", 0.505),
  ConsomeElectricPowerData("08", 0.607),
  ConsomeElectricPowerData("09", 1.105),
  ConsomeElectricPowerData("10", 1.905),
  ConsomeElectricPowerData("11", 2.102),
  ConsomeElectricPowerData("12", 3.002),
  ConsomeElectricPowerData("13", 2.022),
  ConsomeElectricPowerData("14", 3.001),
  ConsomeElectricPowerData("15", 3.856),
  ConsomeElectricPowerData("16", 3.003),
  ConsomeElectricPowerData("17", 2.158),
  ConsomeElectricPowerData("18", 1.003),
  ConsomeElectricPowerData("19", 0.98),
  ConsomeElectricPowerData("20", 0.9),
  ConsomeElectricPowerData("21", 0.7),
  ConsomeElectricPowerData("22", 0.1),
  ConsomeElectricPowerData("23", 0.02),
];

List<ConsomeElectricPowerData> dayConsumerData = [
  ConsomeElectricPowerData("11/01", 18.0),
  ConsomeElectricPowerData("11/02", 19.2),
  ConsomeElectricPowerData("11/03", 20.1),
  ConsomeElectricPowerData("11/04", 18.5),
  ConsomeElectricPowerData("11/05", 19.2),
  ConsomeElectricPowerData("11/06", 15.2),
  ConsomeElectricPowerData("11/07", 4.9),
  ConsomeElectricPowerData("11/08", 3.2),
  ConsomeElectricPowerData("11/09", 3.201),
  ConsomeElectricPowerData("11/10", 18.2),
  ConsomeElectricPowerData("11/11", 19.6),
  ConsomeElectricPowerData("11/12", 22.2),
  ConsomeElectricPowerData("11/13", 23.1),
  ConsomeElectricPowerData("11/14", 13.001),
  ConsomeElectricPowerData("11/15", 16.856),
  ConsomeElectricPowerData("11/16", 17.003),
  ConsomeElectricPowerData("11/17", 18.158),
  ConsomeElectricPowerData("11/18", 13.003),
  ConsomeElectricPowerData("11/19", 22.98),
  ConsomeElectricPowerData("11/20", 20.9),
  ConsomeElectricPowerData("11/21", 12.7),
  ConsomeElectricPowerData("11/22", 11.1),
  ConsomeElectricPowerData("11/23", 23.02),
];

List<ConsomeElectricPowerData> weekConsumerData = [
  ConsomeElectricPowerData("11/01", 150.33),
  ConsomeElectricPowerData("11/07", 120.21),
  ConsomeElectricPowerData("11/14", 150.33),
  ConsomeElectricPowerData("11/21", 180.5),
  ConsomeElectricPowerData("11/28", 132.2),
  ConsomeElectricPowerData("12/05", 132.2),
  ConsomeElectricPowerData("11/12", 140.9),
  ConsomeElectricPowerData("11/19", 130.2),
  ConsomeElectricPowerData("11/26", 130.201),
  ConsomeElectricPowerData("12/03", 180.2),
  ConsomeElectricPowerData("12/10", 119.6),
  ConsomeElectricPowerData("12/17", 142.2),
  ConsomeElectricPowerData("12/24", 123.1),
  ConsomeElectricPowerData("12/30", 130.001),
];
List<ConsomeElectricPowerData> monthConsumerData = [
  ConsomeElectricPowerData("2020/01", 600.33),
  ConsomeElectricPowerData("2020/02", 590.21),
  ConsomeElectricPowerData("2020/03", 580.33),
  ConsomeElectricPowerData("2020/04", 600.5),
  ConsomeElectricPowerData("2020/05", 632.2),
  ConsomeElectricPowerData("2020/06", 582.2),
  ConsomeElectricPowerData("2020/07", 640.9),
  ConsomeElectricPowerData("2020/08", 590.2),
  ConsomeElectricPowerData("2020/09", 620.201),
  ConsomeElectricPowerData("2020/10", 580.2),
  ConsomeElectricPowerData("2020/11", 559.6),
  ConsomeElectricPowerData("2020/12", 652.2)
];
List<List<ConsomeElectricPowerData>> data = [
  hourConsumerData,
  dayConsumerData,
  weekConsumerData,
  monthConsumerData
];
