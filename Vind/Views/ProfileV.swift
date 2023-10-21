//
//  ProfileV.swift
//  Vind
//
//  Created by Vadym Malakhatko on 29.08.2023.
//

import SwiftUI
import Foundation

struct SettingsView: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators:false) {
                NavigationLink(destination: UserSettingsV()) {
                    VStack(alignment: .leading){
                        HStack(alignment: .center, spacing: 15){
                            Image(systemName: "gearshape")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                            Text("User Settings")
                                .font(Font.system(size: 17, weight: .regular))
                        }//: HSTACK
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        Divider()
                            .padding(.leading, 50)
                    }//: VSTACK
                }//: NAVIGATIONLINK
            }
            .background(Color.white)
        }
            
    }
}

struct BottomSheetView<Content: View>: View {
    @Binding var isOpen: Bool
    
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    
    let radius = 20
    let heightRatio = 0
    let indicatorWidth = 40
    let indicatorHeight = 5
    
    init(isOpen: Binding<Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * CGFloat(heightRatio)
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }
    
    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }
    
    private var indicator: some View {
        RoundedRectangle(cornerRadius: CGFloat(radius))
            .fill(Color.secondary)
            .frame(
                width: CGFloat(indicatorWidth),
                height: CGFloat(indicatorHeight)
            )
    }
    
    @GestureState private var translation: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.indicator.padding()
                    .background(Color.white)
                self.content
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color.white)
            .cornerRadius(CGFloat(radius))
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring(), value: isOpen)
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * 0.1
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < 0
                }
            )
        }
    }
}

struct ProfileActionsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            HStack(alignment: .center, spacing: 8){
                Button(action:{
                    print("edit profile")
                }){
                    Text("Edit Profile")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
                
                Button(action:{
                    print("Promotions")
                }){
                    Text("Promotions")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
            }//: HSTACK
            HStack(alignment: .center, spacing: 8){
                Button(action:{
                    print("insights")
                }){
                    Text("Insights")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
                
                Button(action:{
                    print("shop")
                }){
                    Text("Add Shop")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 220/255), lineWidth: 0.7)
                        )
                }
                
                Button(action:{
                    print("call")
                }){
                    Text("Call")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
            }//: HSTACK
        }//: VSTACK
    }
}

struct UserInfoView: View {
    var body: some View {
        HStack(alignment: .center){
            ZStack{
                Image("demo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                // add stories
                //                ZStack{
                //                    Circle()
                //                        .fill(Color.blue)
                //                        .frame(width: 25, height: 25)
                //
                //                    Image(systemName: "plus")
                //                        .font(Font.system(size: 16, weight: .bold))
                //                        .foregroundColor(.white)
                //
                //                    Circle().stroke(Color.white, lineWidth: 2)
                //                        .frame(width: 25, height: 25)
                //                }
                    .offset(x: 35, y: 30)
            }//: ZSTACK
            
            Spacer()
            /*
             HStack(alignment: .center, spacing:30){
             VStack(alignment: .center, spacing: 0){
             Text("71")
             .font(Font.system(size: 17, weight: .medium))
             Text("Posts")
             .font(.footnote)
             }//: VSTACK
             
             VStack(alignment: .center, spacing: 0){
             Text("1,078")
             .font(Font.system(size: 17, weight: .medium))
             Text("Followers")
             .font(.footnote)
             }//: VSTACK
             
             VStack(alignment: .center, spacing: 0){
             Text("83")
             .font(Font.system(size: 17, weight: .medium))
             Text("Following")
             .font(.footnote)
             }//: VSTACK
             }//: HSTACK
             */
            Spacer()
                .frame(width: 20)
        }//: HSTACK
    }
}

struct ProfilePostModel: Identifiable {
    let id = UUID()
    let image: String
    let type: String
}

var ProfilePostData: [ProfilePostModel] = [
    ProfilePostModel(image: "thumb1", type: "multiple"),
    ProfilePostModel(image: "thumb2", type: "video"),
    ProfilePostModel(image: "thumb3", type: "multiple"),
    ProfilePostModel(image: "thumb4", type: "video"),
    ProfilePostModel(image: "thumb5", type: "multiple"),
    ProfilePostModel(image: "thumb6", type: "video"),
    ProfilePostModel(image: "thumb7", type: "multiple"),
    ProfilePostModel(image: "thumb8", type: "video"),
    ProfilePostModel(image: "thumb9", type: "multiple")
]

struct HighlightDataModel: Identifiable {
    let id = UUID()
    let name: String
    let cover: String
}

var HighlightData: [HighlightDataModel] = [
    HighlightDataModel(name: "Design to code", cover: "h-1"),
    HighlightDataModel(name: "Coolors", cover: "h-2"),
    HighlightDataModel(name: "Design tips", cover: "h-3"),
    HighlightDataModel(name: "Proj Dovve", cover: "h-4"),
    HighlightDataModel(name: "Instaclone", cover: "h-5"),
    HighlightDataModel(name: "Animations", cover: "h-6"),
    HighlightDataModel(name: "Unboxing", cover: "h-7")
]

struct HighlightView: View {
    // MARK:- PROPERTIES
    
