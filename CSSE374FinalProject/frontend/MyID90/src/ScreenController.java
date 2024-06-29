import javax.swing.*;
import java.awt.*;
import java.util.HashMap;

/*
Singleton:
This was a little complicated. I created a singleton in the ScreenController.
Originally, I was passing this into every screen object I created. This was a bad way of doing it.

Command:
This was basically already using the command design pattern. I implemented a showColor() method to make
it a bit more obvious, though. You can tell it what color to change a screen to, and it will do it.
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
	HashMap<String, JPanel> panelMap = new HashMap<String, JPanel>();

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
		panelMap.put("Login Screen", loginScreen);

		JPanel registerScreen = new RegisterScreen();
		mainPanel.add(registerScreen, "Register Screen");
		panelMap.put("Register Screen", registerScreen);

		JPanel welcomeScreen = new WelcomeScreen();
		mainPanel.add(welcomeScreen, "Welcome Screen");
		welScreen = (WelcomeScreen) welcomeScreen;
		panelMap.put("Welcome Screen", welcomeScreen);

		JPanel manageRequestScreen = new ManageRequestScreen();
		mainPanel.add(manageRequestScreen, "Manage Request Screen");
		panelMap.put("Manage Request Screen", manageRequestScreen);

		JPanel submitRequestScreen = new SubmitRequestScreen( );
		mainPanel.add(submitRequestScreen, "Submit Request Screen");
		panelMap.put("Submit Request Screen", submitRequestScreen);

		JPanel fulfillRequest = new FulfillRequest();
		mainPanel.add(fulfillRequest, "Fulfill Request");
		fulfillScreen = (FulfillRequest) fulfillRequest;
		panelMap.put("Fulfill Request", fulfillScreen);

		JPanel manageDependentsScreen = new ManageDependentsScreen();
		mainPanel.add(manageDependentsScreen, "Manage Dependents Screen");
		panelMap.put("Manage Dependents Screen", manageDependentsScreen);

		JPanel fulfillRequestInput = new FulfillRequestInput();
		mainPanel.add(fulfillRequestInput, "Fulfill Request Input");
		fulfillInputScreen = (FulfillRequestInput) fulfillRequestInput;
		panelMap.put("Fulfill Request Input", fulfillInputScreen);

		JPanel createFlightScreen = new CreateFlightsPage();
		mainPanel.add(createFlightScreen, "Create Flight Screen");
		createFlightsPage = (CreateFlightsPage) createFlightScreen;
		panelMap.put("Create Flight Screen", createFlightScreen);

		JPanel deleteFlightScreen = new DeleteFlight();
		mainPanel.add(deleteFlightScreen, "Delete Flight Screen");
		panelMap.put("Delete Flight Screen", deleteFlightScreen);

		JPanel updateFlightSelect = new UpdateFlightSelect();
		mainPanel.add(updateFlightSelect, "Update Flight Select");
		panelMap.put("Update Flight Select", updateFlightSelect);

		JPanel updateFlightInput = new UpdateFlightInput();
		mainPanel.add(updateFlightInput, "Update Flight Input");
		updateFlightInputPage = (UpdateFlightInput) updateFlightInput;
		panelMap.put("Update Flight Input", updateFlightInput);

		JPanel createDestinationScreen = new CreateDestinationPage();
		mainPanel.add(createDestinationScreen, "Create Destination Screen");
		createDestinationPage = (CreateDestinationPage) createDestinationScreen;
		panelMap.put("Create Destination Screen", createDestinationScreen);

		JPanel deleteDestinationScreen = new DeleteDestinationPage();
		mainPanel.add(deleteDestinationScreen, "Delete Destination Screen");
		panelMap.put("Delete Destination Screen", deleteDestinationScreen);

		JPanel viewFlightScreen = new ViewFlightPage();
		mainPanel.add(viewFlightScreen, "View Flight Screen");
		panelMap.put("View Flight Screen", viewFlightScreen);

		JPanel parsingScreen = new ParsingScreen();
		mainPanel.add(parsingScreen, "Parsing Screen");
		panelMap.put("Parsing Screen", parsingScreen);

		JPanel planScreen = new PlanPage();
		mainPanel.add(planScreen, "Plan Screen");
		panelMap.put("Plan Screen", planScreen);

		JPanel addPlanScreen = new AddPlanPage();
		mainPanel.add(addPlanScreen, "Add Plan Screen");
		panelMap.put("Add Plan Screen", addPlanScreen);

		JPanel addFlightToPlanScreen = new AddFlightToPlanPage();
		mainPanel.add(addFlightToPlanScreen, "Add Flight To Plan Screen");
		addFlightToPlanPage = (AddFlightToPlanPage) addFlightToPlanScreen;
		panelMap.put("Add Flight To Plan Screen", addFlightToPlanScreen);
	}

	public void switchScreen(String screen) {
		mainPanel.removeAll();
		addScreens();
		cl.show(mainPanel, screen);
	}

	public void showColor(String panel, Color c) {
		mainPanel.removeAll();
		addScreens();
		panelMap.get(panel).setBackground(c);
		cl.show(mainPanel, panel);
    }
}
