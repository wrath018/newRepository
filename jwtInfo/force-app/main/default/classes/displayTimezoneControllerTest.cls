@IsTest
public class displayTimezoneControllerTest {
    @IsTest
    public static void testUserTimezone() {
        // Create a test User record
        User testUser = new User();
        testUser.FirstName = 'John';
        testUser.LastName = 'Doe';
        testUser.Username = 'testgmail@example.com';
        testUser.Email = 'testgmail@example.com';
        testUser.TimeZoneSidKey = 'America/New_York';
        testUser.LocaleSidKey = 'en_US';
       testUser.LanguageLocaleKey='en_US';
        testUser.EmailEncodingKey = 'UTF-8';
        testUser.Alias='thihad';
        testUser.ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id;
        insert testUser;
        
        // Set the created User as the running user for the test
        System.runAs(testUser) {
            // Create a new instance of the controller
            displayTimezoneController controller = new displayTimezoneController();
            
            // Assert that the userTimezone property matches the user's timezone
            System.assertEquals('America/New_York', controller.userTimezone);
        }
    }
}