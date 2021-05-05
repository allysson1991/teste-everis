public with sharing class AccountTask {

    private TaskRepository taskRepository;

    public AccountTask() {
        this.taskRepository = new TaskRepository();
    }

    public void enricAccounthWithTask(List<Account> accounts) {
        List<Task> tasks = new List<Task>();
        for (Account acc : accounts) {
            Id idRecordId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('FinalCostumer').getRecordTypeId();
            if (String.isNotEmpty(acc.RecordTypeId) && acc.RecordTypeId == idRecordId) {
                Task task = createTask(acc);
                tasks.add(task);
            }
        }
        if (tasks.isEmpty()) return;
        taskRepository.save(tasks);
    }

    private Task createTask(Account acc) {
        Task task = new Task();
        task.Subject = 'Consumidor final';
        task.WhatId = acc.Id;
        task.Status = 'Not Started';
        task.Priority = 'Normal';
        return task;
    }

}