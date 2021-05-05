public with sharing class AccountTHService {

    public void validateAccountNumber(List<Account> accounts) {
        for(Account acc : accounts) {
            if (acc.Type != 'CNPJ' && acc.Type != 'CPF') continue;
            Boolean validateAccountNumber;
            if (acc.Type == 'CPF') validateAccountNumber = Utils.ValidaCPF(acc.AccountNumber);
            if (acc.Type == 'CNPJ') validateAccountNumber = Utils.ValidaCNPJ(acc.AccountNumber);
            if(!validateAccountNumber) acc.addError('Número do cliente é inválido');
        }
    }

}