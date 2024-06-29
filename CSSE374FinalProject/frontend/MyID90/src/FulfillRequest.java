import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.swing.*;

public class FulfillRequest extends JPanel {
	JLabel tokenTracker;
	JLabel title;
	JPanel newPanel;
	JButton backButton, submitButton;
	HashMap<String, LoadRequest> requestMap;
	JComboBox<String> requestBox;

	FulfillRequest() {
		this.title = new JLabel("Fulfill a Load Request");
		this.backButton = new JButton("Go back");
		this.submitButton = new JButton("Select");
		requestMap = new HashMap<String, LoadRequest>();

		newPanel = new JPanel(new GridLayout(5, 1));
		makeTokenTracker();
		newPanel.add(this.title);
		this.add(newPanel, BorderLayout.CENTER);
		populate();
		startListening();
	}

	/**
	 * Displays how many tokens the user has
	 */
	public void makeTokenTracker() {
		Tokens tokenGen = new Tokens();
		this.tokenTracker = tokenGen.makeLabel();
		newPanel.add(this.tokenTracker);
	}

	public void populate() {
		LoadRequestService l = new LoadRequestService();
		ArrayList<LoadRequest> requests = l.listFulfillableRequests(ScreenController.getInstance().getUser().username);

		String[] s = new String[requests.size()];

		for (int i = 0; i < requests.size(); i++) {
			LoadRequest r = requests.get(i);
			s[i] = r.toString();
			requestMap.put(r.toString(), r);
		}

		requestBox = new JComboBox<String>(s);
		newPanel.add(requestBox);

		newPanel.add(backButton);
		newPanel.add(submitButton);
	}

	private void startListening() {
		backButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Welcome Screen");
			}
		});
		submitButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Fulfill Request Input");
				LoadRequest r = requestMap.get((String) requestBox.getSelectedItem());
				ScreenController.getInstance().fulfillInputScreen.setFlightID(r.getID());
				ScreenController.getInstance().fulfillInputScreen.populate(r.getFlightNumber());
				ScreenController.getInstance().fulfillInputScreen.startListening();
			}
		});

	}
}
