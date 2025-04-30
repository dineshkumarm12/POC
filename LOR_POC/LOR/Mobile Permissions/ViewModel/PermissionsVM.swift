//
//  SceneDelegate.swift
//  LOR
//
//  Created by Dineshkumar on 24/04/25.
//

import SalesforceSDKCore
import Combine

final class PermissionsVM: ObservableObject {
    @Published var permissionAssignments: [MobilePermissions] = []
    private var permissionCancellable: AnyCancellable?

    func fetchPermissions(forEmail email: String) {
        let soql =
        /*"""
        SELECT Id, Name, User__r.Email \
        FROM Mobile_Permission_Assignment__c \
        WHERE User__r.Email = '\(email)' AND IsActive__c = true
        """*/
        
        """
        SELECT Id, name, User__r.email, Permission_Code__c, Sort_Order__c from Mobile_Permission_Assignment__c where User__r.email = '\(email)' and IsActive__c = true Order by Sort_Order__c
        """

        let request = RestClient.shared.request(forQuery: soql, apiVersion: nil)

        permissionCancellable = RestClient.shared.publisher(for: request)
            .receive(on: RunLoop.main)
            .tryMap { response -> Data in
                let data = response.asData()

                // Print raw JSON for debugging
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                   let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
                   let prettyString = String(data: prettyData, encoding: .utf8) {
                    print("📥 Raw JSON Response:\n\(prettyString)")
                }

                return data
            }
            .decode(type: MobilePermissionResponse.self, decoder: JSONDecoder())
            .map { response in
                print("✅ Decoded Records Count: \(response.records.count)")
                return response.records
            }
            .catch { error -> Just<[MobilePermissions]> in
                print("❌ Decoding Error: \(error)")
                return Just([])
            }
            .assign(to: \.permissionAssignments, on: self)
    }
}
