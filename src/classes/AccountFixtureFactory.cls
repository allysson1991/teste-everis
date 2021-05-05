
@isTest
public class AccountFixtureFactory {

    public static Account newAccount(String name) {
        return new Account(
                   Name = name);
    }

    public static Account newAccount(String name, String accountNumber, String type) {
        return new Account(
                   Name = name,
                   AccountNumber = accountNumber,
                   Type = type);
    }

    public static Account createAccount(String name) {
        return createAccount ( newAccount (name));
    }

    public static Account createAccount() {
        return createAccount ( newAccount ('Teste'));
    }

    public static Account createAccountCPF() {
        return createAccount ( newAccount ('Teste', '123456789', 'CPF'));
    }

    public static Account createAccount (Account account) {

        insert account;
        return account;

    }

}