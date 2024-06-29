import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

public class PlanPage extends JPanel {

	private JTable flightsTable;
	private JLabel tokenLabel;
	private JButton getFlightsButton, resetButton, backButton, addPlanButton, addFlightToPlanButton,
			changeOrderButton;
	private JComboBox<String> planBox;
	private JTextField orderField;

	PlanPage() {
		JPanel topPanel = generateSubmitPanel();
		this.setLayout(new BorderLayout());
		this.add(topPanel, BorderLayout.NORTH);

		JScrollPane tablePane = generateFlightsTable();
		this.add(tablePane, BorderLayout.CENTER);
		flightsTable.setModel(search());

		startListening();
	}

	/**
	 * Generates the top bar of the page
	 */
	private JPanel generateSubmitPanel() {
		JPanel submitPanel = new JPanel();
		FlowLayout fLayout = new FlowLayout();
		fLayout.setHgap(10);
		submitPanel.setLayout(fLayout);

		Tokens tokenGen = new Tokens();
		tokenLabel = tokenGen.makeLabel();
		submitPanel.add(this.tokenLabel);

		getFlightsButton = new JButton("Show Plan");
		submitPanel.add(getFlightsButton);

		planBox = makePlanBox();
		submitPanel.add(planBox);

		addPlanButton = new JButton("Add Plan");
		submitPanel.add(addPlanButton);

		addFlightToPlanButton = new JButton("Add Flight To Plan");
		submitPanel.add(addFlightToPlanButton);

		orderField = new JTextField();
		submitPanel.add(orderField);

		changeOrderButton = new JButton("Update Flight Order");
		submitPanel.add(changeOrderButton);

		resetButton = new JButton("Reset");
		submitPanel.add(resetButton);

		backButton = new JButton("Back");
		submitPanel.add(backButton);

		return submitPanel;
	}

	/**
	 * Creates the visible version of the flight table
	 */
	private JScrollPane generateFlightsTable() {
		this.flightsTable = new JTable(new WholeFlightTableModel(new ArrayList<WholeFlight>()));

		JScrollPane scrollPane = new JScrollPane(this.flightsTable);
		this.flightsTable.setFillsViewportHeight(true);
		this.flightsTable.getTableHeader().setReorderingAllowed(false);

		return scrollPane;
	}

	private JComboBox<String> makePlanBox() {
		PlanService serv = new PlanService();
		List<String> l = serv.listPlans(ScreenController.getInstance().getUser().id);
		String[] plans = new String[l.size()];
		for (int i = 0; i < l.size(); i++) {
			plans[i] = l.get(i);
		}
		return new JComboBox<String>(plans);
	}

	/**
	 * Returns a new table based on the user's input
	 */
	private WholeFlightTableModel search() {
		PlanService serv = new PlanService();
		List<WholeFlight> data = serv.listPlanContents((String) planBox.getSelectedItem(), ScreenController.getInstance().getUser().id);
		return new WholeFlightTableModel(data);
	}

	/**
	 * Resets any input fields the user may have filled
	 */
	private void clearFields() {
		planBox.setSelectedIndex(0);
	}

	/**
	 * Adds action listeners to all buttons
	 */
	private void startListening() {

		backButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Welcome Screen");
			}
		});

		getFlightsButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				flightsTable.setModel(search());
			}
		});

		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				flightsTable.setModel(new WholeFlightTableModel(new ArrayList<WholeFlight>()));
				clearFields();
			}
		});

		addPlanButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Add Plan Screen");
			}
		});

		addFlightToPlanButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				ScreenController.getInstance().switchScreen("Add Flight To Plan Screen");
				ScreenController.getInstance().addFlightToPlanPage.setPlanName((String) planBox.getSelectedItem());
			}
		});

		changeOrderButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (flightsTable.getSelectedRowCount() != 1
						|| flightsTable.getSelectedRowCount() == -1) {
					JOptionPane.showMessageDialog(null, "Cannot change order of flights");

				} else {
					PlanService serv = new PlanService();
					String planName = (String) planBox.getSelectedItem();
					WholeFlight f = serv.listPlanContents(planName,
							ScreenController.getInstance().getUser().id).get(flightsTable.getSelectedRow());
					serv.createPlan(planName, Integer.parseInt(f.getID()), ScreenController.getInstance().getUser().id,
							Integer.parseInt(orderField.getText()));
				}
			}
		});

	}
}
