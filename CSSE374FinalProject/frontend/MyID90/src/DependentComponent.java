import javax.swing.*;
import java.util.Observable;

public class DependentComponent extends JPanel implements ObserverObject {
    private JLabel employeeUsernameLabel;
    public JTextField employeeUsernameField;
    private JLabel addCode;
    public JTextField addField;
    public DependentComponent() {
        // Create field and label for employee username
        employeeUsernameLabel = new JLabel();
        employeeUsernameLabel.setText("Employee Username");
        employeeUsernameField = new JTextField(15);
        // Create field and label for add code
        addCode = new JLabel();
        addCode.setText("Add Code");
        addField = new JTextField(15);
        this.add(employeeUsernameLabel);
        this.add(employeeUsernameField);
        this.add(addCode);
        this.add(addField);
    }

    public void update(Object o) {
        if(o != null) this.setVisible(true);
        else this.setVisible(false);
    }
}