//
//  ListCell.swift
//  IBSTask
//
//  Created by Naseem Oyebola on 10/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListCell: View {
    var user: UserDetails
    
    func address() -> String {
        let number = user.location?.street.number ?? 0
        let nonZeroNumber = number == 0 ? "" : String(number)
        let streetName = user.location?.street.name ?? ""
        let city = user.location?.city ?? ""
        let state = user.location?.state ?? ""
        let country = user.location?.country ?? ""
        return "\(nonZeroNumber) \(streetName) \(city) \(state) \(country)"
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            WebImage(url: URL(string: user.picture?.medium ?? ""))
                .placeholder(Image(systemName: "photo"))
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .scaledToFit()
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(user.name?.first ?? "") \(user.name?.last ?? "")")
                Text(user.email ?? "")
                Text(address())
                
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(user: UserDetails.mock())
    }
}
