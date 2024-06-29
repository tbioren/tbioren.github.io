import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

/**
 * Displays the first menu screen. Provides the user with buttons to submit or
 * fulfill a load request
 */
public class WelcomeScreen extends JPanel {
	JButton addRequestButton;
	JButton fulfillRequestButton;
	JButton createFlightButton;
	JButton viewFlightButton;
	JButton deleteFlightButton;
	JButton updateFlightButton;
	JButton logoutButton;
	JButton dependentsButton;
	JButton deleteDestinationButton;
	JButton planButton;
	JLabel wel_label;
	JLabel tokenTracker;
	JPanel newPanel;

	WelcomeScreen() {

		// add buttons to create & fulfill load requests
		this.addRequestButton = new JButton("Manage load request (-1 token)");
		this.fulfillRequestButton = new JButton("Fulfill load request (+1 token)");
		this.createFlightButton = new JButton("Add a flight to the database");
		deleteFlightButton = new JButton("Delete Flight");
		updateFlightButton = new JButton("Update Flight Info");
		viewFlightButton = new JButton("View Flight Info");
		planButton = new JButton("Manage Plans");
		deleteDestinationButton = new JButton("Delete destination from database");
		this.logoutButton = new JButton("Logout");
		dependentsButton = new JButton("Manage Dependents");

		this.tokenTracker = new JLabel("Temp");
		newPanel = new JPanel(new GridLayout(6, 1));
		updateUsername();
		if (!ScreenController.getInstance().getUser().isDependent) {
			newPanel.add(this.addRequestButton);
			newPanel.add(this.fulfillRequestButton);
		}
		newPanel.add(this.createFlightButton);
		newPanel.add(deleteFlightButton);
		newPanel.add(updateFlightButton);
		newPanel.add(deleteDestinationButton);
		newPanel.add(viewFlightButton);
		newPanel.add(planButton);
		if (!ScreenController.getInstance().getUser().isDependent)
			newPanel.add(dependentsButton);
		newPanel.add(this.logoutButton);
		this.add(newPanel, BorderLayout.CENTER);
		startListening();
	}

	public void updateUsername() {
		this.wel_label = new JLabel("Welcome: " + ScreenController.getInstance().getUser().username);
		newPanel.add(this.wel_label);
		Tokens tokenGen = new Tokens();
		this.tokenTracker = tokenGen.makeLabel();
		newPanel.add(this.tokenTracker);
	}

	void startListening() {
		addRequestButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Submit Request Screen");
			}
		});

		fulfillRequestButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Fulfill Request");
			}
		});

		createFlightButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Create Flight Screen");
			}
		});

		deleteFlightButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Delete Flight Screen");
			}
		});

		updateFlightButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Update Flight Select");
			}
		});

		deleteDestinationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Delete Destination Screen");
			}
		});

		logoutButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Login Screen");
			}
		});

		viewFlightButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("View Flight Screen");
			}
		});

		planButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Plan Screen");
			}
		});

		dependentsButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Manage Dependents Screen");
			}
		});
	}
}
