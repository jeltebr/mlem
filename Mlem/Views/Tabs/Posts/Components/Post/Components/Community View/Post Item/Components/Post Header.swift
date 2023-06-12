//
//  Post Header.swift
//  Mlem
//
//  Created by Eric Andrews on 2023-06-11.
//

import Foundation
import SwiftUI

struct PostHeader: View {
    // passed in
    var post: APIPostView
    var account: SavedAccount
    
    // constants
    let communityIconSize: CGFloat = 30
    
    var body: some View {
        HStack {
            HStack(spacing: 4) {
                // community avatar and name
                NavigationLink(destination: CommunityView(account: account, community: post.community, feedType: .all)) {
                    if let communityAvatarLink = post.community.icon {
                        AvatarView(avatarLink: communityAvatarLink, overridenSize: communityIconSize)
                    }
                    else {
                        Image("Default Community").frame(width: communityIconSize, height: communityIconSize)
                    }
                    Text(post.community.name)
                        .bold()
                }
                Text("by")
                // poster
                NavigationLink(destination: UserView(userID: post.creator.id, account: account)) {
                    Text(post.creator.name)
                        .italic()
                        .if(post.creator.admin) { viewProxy in
                            viewProxy
                                .foregroundColor(.red)
                        }
                        .if(post.creator.botAccount ?? false) { viewProxy in
                            viewProxy
                                .foregroundColor(.indigo)
                        }
                        .if(post.creator.name == "lFenix") { viewProxy in
                            viewProxy
                                .foregroundColor(.yellow)
                        }
                }
            }
                
            Spacer()
            
            if (post.post.featuredLocal) {
                StickiedTag(compact: false)
            }
            
            // ellipsis menu TODO: implement
            Image(systemName: "ellipsis")
                .foregroundColor(.secondary)
        }
        .foregroundColor(.secondary)
    }
}
