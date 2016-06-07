
package marieteam;

//import com.mysql.jdbc.*;
import com.itextpdf.text.DocumentException;
import java.io.IOException;
import java.sql.* ;
import java.sql.SQLException;

public class Parametre {
    private String nomUtil;
    private String mdp;
    private String servBD;
    private String driverSGBD;
    private String contenu;
    Connection connexion = null;
    public Parametre() {
        this.nomUtil = "root";
        this.mdp = "";
        this.servBD = "jdbc:mysql://localhost/marieteam";
        this.driverSGBD =  "org.gjt.mm.mysql.Driver" ;
    }

    public void connexionect() throws ClassNotFoundException, SQLException{
       
        
            Class.forName("org.gjt.mm.mysql.Driver");
             connexion = DriverManager.getConnection(servBD, nomUtil, mdp);
             System.out.println("Réussit");
           
       
    }
    
     public ResultSet AfficherCatego(){
        try{
            connexionect();
            Statement Stt = connexion.createStatement();
            ResultSet je = Stt.executeQuery("SELECT * FROM bateau WHERE 1");
            while(je.next()){
                contenu = "id : " + je.getString(1) + " \n nom : " + je.getString(2) + " \n long : " + je.getString(3) + " \n larg : " + je.getString(4);
                System.out.println("id : " + je.getString(1) + " nom : " + je.getString(2) + " long : " + je.getString(3) + " larg : " + je.getString(4));
            }
            Stt.close();
            System.out.println("Requete executée");
            
            try {
            CreationPDF  unPDF = new CreationPDF(contenu) ;
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            } catch (DocumentException ex) {
                System.out.println(ex.getMessage());
            }
            
            return je;
        
        }catch(SQLException e){
            System.out.println(e.getMessage());
            
        }catch(ClassNotFoundException ex) {
            System.out.println("Classe non trouvée");
        }
        finally{
            try{
                if(connexion != null){
                    connexion.close();
                }
            }catch(SQLException e){
                System.out.println("Fermeture impossible");
                
            }
        }
        return null;
    }
    
    public String getNomUtil() {
        return nomUtil;
    }

    public void setNomUtil(String nomUtil) {
        this.nomUtil = nomUtil;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getServBD() {
        return servBD;
    }

    public void setServBD(String servBD) {
        this.servBD = servBD;
    }

    public String getDriverSGBD() {
        return driverSGBD;
    }

    public void setDriverSGBD(String driverSGBD) {
        this.driverSGBD = driverSGBD;
    }
    
    
}
