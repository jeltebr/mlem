//
//  UserSettingsView.swift
//  Mlem
//
//  Created by Sam Marfleet on 16/07/2023.
//

import SwiftUI

struct UserSettingsView: View {
    
    @AppStorage("shouldShowUserHeaders") var shouldShowUserHeaders: Bool = true
    @AppStorage("shouldShowUserAvatars") var shouldShowUserAvatars: Bool = true
    
    var body: some View {
        Form {
            Section {
                SwitchableSettingsItem(
                    settingPictureSystemName: "person.circle.fill",
                    settingPictureColor: .pink,
                    settingName: "Show user avatars",
                    isTicked: $shouldShowUserAvatars
                )

                SwitchableSettingsItem(
                    settingPictureSystemName: "rectangle.grid.1x2",
                    settingPictureColor: .pink,
                    settingName: "Show user banners",
                    isTicked: $shouldShowUserHeaders
                )
            }
        }
        .fancyTabScrollCompatible()
        .navigationTitle("Users")
    }
}
