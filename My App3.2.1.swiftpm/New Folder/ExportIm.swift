import SwiftUI

import Foundation
import UIKit

func uploadImageToGitHub(image: UIImage, accessToken: String, repoOwner: String, repoName: String, fileName: String) {
    // Convert UIImage to JPEG data
    guard let imageData = image.jpegData(compressionQuality: 1.0) else {
        print("Failed to convert image to data.")
        return
    }
    
    // GitHub API URL to get file details (to retrieve SHA for updating)
    let fileDetailsUrlString = "https://api.github.com/repos/\(repoOwner)/\(repoName)/contents/\(fileName)"
    guard let fileDetailsUrl = URL(string: fileDetailsUrlString) else { return }
    
    var request = URLRequest(url: fileDetailsUrl)
    request.httpMethod = "GET"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error fetching file details: \(error)")
            return
        }
        
        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            // If the file exists, extract the SHA from the response
            if let data = data, let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let sha = jsonResponse["sha"] as? String {
                // Proceed to update the file using the SHA
                uploadOrUpdateFileWithSHA(imageData: imageData, accessToken: accessToken, repoOwner: repoOwner, repoName: repoName, fileName: fileName, sha: sha)
            } else {
                // File doesn't exist, proceed with upload
                uploadOrUpdateFileWithSHA(imageData: imageData, accessToken: accessToken, repoOwner: repoOwner, repoName: repoName, fileName: fileName, sha: nil)
            }
        } else {
            // File doesn't exist, proceed with upload
            uploadOrUpdateFileWithSHA(imageData: imageData, accessToken: accessToken, repoOwner: repoOwner, repoName: repoName, fileName: fileName, sha: nil)
        }
    }
    
    task.resume()
}

func uploadOrUpdateFileWithSHA(imageData: Data, accessToken: String, repoOwner: String, repoName: String, fileName: String, sha: String?) {
    // GitHub API URL to create or update a file
    let urlString = "https://api.github.com/repos/\(repoOwner)/\(repoName)/contents/\(fileName)"
    guard let url = URL(string: urlString) else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Base64 encode the file data
    let base64EncodedFileData = imageData.base64EncodedString()
    
    // Construct the JSON body for the request
    var jsonBody: [String: Any] = [
        "message": "Upload image from app",
        "content": base64EncodedFileData
    ]
    
    // If sha is not nil, include it in the request for updating an existing file
    if let sha = sha {
        jsonBody["sha"] = sha
    }
    
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        // Set the body of the request
        request.httpBody = jsonData
        
        // Make the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 201 || response.statusCode == 200 {
                    print("Image uploaded/updated successfully!")
                } else {
                    print("Failed to upload image. Status code: \(response.statusCode)")
                    if let data = data, let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
        }
        task.resume()
    } catch {
        print("Failed to serialize JSON body: \(error)")
    }
}

