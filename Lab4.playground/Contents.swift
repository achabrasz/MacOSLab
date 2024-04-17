import UIKit

class City: CustomStringConvertible {
    
    struct Location {
            let id: Int
            let type: String
            let name: String
            let rating: Int
        }
    
    let id: Int
    let name: String
    let cityDescription: String
    let latitude: Double
    let longitude: Double
    let keywords: [String]
    var locations: [Location] = []
    
    var description: String {
        var description = "City ID: \(id), Name: \(name), cityDescription: \(cityDescription), Latitude: \(latitude), Longitude: \(longitude), Keywords: \(keywords)\n"
        description += "Locations:\n"
                for location in locations {
                    description += "\(location.id): Type: \(location.type), Name: \(location.name), Rating: \(location.rating)\n"
                }
        return description
        }
    init(id: Int, name: String, cityDescription: String, latitude: Double, longitude: Double, keywords: [String]) {
            self.id = id
            self.name = name
            self.cityDescription = cityDescription
            self.latitude = latitude
            self.longitude = longitude
            self.keywords = keywords
        }
}

let cities: [City] = [
    City(id: 1, name: "New York", cityDescription: "The Big Apple", latitude: 40.7128, longitude: -74.0060, keywords: ["city", "culture", "food", "art"]),
    City(id: 2, name: "London", cityDescription: "The Big Smoke", latitude: 51.5074, longitude: -0.1278, keywords: ["city", "history", "culture", "architecture"]),
    City(id: 3, name: "Tokyo", cityDescription: "The Capital of Japan", latitude: 35.6895, longitude: 139.6917, keywords: ["city", "technology", "culture", "food"]),
    City(id: 4, name: "Paris", cityDescription: "The City of Light", latitude: 48.8566, longitude: 2.3522, keywords: ["city", "romance", "culture", "art"]),
    City(id: 5, name: "Sydney", cityDescription: "The Harbour City", latitude: -33.8688, longitude: 151.2093, keywords: ["city", "beach", "culture", "nature"]),
    City(id: 6, name: "Rome", cityDescription: "The Eternal City", latitude: 41.9028, longitude: 12.4964, keywords: ["city", "history", "culture", "architecture"]),
    City(id: 7, name: "Rio de Janeiro", cityDescription: "The Marvelous City", latitude: -22.9068, longitude: -43.1729, keywords: ["city", "beach", "culture", "music"]),
    City(id: 8, name: "Dubai", cityDescription: "The City of Gold", latitude: 25.276987, longitude: 55.296249, keywords: ["city", "luxury", "culture", "architecture"]),
    City(id: 9, name: "Barcelona", cityDescription: "The Capital of Catalonia", latitude: 41.3851, longitude: 2.1734, keywords: ["city", "culture", "architecture", "food"]),
    City(id: 10, name: "Berlin", cityDescription: "The Capital of Germany", latitude: 52.5200, longitude: 13.4050, keywords: ["city", "history", "culture", "nightlife"]),
    City(id: 11, name: "Los Angeles", cityDescription: "The City of Angels", latitude: 34.0522, longitude: -118.2437, keywords: ["city", "entertainment", "culture", "beach"]),
    City(id: 12, name: "Hong Kong", cityDescription: "The Pearl of the Orient", latitude: 22.3193, longitude: 114.1694, keywords: ["city", "culture", "food", "skyscrapers"]),
    City(id: 13, name: "Singapore", cityDescription: "The Lion City", latitude: 1.3521, longitude: 103.8198, keywords: ["city", "culture", "food", "technology"]),
    City(id: 14, name: "Mumbai", cityDescription: "The City of Dreams", latitude: 19.0760, longitude: 72.8777, keywords: ["city", "culture", "food", "business"]),
    City(id: 15, name: "Istanbul", cityDescription: "The City on Two Continents", latitude: 41.0082, longitude: 28.9784, keywords: ["city", "history", "culture", "architecture"]),
    City(id: 16, name: "Cape Town", cityDescription: "The Mother City", latitude: -33.9249, longitude: 18.4241, keywords: ["city", "nature", "culture", "beach"]),
    City(id: 17, name: "Toronto", cityDescription: "The Six", latitude: 43.65107, longitude: -79.347015, keywords: ["city", "culture", "food", "art"]),
    City(id: 18, name: "Bangkok", cityDescription: "The City of Angels", latitude: 13.7563, longitude: 100.5018, keywords: ["city", "culture", "food", "nightlife"]),
    City(id: 19, name: "Amsterdam", cityDescription: "The Venice of the North", latitude: 52.3676, longitude: 4.9041, keywords: ["city", "culture", "history", "canals"]),
    City(id: 20, name: "Venice", cityDescription: "The Floating City", latitude: 45.4408, longitude: 12.3155, keywords: ["city", "culture", "history", "canals"])
]

