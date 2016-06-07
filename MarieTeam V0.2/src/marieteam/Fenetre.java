package marieteam;

import javax.swing.*;
import java.awt.event.*;
 
public class Fenetre extends JFrame {
    public Fenetre() {
        super("titre de l'application");

        WindowListener l = new WindowAdapter() {
        @Override
        public void windowClosing(WindowEvent e){
        System.exit(0);
        }
        };

        addWindowListener(l);
        setSize(800,600);
        setVisible(true);
    }

}