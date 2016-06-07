/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package marieteam;

import com.itextpdf.text.* ;
import static com.itextpdf.text.Font.FontFamily.COURIER;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;


public class CreationPDF {

    /**
     * @param args the command line arguments
     */
    public static int i=0;
 public CreationPDF(String Contenu)throws FileNotFoundException, IOException, DocumentException{
    String out = "contents"+i+".pdf";
    // etape 1
    Document document = new Document(PageSize.A4);
    try {
        // etape 2: creation du writer -> PDF ou HTML 
        PdfWriter.getInstance(document, new FileOutputStream(out));
        // etape 3: Ouverture du document
        document.open();
        // etape 4: Ajout du contenu au document
        Paragraph Titre = new Paragraph(" ");
        Titre.setAlignment(Element.ALIGN_CENTER);
        Font police= new Font(COURIER ,2,Font.ITALIC );
        Titre.setFont(police);
        document.add(Titre);
    } catch(DocumentException de) {
            System.err.println(de.getMessage());
    }
    try {
        Image front = Image.getInstance("logo.jpg");
        front.scaleToFit(85, 85);
        front.setAbsolutePosition(10,680);
        document.add(front);
        }
        catch(Exception e){
            System.out.println("impossible d'insérer l image "+e.getMessage());
        }
        
        try
        {
       Image titre = Image.getInstance("header.png");
        titre.scaleToFit(590, 280);
        titre.setAbsolutePosition(81,682);
        document.add(titre);
        }
        catch(Exception e){
            System.out.println("impossible d'insérer l image "+e.getMessage());
        }
        try
        {
        Paragraph contenuPage = new Paragraph(Contenu);
        contenuPage.setSpacingBefore(200);
        contenuPage.setAlignment(Element.ALIGN_CENTER);
        Font police= new Font(COURIER ,2,Font.ITALIC );
        contenuPage.setFont(police);
        document.add(contenuPage);
        }
        catch(Exception e){
            System.out.println("impossible d'insérer le contenu "+e.getMessage());
        }
        // etape 5: Fermeture du document
        document.close();
        System.out.println("Document '"+out+"' generated");
        i=i+1 ;
        System.out.println("i vaut "+i);
	}
}