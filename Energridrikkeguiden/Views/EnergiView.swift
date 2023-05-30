import SwiftUI

struct EnergiView: View {
    @StateObject var energiviewmodel = EnergiViewModel()
    @State private var displayedEnergi: Energimodel?
    @State private var buttontext = "Start"
    @State  var tapCount = 0
    var body: some View {
        VStack {
            VStack {
                Text("Trykk Start og en random")
                Text("Energi Drikke velges for deg")
            
            }
            .font(.system(size: 20))
            .lineLimit(3)
            .padding(.trailing, 4)
            .foregroundColor(Color.white)
            
            Rectangle()
                .fill(Color("PurplelightAksel"))
                .frame(width: 276, height: 350)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("PurplelightAksel"))
                        .overlay(
                            Text(displayedEnergi?.EnergiType ?? "")
                        )
                        .padding(.bottom, 40*5)
                        .overlay(
                            Image(displayedEnergi?.ImageType ?? "")
                                .resizable()
                                .frame(width: 60, height: 150)
                                .overlay(
                                    HStack {
                                        Button(action: {
                                            if let selectedDrink = displayedEnergi {
                                                    let currentPoints = selectedDrink.points
                                                    let newPoints = currentPoints + 1
                                                    energiviewmodel.updatePoints(for: selectedDrink, points: newPoints)
                                                    print("\(newPoints) points added to \(selectedDrink.EnergiType)")
                                              
                                                }
                                        }) {
                                            HStack {
                                                Text("✅Godkjent")
                                                    .font(.system(size: 15))
                                                    .lineLimit(3)
                                                    .padding(.trailing, 4)
                                                    .foregroundColor(Color.black)
                                                    .fontWeight(.semibold)
                                            }
                                            .frame(width: 112, height: 40)
                                            .foregroundColor(.white)
                                            .background(Color("GreyAksel"))
                                            .cornerRadius(20)
                                        }
                                        
                                        Button(action: {
                                            print("100% Godkjent")
                                            if let selectedDrink = displayedEnergi {
                                                    let currentPoints = selectedDrink.Secondpoints
                                                    let newPoints = currentPoints + 1
                                                    energiviewmodel.secondupdatePoints(for: selectedDrink, points: newPoints)
                                                    print("\(newPoints) points added to \(selectedDrink.EnergiType)")
                                
                                                }
                                        }) {
                                            HStack {
                                                Text("💯% Godkjent")
                                                    .font(.system(size: 15))
                                                    .lineLimit(3)
                                                    .padding(.trailing, 4)
                                                    .foregroundColor(Color.black)
                                                    .fontWeight(.semibold)
                                            }
                                            .frame(width: 112, height: 40)
                                            .foregroundColor(.white)
                                            .background(Color("GreyAksel"))
                                            .cornerRadius(20)
                                        }
                                    }
                                        .padding(.top, 40*5)
                                )
                        )
                        .padding(.bottom, 20)
                        .overlay(
                            Button(action: {
                                self.displayedEnergi = energiviewmodel.randomEnergi()
                                
                                self.tapCount += 1
                                
                                //første runde//
                                  if self.tapCount > 0 {
                                      buttontext.removeAll()
                                      buttontext = "Neste"
                                  }
                            }) {
                       
                                HStack {
                                    Text(buttontext)
                                        .font(.system(size: 20))
                                        .lineLimit(3)
                                        .padding(.trailing, 4)
                                        .foregroundColor(Color.white)
                                        .fontWeight(.semibold)
                                }
                                .frame(width: 149, height: 45)
                                .foregroundColor(.white)
                                .background(Color("PurpledarkAksel"))
                                .cornerRadius(5)
                            }
                                .padding(.top, 280)
                        )
                )
        }
        .onReceive(energiviewmodel.objectWillChange) { _ in
            print("Total points: \(energiviewmodel.totalPoints)")
        }
        
    }
    
}
struct EnergiView_Previews: PreviewProvider {
    static var previews: some View {
        EnergiView()
    }
}

