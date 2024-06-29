import javax.swing.*;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
Facade:
This is a facade for the ManageDependentsScreen class.
 */

public class ManageDependentsHelper {
    public void unRemove(int userID, String dep) {
        try {
            final String sproc = "EXEC UnRemoveDependent @UserID = ?, @Dep = ?";
            CallableStatement smt = DbConnectionService.getConnection().prepareCall(sproc);
            smt.setInt(1, userID);
            smt.setString(2, dep);
            smt.execute();
        }
        catch(SQLException sqle) {
            JOptionPane.showMessageDialog(null, "Un-Deletion Unsuccessful");
        }
    }

    public ArrayList<String> getDependents(int employeeID) {
        try {
            final String sproc = "EXEC GetDependents @EmployeeID = ?";
            CallableStatement smt = DbConnectionService.getConnection().prepareCall(sproc);
            smt.setInt(1, employeeID);
            ResultSet rs = smt.executeQuery();
            ArrayList<String> output = new ArrayList<String>();
            while (rs.next()) {
                String name = rs.getString(1);
                output.add(name);
            }
            return output;
        } catch(Exception e) {}
        return new ArrayList<String>();
    }

    public void deleteDependent(String dependent) {
        try {
            final String sproc = "EXEC RemoveDependent @Username = ?";
            CallableStatement smt = DbConnectionService.getConnection().prepareCall(sproc);
            smt.setString(1, dependent);
            smt.executeQuery();
        } catch(Exception e) {}
    }
}