//
//  OfferItemView.swift
//  
//
//  Created by Matus Littva on 23/08/2022.
//

import SwiftUI

struct OfferItemView: View {
    let content: OfferItemUI
    @State var imageHeight: CGFloat = .zero

    private let hashtagsLayout = [GridItem(.adaptive(minimum: 110))]

    var body: some View {
        VStack {
            image
            mainTexts
            flightDuration

            Spacer()
            hashtags
        }
    }

    private var image: some View {
        AsyncImage(url: content.imageURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Color.gray
        }
        .frame(height: imageHeight)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            GeometryReader { proxy in
                Color.clear.onAppear {
                    imageHeight = proxy.frame(in: .global).width / 2
                }
            }
        }
    }

    private var mainTexts: some View {
        HStack {
            Text(content.title)
                .font(.title)
                .bold()
            Spacer()
            Text(content.price)
        }
        .padding(.vertical)
    }

    private var flightDuration: some View {
        HStack {
            Text("✈️ \(content.duration)")
                .foregroundColor(.secondary)
            Spacer()
        }
    }


    private var hashtags: some View {
        HStack {
            Text(content.hashtags)
                .font(.footnote)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding(.bottom, 48)
    }
}

struct OfferItemView_Previews: PreviewProvider {
    static var previews: some View {
        OfferItemView(content: .mock)
    }
}
