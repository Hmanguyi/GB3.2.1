
import SwiftUI

struct Pgtwo: View {
    @State var arrowone = 0.5
    @State var arrowtwo = 0.5
    @State var arrowthree = 0.5
    @EnvironmentObject var appState: AppState
        var body: some View {
            ZStack {
                Color(UIColor(red: 230/255, green: 177/255, blue: 107/255, alpha: 1.0))
                    .ignoresSafeArea() // Fill the entire screen
                
                CameraView()
                    .edgesIgnoringSafeArea(.all)
                
                // Buttons overlay
                VStack {
                    Spacer() // Push buttons to the bottom
                    
                    HStack(spacing: 50) {
                        // First Button
                        Button(action: {
                            checkCameraPermission()
                            arrowone = 1
                            arrowtwo = 0.5
                            arrowthree = 0.5
                            AppState.shared.typeofimage = 1 
                            print(AppState.shared.typeofimage)
                            print(appState.Dic)
                        }) {
                            Image("Trash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                        
                        // Second Button
                        Button(action: {
                            arrowone = 0.5
                            arrowtwo = 1
                            arrowthree = 0.5
                            AppState.shared.typeofimage = 2 
                            print(AppState.shared.typeofimage)
                        }) {
                            Image("Recycle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                        
                        // Third Button
                        Button(action: {
                            print(appState.Dic[0][0])
                            arrowone = 0.5
                            arrowtwo = 0.5
                            arrowthree = 1
                            AppState.shared.typeofimage = 3 
                            print(AppState.shared.typeofimage)
                        }) {
                            Image("Organic")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.blue)
                        }
                    }.offset(x: 0, y: 380)
                    
                    // Bottom Button (previously offset)
                    Button(action: {
                        print("Tapped!")
                        arrowone = 0.5
                        arrowtwo = 0.5
                        arrowthree = 0.5
                        checkCameraPermission()
                        appState.PgVariable = 0
                    }) {
                        Image("Cont")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 190, height: 190)
                            .foregroundColor(.blue)
                        
                    }
                    .offset(x: -120, y: -400)
                    
                    VStack{
                        Image("Arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .foregroundColor(.blue)
                            .opacity(arrowone)
                        
                        
                        
                    }.offset(x: -150, y: 10)
                    
                    VStack{
                        Image("Arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .foregroundColor(.blue)
                            .opacity(arrowtwo)
                        
                        
                        
                    }.offset(x: 3, y: -85)
                    
                    VStack{
                        Image("Arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .foregroundColor(.blue)
                            .opacity(arrowthree)
                        
                        
                        
                    }.offset(x: 150, y: -180)
                    
                }
                .padding(.top, -80) // Adjust the top padding to keep the buttons properly spaced
                
                
            }
        }
    }

