import UIKit

//hurray for playgrounds!

private let apiKey = "f16704b89b29c485b7e8165a5583b779"
private let baseURL = URL(string: "https://api.themoviedb.org/3")!
private let tvURL = baseURL.appendingPathComponent("tv")
private let shadowsURL = tvURL.appendingPathComponent("83631").appendingPathComponent("credits")
var urlComponents = URLComponents(url: shadowsURL, resolvingAgainstBaseURL: false)
let apiToken = URLQueryItem(name: "api_key", value: apiKey)
urlComponents?.queryItems = [apiToken]

let url = urlComponents!.url!
var request = URLRequest(url: url)
request.httpMethod = "GET"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let error = error {
        print("Error fetching cast: \(error)")
        return
    }

    if let response = response as? HTTPURLResponse {
        if response.statusCode != 200 {
            print("bad status: \(response.statusCode)")
        }
    }

    if let data = data {
        print(String(data: data, encoding: .utf8)!)
    }
}.resume()
