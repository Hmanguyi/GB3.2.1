import SwiftUI
import Foundation
import UIKit
import PlaygroundSupport



// AppState to manage shared state
// this is var that controls the pg



//this for the font 
// Function to register the font
func registerFont(withName name: String, fileExtension: String) {
    guard let fontURL = Bundle.main.url(forResource: name, withExtension: fileExtension) else {
        print("Font file \(name).\(fileExtension) not found in the bundle.")
        return
    }
    
    guard let fontData = try? Data(contentsOf: fontURL) else {
        print("Failed to load font data for \(name).\(fileExtension).")
        return
    }
    
    guard let provider = CGDataProvider(data: fontData as CFData) else {
        print("Failed to create data provider for font \(name).\(fileExtension).")
        return
    }
    
    guard let font = CGFont(provider) else {
        print("Failed to create CGFont for \(name).\(fileExtension).")
        return
    }
    
    var error: Unmanaged<CFError>?
    if !CTFontManagerRegisterGraphicsFont(font, &error) {
        print("Failed to register font \(name).\(fileExtension): \(String(describing: error))")
    } else {
        print("Font \(name).\(fileExtension) registered successfully!")
    }
}








// this for start pg timer
class AppState: ObservableObject {
    static let shared = AppState()
    @Published var PgVariable: Int = -2
    @Published var typeofimage: Double = 0
    @Published var Dic: [[String]] = [
        ["parkhe","Henry.P III","age 16\n5'10 ft\n145 lb\nnen SP\nstand\n[Oak] ","Min\nX","Meals\nX","this"],["parkhe","Henry.P III","age 16\n5'10 ft\n145 lb\nnen SP\nstand\n[Oak] ","Min\nX","Meals\nX","this"]
    ]
    
    
    
    @Published var Stats: [[Int]] = [
        [100,25,0,200,200,200],
        [100,25,0,200,200,200]
    ]
    
    
    
    
    }


var accountnumber : Int = 0
var valid: Int = -1

func searchForItem(in dictionary: [[String]], _ item: String) {
    for (outerIndex, subarray) in dictionary.enumerated() {
        if let innerIndex = subarray.firstIndex(of: item) {
            print("Found '\(item)' at row \(outerIndex), column \(innerIndex).")
            // Set the accountnumber to the outer index
            valid = 0
            accountnumber = outerIndex
            return
        }
    }
    print("'\(item)' not found.")
    valid = 99
}


func vad() -> Int {
    return valid
}



func accnum() -> Int {
    return accountnumber
}



func accnm() -> String {
    return AppState.shared.Dic[accnum()][0]
}




func typeofpic() -> Double {
    return AppState.shared.typeofimage
}
func typeofpicone()  {
    AppState.shared.typeofimage = 1 
}
func typeofpictwo()  {
    AppState.shared.typeofimage = 2 
}
func typeofpicthree()  {
    AppState.shared.typeofimage = 3 
}









//rad tri class 
struct Triangle: Shape {
    var point1: CGPoint
    var point2: CGPoint
    var point3: CGPoint
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            // Map points relative to the provided rect
            let scaledPoint1 = CGPoint(x: rect.origin.x + point1.x, y: rect.origin.y + point1.y)
            let scaledPoint2 = CGPoint(x: rect.origin.x + point2.x, y: rect.origin.y + point2.y)
            let scaledPoint3 = CGPoint(x: rect.origin.x + point3.x, y: rect.origin.y + point3.y)
            
            // Start at the first point
            path.move(to: scaledPoint1)
            // Draw lines to the other points
            path.addLine(to: scaledPoint2)
            path.addLine(to: scaledPoint3)
            // Close the path to form a triangle
            path.closeSubpath()
        }
    }
    
    
    }
