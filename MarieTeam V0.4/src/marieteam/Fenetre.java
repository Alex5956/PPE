package marieteam;

import javax.swing.*;
import javax.swing.JComboBox;
import java.awt.event.*;
import java.awt.*;
import java.util.ArrayList;
 
public class Fenetre extends JFrame implements ActionListener{
    ArrayList afficherTout = new ArrayList();
    private JPanel container = new JPanel();
    private JComboBox combo = new JComboBox();
    private JLabel label = new JLabel("PDF a faire");
    private JButton bouton = new JButton("Créer");
    public int arrayListSize;
    
    public Fenetre() {
        super("titre de l'application");
        WindowListener l = new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e){
                System.exit(0);
            }
        };
        
        this.setSize(300,73);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLocationRelativeTo(null);
        container.setBackground(Color.white);
        container.setLayout(new BorderLayout());
        combo.setPreferredSize(new Dimension(100, 20));
        JPanel top = new JPanel();
        top.add(label);
        top.add(combo);
        
        bouton.addActionListener(this);
        top.add(bouton);
        
        container.add(top, BorderLayout.NORTH);
        this.setContentPane(container);
        addWindowListener(l);
    
    
    }
    
    public void RemplirCombo(){
        for(int i=0; i<arrayListSize; i++){
        System.out.print(i);
        System.out.print(":"+afficherTout.get(i)+" ! ");
        combo.addItem(afficherTout.get(i));
    }
        combo.addItem("Tout creer");
    }
      public void actionPerformed(ActionEvent arg0) {      
            System.out.print("a");
            Parametre Test = new Parametre();
            Test.ToutCollecter();
            System.out.println(combo.getSelectedItem());
            if ((String)combo.getSelectedItem() != "Tout creer"){
            Test.AfficherCatego((String)combo.getSelectedItem());
            } else {Test.AfficherCatego();}
    } 
}