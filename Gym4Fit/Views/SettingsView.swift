import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack {
            BMITopCard()
            Text("Hesaplamalar")
                .font(.largeTitle)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    Button(action: {
                    }) {
                        SettingButton(label: "BMI")
                    }
                    Button(action: {
                    }) {
                        SettingButton(label: "Vücut Yağı Yüzdesi")
                    }
                }
                HStack(spacing: 10) {
                    Button(action: {
                    }) {
                        SettingButton(label: "BMR")
                    }
                    Button(action: {
                    }) {
                        SettingButton(label: "Günlük Kaloriler")
                    }
                }
                HStack(spacing: 10) {
                    Button(action: {
                    }) {
                        SettingButton(label: "Makro Besin Dağılımı")
                    }
                    Button(action: {
                    }) {
                        SettingButton(label: "Hedef Kilo")
                    }
                }
                HStack(spacing: 10) {
                    Button(action: {
                    }) {
                        SettingButton(label: "Su İhtiyacı")
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
