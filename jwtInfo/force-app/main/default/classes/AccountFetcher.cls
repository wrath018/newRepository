public class AccountFetcher {
    public static List<Account> fetchAllAccounts() {
        List<Account> accounts = [SELECT Id, Name, Industry, BillingCity, BillingState FROM Account];
        return accounts;
    }
}