func generateRandomLocations() -> [City.Location] {
    let types = ["Restaurant", "Pub", "Museum", "Monument"]
    var locations: [City.Location] = []
    for i in 1...3 {
        let id = i
        let type = types.randomElement()!
        let name = "\(type) \(i)"
        let rating = Int.random(in: 1...5)
        let location = City.Location(id: id, type: type, name: name, rating: rating)
        locations.append(location)
    }
    return locations
}

for city in cities {
    let randomLocations = generateRandomLocations()
    city.locations.append(contentsOf: randomLocations)
}

func searchCityByName(name: String) -> [City] {
    var toReturn: [City] = []
    for city in cities {
        if city.name == name {
            toReturn.append(city)
        }
    }
    return toReturn
}

func searchCityByKeyword(keyWord: String) -> [City] {
    var toReturn: [City] = []
    for city in cities {
        for keyword in city.keywords {
            if keyword == keyWord {
                toReturn.append(city)
            }
        }
    }
    return toReturn
}

func distanceBetweenCities(city1: City, city2: City) -> Double{
    let latDiff = city1.latitude - city2.latitude
    let lonDiff = city1.longitude - city2.longitude
    let distance = sqrt(latDiff * latDiff + lonDiff * lonDiff)
    return distance
}

func closestCityToUserLocation(latitude: Double, longitude: Double) -> City? {
    var closestCity: City?
    var minDistance = Double.infinity

    let userCity = City(id: 0, name: "User Location", cityDescription: "User", latitude: latitude, longitude: longitude, keywords: ["1", "0"])

    for city in cities {
        let distance = distanceBetweenCities(city1: userCity, city2: city)
        if distance < minDistance {
            minDistance = distance
            closestCity = city
        }
    }

    return closestCity
}

func twoFurthest() -> [City] {
    var fCities: [City] = []
    var distance = 0.0
    for city1 in cities {
        for city2 in cities {
            if (city1 !== city2) {
                let distanceTemp = distanceBetweenCities(city1: city1, city2: city2)
                if (distanceTemp > distance) {
                    distance = distanceTemp
                    fCities = [city1, city2]
                }
            }
        }
    }
    return fCities
}

func citiesWithFiveStarRestaurants() -> [City] {
    var citiesWithFiveStarRestaurants: [City] = []
    
    for city in cities {
        let fiveStarRestaurants = city.locations.filter { $0.type == "Restaurant" && $0.rating == 5 }
        if !fiveStarRestaurants.isEmpty {
            citiesWithFiveStarRestaurants.append(city)
        }
    }
    
    return citiesWithFiveStarRestaurants
}

func locationsForCitySortedByRating(city: City) -> [City.Location] {
    return city.locations.sorted { $0.rating > $1.rating }
}

func displayCitiesWithFiveStarLocations() {
    for city in cities {
        let fiveStarLocations = city.locations.filter { $0.rating == 5 }
        if !fiveStarLocations.isEmpty {
            print("\(city.name) has \(fiveStarLocations.count) locations with 5-star rating:")
            for location in fiveStarLocations {
                print("\(location.name) - Rating: \(location.rating)")
            }
            print()
        }
    }
}

print("Search")
print(searchCityByName(name: "New York"))
print(searchCityByKeyword(keyWord: "art"))
print()

print("Distance")
print(closestCityToUserLocation(latitude: 21, longitude: 37))
print(twoFurthest())
print()

print("Extended Data Model + Search")
let citiesWithFiveStarRestaurantsList = citiesWithFiveStarRestaurants()
print("Cities with 5-star restaurants:")
for city in citiesWithFiveStarRestaurantsList {
    print(city.name)
}
let city = cities[0]
let sortedLocations = locationsForCitySortedByRating(city: city)
print("Locations in \(city.name) sorted by rating:")
for location in sortedLocations {
    print("\(location.name) - Rating: \(location.rating)")
}
displayCitiesWithFiveStarLocations()
