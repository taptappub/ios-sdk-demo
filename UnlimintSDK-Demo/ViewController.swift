//
//  ViewController.swift
//  UnlimintSDK-Demo
//
//  Created by Denis Gnezdilov on 01.12.2020.
//

import UIKit
import UnlimintSDK

class ViewController: UIViewController {
    let authorizationProvider: AuthorizationProvider = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        Unlimint.shared.environment = .sandbox
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onBind(_ sender: Any) {
        authorizationProvider.setup { mobileToken in
            DispatchQueue.main.async {
                Unlimint
                    .shared
                    .bindNewCardFor(for: mobileToken,
                                    with: .init(currency: .init(with: "USD"),
                                                customer: .init(id: "<id>",
                                                                email: "test@mail.com")),
                                    presentationStyle: .present(self))
            }
        }
    }
    
    @IBAction func onPayment(_ sender: Any) {
        authorizationProvider.setup { mobileToken in
            DispatchQueue.main.async {
                Unlimint
                    .shared
                    .payment(for: mobileToken,
                             with: .init(with: "<Merchant>",
                                         paymentMethod: "BANKCARD",
                                         customer: .init(homePhone: nil,
                                                         workPhone: nil,
                                                         email: "test@gmail.com",
                                                         locale: nil),
                                         merchantOrder: .init(description: "<description>", id: "<id>"),
                                         paymentData: .init(amount: 200,
                                                            currency: "USD",
                                                            note: nil,
                                                            dynamicDescriptor: nil,
                                                            transType: "01"),
                                         cardAccount: nil),
                             presentationStyle: .present(self))
            }
        }
    }
    
    @IBAction func onTokenPayment(_ sender: Any) {
        authorizationProvider.setup { mobileToken in
            DispatchQueue.main.async {
                Unlimint
                    .shared
                    .paymentWithToken(for: mobileToken,
                                      with: .init(with: "<Merchant>",
                                                  paymentMethod: "BANKCARD",
                                                  customer: .init(homePhone: nil,
                                                                  workPhone: nil,
                                                                  email: "test@gmail.com",
                                                                  locale: "nil"),
                                                  merchantOrder: .init(description: "<description>",
                                                                       id: "<id>"),
                                                  paymentData: .init(amount: 200,
                                                                     currency: "USD",
                                                                     note: nil,
                                                                     dynamicDescriptor: nil,
                                                                     transType: "0"),
                                                  cardAccount: .init(token: "<token>",
                                                                     pan: "<pan>",
                                                                     billingAddress: nil)),
                                      presentationStyle: .present(self))
            }
        }
    }

}
