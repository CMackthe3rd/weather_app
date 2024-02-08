# Weather App

This is a simple command-line weather application implemented in Ruby. The app fetches weather data from the OpenWeatherMap API based on the provided zip code and displays the current weather conditions for that location.

## Features

- Retrieves location data based on the provided zip code using the OpenWeatherMap API.
- Fetches weather data for the specified location from the OpenWeatherMap API.
- Displays the current weather conditions including description, temperature, humidity, and wind speed.

## Prerequisites

- Ruby installed on your machine
- OpenWeatherMap API key

## How to Use

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/weather-app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd weather-app
   ```

3. Install dependencies:

   ```bash
   gem install net-http
   gem install json
   ```

4. Run the app:

   ```bash
   ruby weather_app.rb
   ```

5. Follow the instructions displayed in the console to enter a zip code and view the weather for that location.

## Configuration

Replace `'your_api_key_here'` in the `WeatherApp` class with your OpenWeatherMap API key. You can obtain an API key by signing up on the OpenWeatherMap website.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please fork the repository and create a pull request with your changes. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
