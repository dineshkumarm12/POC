

import Foundation
import SalesforceSDKCore
import Combine

struct Contact :  Identifiable, Decodable  {
    let id: UUID = UUID()
    let Id: String
    let FirstName: String?
    let LastName: String?
    let PhoneNumber: String?
    let Email: String?
    let MailingStreet: String?
    let MailingCity: String?
    let MailingState: String?
    let MailingPostalCode: String?
}

struct ContactResponse: Decodable {
    var totalSize: Int
    var done: Bool
    var records: [Contact]
}


class ContactsForAccountModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    var account: Account?
    private var contactsCancellable: AnyCancellable?
    
    func fetchContactsForAccount(){
        guard let acct = self.account else {return}
        
        let request = RestClient.shared.request(forQuery: "SELECT id, firstName, lastName, phone, email, mailingStreet, mailingCity, mailingState, mailingPostalCode FROM Contact WHERE AccountID = '\(acct.id)'", apiVersion: nil)
        
        contactsCancellable = RestClient.shared.publisher(for: request)
            .receive(on: RunLoop.main)
            .tryMap({ (response) -> Data in
                response.asData()
            })
            .decode(type: ContactResponse.self, decoder: JSONDecoder())
            .map({ (record) -> [Contact] in
                record.records
            })
            .catch( { error in
                Just([])
            })
            .assign(to: \.contacts, on:self)        
    }
}
