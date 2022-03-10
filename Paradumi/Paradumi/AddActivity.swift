//
//  AddActivity.swift
//  Paradumi
//
//  Created by Miks Latvis on 10/03/2022.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var data: Activities
    @State private var title = ""
    @State private var description = ""

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                TextField("Nosaukums", text: $title)
                TextField("Apraksts", text: $description)
            }
            .navigationTitle("Pievienot darbību")
            .toolbar {
                Button("Saglabāt") {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else { return }

                    let activity = Activity(title: trimmedTitle, description: description)
                    data.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(data: Activities())
    }
}
