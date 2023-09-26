import requests
url = "https://samples.openweathermap.org/data/2.5/forecast/hourly?q=London,us&appid=b6907d289e10d714a6e88b30761fae22"

def Temp(date_time):
    response = requests.get(url)
    data = response.json()
        
    for forecast in data['list']:
        if forecast['dt_txt'] == date_time:
            temperature = forecast['main']['temp']
            return temperature
0
def wind(date_time):
    response = requests.get(url)
    data = response.json()
    
    for forecast in data['list']:
        if forecast['dt_txt'] == date_time:
            wind_speed = forecast['wind']['speed']
            return wind_speed

def pressure(date_time):
    response = requests.get(url)
    data = response.json()
    
    for forecast in data['list']:
        if forecast['dt_txt'] == date_time:
            pressure = forecast['main']['pressure']
            return pressure

while True:
    print("Options:")
    print("1. Get Temperature")
    print("2. Get Wind Speed")
    print("3. Get Pressure")
    print("0. Exit")
    
    option = input("Choose an option: ")
    
    if option == "1":
        date_time = input("Enter date and time (YYYY-MM-DD HH:MM:SS): ")
        temperature = Temp(date_time)
        if temperature is not None:
            print(f"Temperature at {date_time}: {temperature}")
        else:
            print("Data not found for the specified date and time.")
    
    elif option == "2":
        date_time = input("Enter date and time (YYYY-MM-DD HH:MM:SS): ")
        wind_speed = wind(date_time)
        if wind_speed is not None:
            print(f"Wind Speed at {date_time}: {wind_speed}")
        else:
            print("Data not found for the specified date and time.")
    
    elif option == "3":
        date_time = input("Enter date and time (YYYY-MM-DD HH:MM:SS): ")
        pressure = pressure(date_time)
        if pressure is not None:
            print(f"Pressure at {date_time}: {pressure}")
        else:
            print("Data not found for the specified date and time.")
    
    elif option == "0":
        print("Exiting the program.")
        break
    
    else:
        print("Invalid option. Please choose a valid option.")
