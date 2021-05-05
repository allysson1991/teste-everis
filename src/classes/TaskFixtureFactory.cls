@isTest
public class TaskFixtureFactory {
    public static Task newTask ( String subject, String whatId, String status, String priority ) {
        return new Task (
                   Subject = subject,
                   WhatId = whatId,
                   Status = status,
                   Priority = priority );
    }

    public static Task createTask ( String subject, String whatId, String status, String priority ) {
        return createTask ( newTask ( subject, whatId, status, priority ) );
    }
    
    public static Task createTask(String whatId) {
        return createTask ( newTask ( 'Consumidor final', whatId, 'Not Started', 'Normal' ));
    }

    public static Task createTask ( Task Task ) {

        insert task;
        return task;

    }
}
