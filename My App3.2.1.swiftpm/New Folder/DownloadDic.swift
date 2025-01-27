import SwiftUI
import Foundation



// Function to download the data from GitHub
func downloadFromGitHubsch(completion: @escaping ([[String]]?) -> Void) {
    guard let url = URL(string: "https://raw.githubusercontent.com/Hmanguyi/GBdic/main/dic.json") else {
        print("Invalid URL")
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error downloading file: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("No data received")
            completion(nil)
            return
        }
        
        // Attempt to parse as a 2D JSON array
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String]] {
                print("Downloaded 2D Array: \(jsonArray)")
                completion(jsonArray) // Return the array
            } else {
                print("JSON is not a 2D array")
                completion(nil)
            }
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            completion(nil)
        }
    }
    
    task.resume()
}

// Wrapper function to use the downloaded array
func arr(completion: @escaping ([[String]]?) -> Void) {
    downloadFromGitHubsch { dataArray in
        if let dataArray = dataArray {
            completion(dataArray) // Pass the array back through the completion handler
        } else {
            completion(nil) // Return nil if the download or parsing fails
        }
    }
}














