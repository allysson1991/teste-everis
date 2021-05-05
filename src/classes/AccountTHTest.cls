@isTest
public class AccountTHTest {

    @isTest
    static void validateAccountNumberCPF() {
        AccountRepository repository = new AccountRepository();
        Test.startTest();
        Account acc = AccountFixtureFactory.createAccountCPF();
        Test.stopTest();

        Account accValidate = repository.findOne(acc.Id);

        System.assertEquals('123456789', accValidate.AccountNumber);
        System.assertEquals('CPF', accValidate.Type);

    }

    @isTest
    static void validateAccountNumberCNPJ() {
        AccountRepository repository = new AccountRepository();
        Account acc = AccountFixtureFactory.newAccount('Teste', '123456789', 'CNPJ');
        repository.save(acc);
        acc.AccountNumber = '213456789';
        Test.startTest();
        repository.save(acc);
        Test.stopTest();

        Account accValidate = repository.findOne(acc.Id);

        System.assertEquals('213456789', accValidate.AccountNumber);
        System.assertEquals('CNPJ', accValidate.Type);

    }

    @isTest
    static void validateAccountNumberCPFInvalid() {
        AccountRepository repository = new AccountRepository();
        Account acc = AccountFixtureFactory.newAccount('Teste', '', 'CPF');
        Test.startTest();
        try {
            repository.save(acc);
        } catch (Exception e) {
            System.assertEquals( e.getMessage().contains('Número do cliente é inválido'), true);
        }
        Test.stopTest();

    }

    @isTest
    static void validateAccountNumberCNPJInvalid() {
        AccountRepository repository = new AccountRepository();
        Account acc = AccountFixtureFactory.newAccount('Teste', '', 'CNPJ');
        Test.startTest();
        try {
            repository.save(acc);
        } catch (Exception e) {
            System.assertEquals( e.getMessage().contains('Número do cliente é inválido'), true);
        }
        Test.stopTest();

    }

    @isTest
    static void accountTask() {
        AccountRepository repository = new AccountRepository();
        TaskRepository taskRepository = new TaskRepository();
        Id recordId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('FinalCostumer').getRecordTypeId();
        Account acc = AccountFixtureFactory.newAccount('Teste', '123456789', 'CNPJ');
        acc.RecordTypeId = recordId;

        Test.startTest();
        repository.save(acc);
        Test.stopTest();

        Task task = taskRepository.findBydWhatId(acc.Id);

        System.assertEquals(task.WhatId, acc.Id);
        System.assertEquals('Consumidor final', task.Subject);
        System.assertEquals('Not Started', task.Status);
        System.assertEquals('Normal', task.Priority);

    }

    

}