import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
                .font(.title3)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: 100, height: 100)
        .background(configuration.isPressed ? Color.gray.opacity(0.8) : Color.gray)
        .cornerRadius(10)
        .shadow(radius: configuration.isPressed ? 0 : 5)
    }
}

struct SettingButton: View {
    var label: String
    
    var body: some View {
        Button(action: {
        }) {
            Text(label)
        }
        .buttonStyle(CustomButtonStyle())
    }
}

struct SettingButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingButton(label: "BMI")
    }
}
