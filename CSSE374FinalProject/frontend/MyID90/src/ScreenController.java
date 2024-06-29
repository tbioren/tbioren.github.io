import javax.swing.*;
import java.awt.*;
/*
Singleton:
This was a little complicated. I created a singleton in the ScreenController.
Originally, I was passing this into every screen object I created. This was a bad way of doing it.
 */
public class ScreenController extends JFrame {

	static CardLayout cl = new CardLayout();
	DbConnectionService db;
	static JPanel mainPanel = new JPanel(cl);
	WelcomeScreen welScreen;
	FulfillRequest fulfillScreen;
	User user;
	FulfillRequestInput fulfillInputScreen;
	CreateFlightsPage createFlightsPage;
	UpdateFlightInput updateFlightInputPage;
	CreateDestinationPage createDestinationPage;
	AddFlightToPlanPage addFlightToPlanPage;

	private static ScreenController sc;

	private ScreenController() {
		user = new User("", 0, true);
		setTitle("MyID90");
		setSize(1500, 750);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout(cl);// Add the main panel to the screen
	}

	public static synchronized ScreenController getInstance() {
		if (sc == null) {
			sc = new ScreenController();
			sc.addScreens();
			sc.add(mainPanel);
			sc.switchScreen("Login Screen");
			sc.setVisible(true);
		}
		return sc;
	}

	public void updateUser(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	private void addScreens() {
		JPanel loginScreen = new LoginScreen();
		mainPanel.add(loginScreen, "Login Screen");

		JPanel registerScreen = new RegisterScreen();
		mainPanel.add(registerScreen, "Register Screen");

		JPanel welcomeScreen = new WelcomeScreen();
		mainPanel.add(welcomeScreen, "Welcome Screen");
		welScreen = (WelcomeScreen) welcomeScreen;

		JPanel manageRequestScreen = new ManageRequestScreen();
		mainPanel.add(manageRequestScreen, "Manage Request Screen");

		JPanel submitRequestScreen = new SubmitRequestScreen( );
		mainPanel.add(submitRequestScreen, "Submit Request Screen");

		JPanel fulfillRequest = new FulfillRequest();
		mainPanel.add(fulfillRequest, "Fulfill Request");
		fulfillScreen = (FulfillRequest) fulfillRequest;

		JPanel manageDependentsScreen = new ManageDependentsScreen();
		mainPanel.add(manageDependentsScreen, "Manage Dependents Screen");

		JPanel fulfillRequestInput = new FulfillRequestInput();
		mainPanel.add(fulfillRequestInput, "Fulfill Request Input");
		fulfillInputScreen = (FulfillRequestInput) fulfillRequestInput;

		JPanel createFlightScreen = new CreateFlightsPage();
		mainPanel.add(createFlightScreen, "Create Flight Screen");
		createFlightsPage = (CreateFlightsPage) createFlightScreen;

		JPanel deleteFlightScreen = new DeleteFlight();
		mainPanel.add(deleteFlightScreen, "Delete Flight Screen");

		JPanel updateFlightSelect = new UpdateFlightSelect();
		mainPanel.add(updateFlightSelect, "Update Flight Select");

		JPanel updateFlightInput = new UpdateFlightInput();
		mainPanel.add(updateFlightInput, "Update Flight Input");
		updateFlightInputPage = (UpdateFlightInput) updateFlightInput;

		JPanel createDestinationScreen = new CreateDestinationPage();
		mainPanel.add(createDestinationScreen, "Create Destination Screen");
		createDestinationPage = (CreateDestinationPage) createDestinationScreen;

		JPanel deleteDestinationScreen = new DeleteDestinationPage();
		mainPanel.add(deleteDestinationScreen, "Delete Destination Screen");

		JPanel viewFlightScreen = new ViewFlightPage();
		mainPanel.add(viewFlightScreen, "View Flight Screen");

		JPanel parsingScreen = new ParsingScreen();
		mainPanel.add(parsingScreen, "Parsing Screen");

		JPanel planScreen = new PlanPage();
		mainPanel.add(planScreen, "Plan Screen");

		JPanel addPlanScreen = new AddPlanPage();
		mainPanel.add(addPlanScreen, "Add Plan Screen");

		JPanel addFlightToPlanScreen = new AddFlightToPlanPage();
		mainPanel.add(addFlightToPlanScreen, "Add Flight To Plan Screen");
		addFlightToPlanPage = (AddFlightToPlanPage) addFlightToPlanScreen;
	}

	public void switchScreen(String screen) {
		mainPanel.removeAll();
		addScreens();
		cl.show(mainPanel, screen);
	}
}
