public class displayTimezoneController {
    public String userTimezone { get; set; }
    
    public displayTimezoneController() {
                userTimezone = UserInfo.getTimeZone().getID();

    }
}