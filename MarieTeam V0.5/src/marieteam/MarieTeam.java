/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marieteam;

import com.itextpdf.text.DocumentException;
import java.io.FileNotFoundException;

/**
 *
 * @author sio
 */
public class MarieTeam {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException, DocumentException, com.itextpdf.text.DocumentException {
        Fenetre fen = new Fenetre();
        Parametre Test = new Parametre();
        Test.ToutCollecter();
        fen.afficherTout = Test.afficherTout;
        fen.arrayListSize = fen.afficherTout.size();
        fen.RemplirCombo();
        fen.setVisible(true);      
    }
    
}
