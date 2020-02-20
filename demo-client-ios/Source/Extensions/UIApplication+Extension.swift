import CoreTelephony
import UIKit

extension UIApplication {
  var countryCode: String {
    let localeCountry: String? = Locale.current.regionCode ?? nil
    let carrierCountry: String? = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders?.first?.value.isoCountryCode ?? nil
    let countryCode = localeCountry != nil
      ? localeCountry
      : carrierCountry != nil
      ? carrierCountry : nil
    return countryCode?.uppercased() ?? "US"
  }
  
  var country: String {
    let countryLocalized = Locale.current.localizedString(forRegionCode: countryCode)
    let usLocalized = Locale.current.localizedString(forRegionCode: "US")
    return  countryLocalized ?? usLocalized ?? ""
  }
  
  var languageCode: String {
    let preferredLanguage = Locale.preferredLanguages.first?.components(separatedBy: "-").first
    let languageCode = preferredLanguage != nil ? preferredLanguage : nil
    return languageCode?.lowercased()  ?? "en"
  }
  
  var usesMetricSystem: Bool {
    return Locale.current.usesMetricSystem
  }
}