    let data: [HighlightDataModel]
    
    // MARK:- BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 10){
                ForEach(data) { item in
                    VStack(alignment: .center, spacing: 8){
                        ZStack {
                            Image(item.cover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 58, height: 58, alignment: .center)
                                .clipShape(Circle())
                            
                            Circle().stroke(Color(red: 220/255, green: 220/255, blue: 220/255) , style: StrokeStyle(lineWidth: 1, lineCap: .round))
                                .frame(width: 68, height: 68, alignment: .center)
                        }//: ZSTACK
                        
                        Text(item.name)
                            .lineLimit(1)
                            .font(Font.system(size: 12, weight: .regular))
                            .frame(width: 75)
                            .foregroundColor(.primary)
                    }//: VSTACK
                }//: LOOP
            }//: HSTACK
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }//: SCROLL
    }
}

struct PostGridView: View {
    // MARK:- PROPERTIES
    
    let gridLayout:[GridItem] =  Array(repeating: .init(.flexible(), spacing:2), count: 3)
    
    let data: [ProfilePostModel]
    
    // MARK:- BODY
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing:2){
            ForEach(data) { item in
                Image(item.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: (UIScreen.main.bounds.width - 8) / 3)
                    .clipped()
                    .overlay(
                        ZStack{
                            Image(item.type == "video" ? "video" : "multiple")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 28, height: 28)
                                .padding(5)
                        }
                        , alignment: .topTrailing
                    )
            }//: LOOP
        }//: GRID
    }
}


struct ProfileHeaderView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    @State private var bottomSheetShown = false
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .center, spacing: 0) {
                        VStack(alignment: .center, spacing: 0){
                            Divider()
                            //            Button(action:{
                            //
                            //            }){
                            //                Text("View Professional Resources")
                            //                    .font(Font.system(size: 11, weight: .medium))
                            //                    .frame(width:.infinity)
                            //                    .padding(.vertical, 12)
                            //                    .padding(.horizontal, 30)
                            //            }
                            Divider()
                            VStack(alignment: .leading){
                                UserInfoView()
                                Text(authenticationViewModel.user?.name ?? "Unknown")
                                    .font(Font.system(size: 13, weight: .medium))
                                    .padding(.top, 5)
                                    .padding(.bottom, 1)
                                //                                Text("👨‍💻 iOS Developer, UI / UX Designer\n🇮🇳 Himachal Pradesh, India\n📪 DM me for any query regarding iOS\n🔗Check out this link to buy coolors app👇")
                                //                                    .font(Font.system(size: 13, weight: .regular))
                                //                                + Text("\ncampsite.bio/dheeraj.iosdev")
                                //                                    .font(Font.system(size: 13, weight: .medium))
                                //                                    .foregroundColor(Color(red:9/255, green:55/255, blue:107/255))
                                // ProfileActionsView().padding(.top, 10)
                            }//: VSTACK
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                        }
                        // HighlightView(data: HighlightData)
                        // PostGridView(data: ProfilePostData).padding(.horizontal, 2)
                    }//: VSTACK
                }//: SCROLL
                .navigationBarTitle("", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text(authenticationViewModel.user?.name ?? "Unknown")
                            .font(Font.system(size: 22, weight: .bold))
                    }//: TOOLBAR ITEM LEFT
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action:{
                            bottomSheetShown.toggle()
                        }){
                            Image(systemName: "list.bullet")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.primary)
                        }
                        //                        HStack(alignment: .center, spacing: 20){
                        //                            Button(action:{
                        //                                bottomSheetShown.toggle()
                        //                            }){
                        //                               Image("add2")
                        //                                .resizable()
                        //                                .scaledToFill()
                        //                                .frame(width: 22, height: 22)
                        //                            }
                        //                        }
                    }//: TOOLBAR ITEM RIGHT
                }
            }//: NAVIGATION
            
            if bottomSheetShown {
                Rectangle()
                    .fill(Color.black)
                    .opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        bottomSheetShown.toggle()
                    }
            }
            
            GeometryReader { geometry in
                BottomSheetView(
                    isOpen: self.$bottomSheetShown,
                    maxHeight: geometry.size.height * 0.7
                ) {
                    SettingsView()
                }
            }.edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct ProfileView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        ProfileHeaderView()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationViewModel(authService: MockAuthenticationService()))
    }
}
