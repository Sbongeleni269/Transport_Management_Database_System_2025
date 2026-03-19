package transportsystemgui;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;
import java.util.ArrayList;

public class TransportSystemGUI extends JFrame {

    Connection conn;
    JTable table;
    JComboBox<String> tableSelector;

    JPanel formPanel;
    ArrayList<JTextField> fields = new ArrayList<>();

    public TransportSystemGUI() {

        setTitle("Transport Management System");
        setSize(1000,600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        connectDB();

        // Sidebar
        JPanel sidebar = new JPanel(new GridLayout(3,1));
        JButton viewBtn = new JButton("View Tables");
        JButton insertBtn = new JButton("Insert Data");
        JButton deleteBtn = new JButton("Delete Data");

        sidebar.add(viewBtn);
        sidebar.add(insertBtn);
        sidebar.add(deleteBtn);

        add(sidebar, BorderLayout.WEST);

        // Main Panel
        JPanel mainPanel = new JPanel(new BorderLayout());

        tableSelector = new JComboBox<>();
        loadTables();

        JButton loadBtn = new JButton("Load");

        JPanel top = new JPanel();
        top.add(tableSelector);
        top.add(loadBtn);

        mainPanel.add(top, BorderLayout.NORTH);

        table = new JTable();
        mainPanel.add(new JScrollPane(table), BorderLayout.CENTER);

        add(mainPanel, BorderLayout.CENTER);

        // Dynamic Form Panel
        formPanel = new JPanel(new FlowLayout());
        add(formPanel, BorderLayout.SOUTH);
        
     // Actions
        loadBtn.addActionListener(e -> {
            loadTableData();
            loadFormFields();
        });

        viewBtn.addActionListener(e -> {
            loadTableData();
            loadFormFields();
        });

        insertBtn.addActionListener(e -> insertData());

        deleteBtn.addActionListener(e -> deleteData());

        setVisible(true);
    }

    private void connectDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/transportsystem",
                    "root",
                    "Sbo2003"
            );

            System.out.println("Connected!");

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    private void loadTables() {
        try {
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet rs = meta.getTables(null, null, "%", new String[] {"TABLE"});

            while(rs.next()) {
                tableSelector.addItem(rs.getString("TABLE_NAME"));
            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    private void loadTableData() {
        try {
            String tableName = tableSelector.getSelectedItem().toString();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + tableName);

            ResultSetMetaData meta = rs.getMetaData();
            int cols = meta.getColumnCount();

            DefaultTableModel model = new DefaultTableModel();

            for(int i=1;i<=cols;i++)
                model.addColumn(meta.getColumnName(i));

            while(rs.next()) {
                Object[] row = new Object[cols];
                for(int i=1;i<=cols;i++)
                    row[i-1] = rs.getObject(i);

                model.addRow(row);
            }

            table.setModel(model);

        } catch(Exception e){
            //e.printStackTrace();
            JOptionPane.showMessageDialog(this,"Table does not exist in TransportDatabase!!!");

            
        }
    }

    // 🔥 Dynamic fields based on selected table
    private void loadFormFields() {
        try {

            formPanel.removeAll();
            fields.clear();

            String tableName = tableSelector.getSelectedItem().toString();

            ResultSet rs = conn.getMetaData().getColumns(null, null, tableName, null);

            while(rs.next()) {

                if("YES".equals(rs.getString("IS_AUTOINCREMENT"))) continue;

                String colName = rs.getString("COLUMN_NAME");

                JLabel label = new JLabel(colName);
                JTextField field = new JTextField(10);

                fields.add(field);

                formPanel.add(label);
                formPanel.add(field);
            }

            JButton addBtn = new JButton("Add");
            JButton deleteByIdBtn = new JButton("Delete by ID");

            formPanel.add(addBtn);
            formPanel.add(deleteByIdBtn);

            addBtn.addActionListener(e -> insertData()); //Listener for addButton
            
            deleteByIdBtn.addActionListener(e -> {
                String tableNam = tableSelector.getSelectedItem().toString();

                try {
                    // Get primary key of the selected table
                    DatabaseMetaData meta = conn.getMetaData();
                    ResultSet pk = meta.getPrimaryKeys(null, null, tableNam);

                    if (!pk.next()) {
                        JOptionPane.showMessageDialog(this, "No primary key found for this table!");
                        return;
                    }

                    String pkColumn = pk.getString("COLUMN_NAME");

                    // Ask user for the PK value
                    String idValue = JOptionPane.showInputDialog(this, "Enter " + pkColumn + " to delete:");

                    if (idValue == null || idValue.isEmpty()) return;

                    String sql = "DELETE FROM " + tableNam + " WHERE " + pkColumn + " = ?";

                    PreparedStatement pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, idValue);

                    int rows = pstmt.executeUpdate();

                    if (rows > 0) {
                        JOptionPane.showMessageDialog(this, "Deleted successfully!");
                    } else {
                        JOptionPane.showMessageDialog(this, "No matching record found!");
                    }

                    loadTableData(); // Refresh table view

                } catch (Exception ex) {
                   // ex.printStackTrace();
                    JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
                }
            });            
            //delBtn.addActionListener(e -> deleteData());

            formPanel.revalidate();
            formPanel.repaint();

        } catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(this,"Table does not exist in TransportDatabase!!!");

        }
    }

    private void insertData() {

        String tableName = tableSelector.getSelectedItem().toString();

        try {

            ResultSet rs = conn.getMetaData().getColumns(null, null, tableName, null);

            StringBuilder columns = new StringBuilder();
            StringBuilder values = new StringBuilder();

            int i = 0;

            while(rs.next()) {

                if("YES".equals(rs.getString("IS_AUTOINCREMENT"))) continue;

                String col = rs.getString("COLUMN_NAME");

                columns.append(col).append(",");
                values.append("'").append(fields.get(i).getText()).append("',");

                i++;
            }

            columns.setLength(columns.length()-1);
            values.setLength(values.length()-1);

            String sql = "INSERT INTO " + tableName + " (" + columns + ") VALUES (" + values + ")";

            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);

            JOptionPane.showMessageDialog(this,"Inserted!");
            loadTableData();

        } catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(this,"Insert Failed: " + e.getMessage());
        }
    }

    private void deleteData() {

        String tableName = tableSelector.getSelectedItem().toString();

        try {

            int selectedRow = table.getSelectedRow();

            if(selectedRow == -1){
                JOptionPane.showMessageDialog(this,"Select a row first!");
                return;
            }

            // Get primary key column
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet pk = meta.getPrimaryKeys(null, null, tableName);

            String pkColumn = null;

            if(pk.next()) {
                pkColumn = pk.getString("COLUMN_NAME");
            } else {
                JOptionPane.showMessageDialog(this,"No Primary Key found!");
                return;
            }

            // Get value from selected row (assumes PK is first column)
            Object id = table.getValueAt(selectedRow, 0);

            String sql = "DELETE FROM " + tableName + " WHERE " + pkColumn + " = ?";

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setObject(1, id);

            int rows = pstmt.executeUpdate();

            if(rows > 0){
                JOptionPane.showMessageDialog(this,"Deleted!");
            } else {
                JOptionPane.showMessageDialog(this,"Delete failed!");
            }

            loadTableData();

        } catch(Exception e){
            e.printStackTrace();
            JOptionPane.showMessageDialog(this,"Error: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        new TransportSystemGUI();
    }
}