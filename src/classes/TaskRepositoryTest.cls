@isTest
public with sharing class TaskRepositoryTest {

    @isTest
    static void findBydId() {
        TaskRepository repository = new TaskRepository();
        Account acc = AccountFixtureFactory.createAccount();
        Task task = TaskFixtureFactory.createTask(acc.Id);
        Task taskToTest = new Task();

        Test.startTest();
        taskToTest = repository.findBydId(task.Id);
        Test.stopTest();

        System.assertEquals(task.Id, taskToTest.Id);


    }


}