import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class CreateDestinationPage extends JPanel {
	JPanel newPanel;

	JLabel tokenTracker;
	JLabel title;
	JTextField iataCodeField;
	JTextField nameField;
	JButton submitButton;
	JButton backButton;

	String origin;

	CreateDestinationPage() {
		title = new JLabel("Create or update a destination");
		iataCodeField = new JTextField();
		nameField = new JTextField();
		submitButton = new JButton("Submit");
		backButton = new JButton("Go Back");

		newPanel = new JPanel(new GridLayout(5, 2));
		this.add(newPanel, BorderLayout.CENTER);
		newPanel.add(title);
		makeTokenTracker();
		newPanel.add(new JLabel("IATACode"));
		newPanel.add(iataCodeField);
		newPanel.add(new JLabel("City Name"));
		newPanel.add(nameField);
		newPanel.add(backButton);
		newPanel.add(submitButton);

		startListening();
	}

	/**
	 * Displays how many tokens the user has
	 */
	private void makeTokenTracker() {
		Tokens tokenGen = new Tokens();
		this.tokenTracker = tokenGen.makeLabel();
		newPanel.add(this.tokenTracker);
	}

	private void startListening() {
		backButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen(origin);
			}
		});
		submitButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				DestinationService serv = new DestinationService();
				if (serv.createDestination(iataCodeField.getText(), nameField.getText())) {
					JOptionPane.showMessageDialog(null, "Destination added successfully");
					ScreenController.getInstance().switchScreen(origin);
				} else {
					JOptionPane.showMessageDialog(null, "Failed to add destination");
				}
			}
		});
	}

	/**
	 * Sets the page to return to after hitting the back button or successfully
	 * submitting
	 */
	public void setOrigin(String origin) {
		this.origin = origin;
	}
}
