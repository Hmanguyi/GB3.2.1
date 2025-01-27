import SwiftUI

@main
struct MyApp: App {
    @StateObject private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            Group {
                switch appState.PgVariable {
                case -2:
                    Pgone()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                appState.PgVariable = -1
                                
                                arr { dataArray in
                                    if let dataArray = dataArray {
                                        print("Returned 2D Array: \(dataArray)")
                                        DispatchQueue.main.async {
                                            appState.Dic = dataArray
                                        }
                                    } else {
                                        print("Failed to get the array.")
                                    }
                                }

                                
                            }
                        }
                case -1:
                    Pggb()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                appState.PgVariable = 0
                                print("thisssssss")
                                print(appState.Dic)
                                
                            }
                        }
                case 0:
                    Pgdic()
                    .onAppear {
                            print("Page 0 initialized")
                            // Add any reinitialization logic here
                        }
                case 1:
                    Pgtwo()
                case 2:
                    Pgpro()
                case 3:
                    Pgsch()
                case 4:
                    Pgacc()
                default:
                    Text("Invalid Page Variable")
                }
            }
            .environmentObject(appState) // Apply once for all child views
        }
    
    }
}

