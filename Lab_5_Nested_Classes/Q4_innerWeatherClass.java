/*
 5d. Design a Weather class with a static nested class Forecast.
    a) The Forecast class should predict weather conditions (Sunny, Rainy, Cloudy) based on input data like temperature and humidity.
    b) Use the nested class to predict and display the weather forecast for different cities.   
 */

package Lab_5_Nested_Classes;

class Weather {
    static class Forecast {
        String city;
        double temperature;
        double humidity;

        public Forecast(String city, double temperature, double humidity) {
            this.city = city;
            this.temperature = temperature;
            this.humidity = humidity;
        }

        public void predict() {
            if (temperature > 30 && humidity > 70) {
                System.out.println(city + " will be Rainy.");
            } else if (temperature > 30) {
                System.out.println(city + " will be Sunny.");
            } else {
                System.out.println(city + " will be Cloudy.");
            }
        }
    }
}

public class Q4_innerWeatherClass {
    public static void main(String[] args) {
        Weather.Forecast city1 = new Weather.Forecast("Delhi", 40, 20);
        Weather.Forecast city2 = new Weather.Forecast("Mumbai", 31, 90);
        Weather.Forecast city3 = new Weather.Forecast("Bangalore", 25, 60);

        city1.predict();
        city2.predict();
        city3.predict();
    }
}