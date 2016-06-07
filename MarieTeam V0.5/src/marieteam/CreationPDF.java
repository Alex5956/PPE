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
    // etape 1: Titrage du pdf
    String out = "PDF"+i+".pdf";
    Document document = new Document(PageSize.A4);
    public static int i=0;
    
    public CreationPDF()throws FileNotFoundException, IOException, DocumentException{
        try {
            // etape 2: creation du writer -> PDF ou HTML 
            PdfWriter.getInstance(document, new FileOutputStream(out));
            // etape 3: Ouverture du document
            document.open();
        } catch(DocumentException de) {
            System.err.println(de.getMessage());
        }
    }
    
    public void AjoutEntete(){
    try {
            // etape 4: Ajout du contenu au document
            Paragraph Titre = new Paragraph(" ");
            Titre.setSpacingAfter(110);
            Titre.setAlignment(Element.ALIGN_LEFT);
            Font police= new Font(COURIER ,8,Font.ITALIC );
            Titre.setFont(police);
            document.add(Titre);
        } catch(DocumentException de) {
            System.err.println(de.getMessage());
        }
        
    try {
        Image front = Image.getInstance("logo.jpg");
        front.scaleToFit(85, 85);
        front.setAbsolutePosition(10,700);
        document.add(front);
        }
        catch(Exception e){
            System.out.println("impossible d'insérer l'image "+e.getMessage());
        }
        
    try
        {
        Image titre = Image.getInstance("header.png");
        titre.scaleToFit(590, 280);
        titre.setAbsolutePosition(81,702);
        document.add(titre);
        }
        catch(Exception e){
            System.out.println("impossible d'insérer l image "+e.getMessage());
        }
    }
    public void AjoutParagraph(String Contenu, String LienImage){
        try{
            Image img = Image.getInstance(LienImage);
            img.setAlignment(Element.ALIGN_CENTER);
            img.scaleToFit(300, 300);
            document.add(img);
            }
        catch(Exception e){
            System.out.println("impossible d'insérer l image "+e.getMessage());
        }
        
        try
            {
            Paragraph contenuPage = new Paragraph(Contenu);
            contenuPage.setAlignment(Element.ALIGN_CENTER);
            Font police= new Font(COURIER ,8,Font.ITALIC );
            contenuPage.setFont(police);
            document.add(contenuPage);
        }
        catch(Exception e){
            System.out.println("impossible d'insérer le contenu "+e.getMessage());
        }
    }
    public void Arret(){
        // etape 5: Fermeture du document
        try{
            document.close();
            System.out.println("Document '"+out+"' generated");
            i=i+1 ;
            System.out.println("Le numéro du pdf est "+i);
        }
        catch(Exception e){
            System.out.println("impossible d'insérer le contenu "+e.getMessage());
        }
	}
}