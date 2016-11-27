package fenetre;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
 
public class Fenetre extends JFrame{
 
  //private Panneau pan = new Panneau();
  private JButton bouton = new JButton("Facturation d'une location");
  private JButton bouton2 = new JButton("Temps moyen d'utilisation par véhicule par mois");
  private JButton bouton3 = new JButton("Temps moyen d'utilisation par catégorie de véhicule par mois");
  private JButton bouton4 = new JButton("Catégorie de véhicule la plus utilisée par tranche d'âge de 10 ans");
  private JButton bouton5 = new JButton("Taux d'occupation des stations sur la journée");
  private JPanel container = new JPanel();
  private JLabel label = new JLabel("VEHLIB pour tous");
  
  JOptionPane jop0 = new JOptionPane();
  static final String CONN_URL = "jdbc:oracle:thin:@ensioracle1.imag.fr:1521:ensioracle1";
  static final String USER = "picardto";
  static final String PASSWD = "picardto";
  private static Connection conn;
  
  public Fenetre() throws ClassNotFoundException{
    this.setTitle("VEHLIB pour tous");
    this.setSize(600, 300);
    this.setResizable(false);
    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setLocationRelativeTo(null);
 
    container.setBackground(Color.white);
    container.setLayout(new BorderLayout());
        
    //Ce sont maintenant nos classes internes qui écoutent nos boutons 
    bouton.addActionListener(new BoutonListener());
    bouton2.addActionListener(new Bouton2Listener());
    bouton3.addActionListener(new Bouton3Listener());
    bouton4.addActionListener(new Bouton4Listener());
    bouton5.addActionListener(new Bouton5Listener());
        
    
    JPanel b1 = new JPanel();
    b1.setLayout(new BoxLayout(b1, BoxLayout.LINE_AXIS));
    b1.add(bouton);
    
    JPanel b2 = new JPanel();
    b2.setLayout(new BoxLayout(b2, BoxLayout.LINE_AXIS));
    b2.add(bouton2);
    
    JPanel b3 = new JPanel();
    b3.setLayout(new BoxLayout(b3, BoxLayout.LINE_AXIS));
    b3.add(bouton3);
    
    JPanel b4 = new JPanel();
    b4.setLayout(new BoxLayout(b4, BoxLayout.LINE_AXIS));
    b4.add(bouton4);
    
    JPanel b5 = new JPanel();
    b5.setLayout(new BoxLayout(b5, BoxLayout.LINE_AXIS));
    b5.add(bouton5); 
   
    
    JPanel b6 = new JPanel();
    b6.setLayout(new BoxLayout(b6, BoxLayout.PAGE_AXIS));
    b6.add(b1);
    b6.add(b2);
    b6.add(b3);
    b6.add(b4);
    b6.add(b5);
    Font police = new Font("Tahoma", Font.BOLD, 16);
    label.setFont(police);
    label.setForeground(Color.blue);
    label.setHorizontalAlignment(JLabel.CENTER);
    
    container.add(b6, BorderLayout.SOUTH);
    container.add(label, BorderLayout.NORTH);
    
    this.setContentPane(container);
    this.setVisible(true);
  }
  
  private String toString(ResultSet rset) throws SQLException {
	  ResultSetMetaData rsetmd = rset.getMetaData();
      int i = rsetmd.getColumnCount();
      String output = "";
      while (rset.next()) {
    	  for (int j = 1; j <= i; j++) {
    		  output += rset.getObject(j).toString()+"\t";
    	  }
    	  output += "\n";
      }
      return output;
  }
  
  
  public void ouvrir() {
		try {
		    // Enregistrement du driver Oracle
		    //System.out.print("Chargement du driver Oracle ... "); 
		    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	        //System.out.println("driver charger");

		    // Etablissement de la connection
		    //System.out.print("Connexion à la base de donnée... "); 
		    conn = DriverManager.getConnection(CONN_URL, USER, PASSWD);
	        //System.out.println("connecté");
			conn.setAutoCommit(false);
	         //System.out.println("Auto Commit off !");
	        } catch (SQLException e) {
	            System.err.println("failed");
	            e.printStackTrace(System.err);
		}	
	}
	
	public void fermer() {
		 try {
	            conn.close();
	        } catch (SQLException e) {
	            System.err.println("failed");
	            e.printStackTrace(System.err);
	        }   
	}
  
      
  //Classe écoutant notre premier bouton
  class BoutonListener implements ActionListener{
    //Redéfinition de la méthode actionPerformed()
    public void actionPerformed(ActionEvent arg0) {
      label.setText("Facturation d'une location");
      JOptionPane jop = new JOptionPane();
      
      String idVehicule = jop.showInputDialog(null, "ID du Véhicule (ex 3)", "Facturation", JOptionPane.QUESTION_MESSAGE);
      
      String date = jop.showInputDialog(null, "Date de location (format 'jj/mm/aaaa' ex '19/11/2016')", "Facturation", JOptionPane.QUESTION_MESSAGE);
      
      String[] heures = {"0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"};
      String heure = (String)jop.showInputDialog(null,
    		  "Heure de location (ex 22)",
    		  "Facturation",
    		  JOptionPane.QUESTION_MESSAGE,
    		  null,
    		  heures,
    		  heures[22]);
      
      ouvrir();
      SimpleDateFormat sdfmt1 = new SimpleDateFormat("dd/MM/yy");
      java.util.Date dTmp;
      
      try {
    	  // On selectione le prixTypeVehicule
    	  String STMT_1 = "SELECT prixTypeVehicule "
    			  + "FROM  Location, Vehicule, TypeVehicule " 
    			  + "WHERE Vehicule.typeVehicule = TypeVehicule.typeVehicule "
    			  + "AND Location.idVehicule = ? "
    			  + "AND Location.dateLocation = ? "
    			  + "AND Location.heureLocation = ? "
    			  + "AND Location.idVehicule = Vehicule.idVehicule ";
    	  
    	  // On selectione la date de retour
    	  String STMT_2 = "SELECT Retour.DateR "
    			  + "FROM  Location, Retour "
    			  + "WHERE Location.idVehicule = Retour.idVehicule "
    			  + "AND Location.dateLocation = ? "
    			  + "AND Location.idVehicule = ? " 
    			  + "AND Location.heureLocation = ? "
    			  + "AND Location.dateLocation = Retour.dateLocation "                                  
    			  + "AND Location.heureLocation = Retour.heureLocation ";
    	  
    	  // on selection l'heure de retour
    	  String STMT_3 = "SELECT Retour.HeureR "
    			  + "FROM Location, Retour "
    			  + "WHERE Location.idVehicule = Retour.idVehicule "
    			  + "AND Location.dateLocation = ? "                   
    			  + "AND Location.idVehicule = ? "
    			  + "AND Location.heureLocation = ? "
    			  + "AND Location.dateLocation = Retour.DateLocation "
    			  + "AND Location.heureLocation = Retour.heureLocation ";

    	  // reduction
    	  String STMT_4 = "(SELECT Abonnees.reduction "
    			  + "FROM Location, Abonnees "
    			  + "WHERE Location.cbAbonne = Abonnees.cbAbonne "
    			  + "AND Location.dateLocation = ? "
    			  + "AND Location.idVehicule = ? "
    			  + "AND Location.heureLocation = ? )";
		
    	  // Creation de la requete
    	  PreparedStatement stmt1 = conn.prepareStatement(STMT_1);
    	  PreparedStatement stmt2 = conn.prepareStatement(STMT_2);
    	  PreparedStatement stmt3 = conn.prepareStatement(STMT_3);
    	  PreparedStatement stmt4 = conn.prepareStatement(STMT_4);
    	  
    	  // on fait les set
    	  try {
        	  dTmp = sdfmt1.parse(date);
        	  
        	  java.sql.Date dateL = new java.sql.Date(dTmp.getYear(),dTmp.getMonth(),dTmp.getDate());
        	  
        	  int heureL = Integer.parseInt(heure);
        	  stmt1.setString(1, idVehicule);
        	  stmt1.setDate(2, dateL);
        	  stmt1.setInt(3, heureL);
        	  
        	  stmt2.setDate(1, dateL);
        	  stmt2.setString(2, idVehicule);
        	  stmt2.setInt(3, heureL);
        	  
        	  stmt3.setDate(1, dateL);
        	  stmt3.setString(2, idVehicule);
        	  stmt3.setInt(3, heureL);
        	  
        	  stmt4.setDate(1, dateL);
        	  stmt4.setString(2, idVehicule);
        	  stmt4.setInt(3, heureL);
        	  
        	  // Execution de la requete
              ResultSet rset1 = stmt1.executeQuery();
              ResultSet rset2 = stmt2.executeQuery();
              ResultSet rset3 = stmt3.executeQuery();
              ResultSet rset4 = stmt4.executeQuery();
              
              rset1.next();
              int prixTVeh = rset1.getInt(1);
              
              rset2.next();
              java.sql.Date dateR = rset2.getDate(1);
              
              rset3.next();
              int heureR = rset3.getInt(1);
              
              rset4.next();
              int reduction = rset4.getInt(1);
              
              
              //(prixVehicule)*((dateR-dateLocation)*24+HeureR-HeureLocation)(1-0.25*Reduction)
              
              // on fait un -1 car la premiere heure est gratuite
              float res = (float) (prixTVeh*((dateR.compareTo(dateL))*24 + heureR - heureL -1)*(1 - 0.25*reduction));
              
              if (res < 0) {
            	  res = 0;
              }
              JOptionPane jop2 = new JOptionPane();
              
              String barre = "--------------------------------------\n";
              
              JTextArea textArea = new JTextArea("La facture est de : \n\n"+barre+res+" euro\n");
              textArea.setEditable(false);
              
              jop2.showMessageDialog(null, textArea, "Information", JOptionPane.INFORMATION_MESSAGE);
              
              // Fermeture 
              rset1.close();
              stmt1.close();
              
              rset2.close();
              stmt2.close();
              
              rset3.close();
              stmt3.close();
              
              rset4.close();
              stmt4.close();
              
    	  } catch (ParseException e1) {
        	  // TODO Auto-generated catch block
        	  e1.printStackTrace();
          }
    	 
    	  
      } catch (SQLException e) {
    	  System.err.println("failed");
    	  e.printStackTrace(System.err);
      }
      
      fermer(); 
    }
  }
      
  //Classe écoutant notre second bouton
  class Bouton2Listener implements ActionListener{
    //Redéfinition de la méthode actionPerformed()
    public void actionPerformed(ActionEvent arg0) {
      label.setText("Temps moyen d'utilisation par véhicule par mois");
      
      JOptionPane jop = new JOptionPane();
      //String idVehicule = jop.showInputDialog(null, "ID du Véhicule (ex 3)", "Information", JOptionPane.QUESTION_MESSAGE);
      String[] moisLs = {"1","2","3","4","5","6","7","8","9","10","11","12"};
      String moisL = (String)jop.showInputDialog(null,
    		  "Mois de location (ex 11)",
    		  "Information",
    		  JOptionPane.QUESTION_MESSAGE,
    		  null,
    		  moisLs,
    		  moisLs[10]);
      
      String[] anneLs = {"2010","2011","2012","2013","2014","2015","2016"};
      String anneL = (String)jop.showInputDialog(null,
    		  "Année de location (ex 2016)",
    		  "Information",
    		  JOptionPane.QUESTION_MESSAGE,
    		  null,
    		  anneLs,
    		  anneLs[6]);
      
      //pour le test idVeh=3 moisL=11 anneeL=2016
      ouvrir();
      try {
    	  String STMT_1 = "SELECT idVehicule, SUM( "
      				+ "case when extract(month from Retour.DateR) = ? "
      				+ "AND extract(year from Retour.DateR) = ? "
      				+ "AND extract(month from Retour.dateLocation) = ? "
      				+ "Then (dateR -dateLocation)*24+heureR-heureLocation "
      				+ "when extract(month from dateLocation) = ? "
      				+ "AND extract(year from dateLocation) = ? "
      				+ "then (dateR-dateLocation)*24 -extract(day from dateR)*24+24-heureLocation "
      				+ "when extract(month from dateR) = ? "
      				+ "AND extract(year from dateR) = ? "
      				+ "then extract(day from dateR)*24-24+heureR "
      				+ "end) "
      				+ "from Retour " 
      				//+ "where retour.idVehicule = ? "
      				+ "group by(idVehicule) ";
    	  
    	  // Creation de la requete
    	  PreparedStatement stmt1 = conn.prepareStatement(STMT_1);
    	  stmt1.setString(1, moisL);
    	  stmt1.setString(2, anneL);
    	  stmt1.setString(3, moisL);
    	  stmt1.setString(4, moisL);
    	  stmt1.setString(5, anneL);
    	  stmt1.setString(6, moisL);
    	  stmt1.setString(7, anneL);
    	  
    	  // Execution de la requete
          ResultSet rset1 = stmt1.executeQuery();
          
          JOptionPane jop2 = new JOptionPane();
          
          String entete = "Id Véhicule"+"\t"+"Nombre d'heure"+"\n";
          String barre = "------------------------------------------------\n";
          
          JTextArea textArea = new JTextArea("Temps moyen d'utilisation en heure \n\n"+entete+barre+Fenetre.this.toString(rset1));
          textArea.setEditable(false);
          
          jop2.showMessageDialog(null, textArea, "Information", JOptionPane.INFORMATION_MESSAGE);
          
    	  
      } catch (SQLException e) {
    	  System.err.println("failed");
    	  e.printStackTrace();
      }
      
      fermer();
    }
  } 
  
  //Classe écoutant notre second bouton
  class Bouton3Listener implements ActionListener{
    //Redéfinition de la méthode actionPerformed()
    public void actionPerformed(ActionEvent arg0) {
      label.setText("Temps moyen d'utilisation par catégorie de véhicule par mois");
      
      JOptionPane jop = new JOptionPane();
      
      String[] tVeh = {"velo","velo electrique","velo remorque","voiture essence","voiture electrique","utilitaire"};
      String tVehicule = (String)jop.showInputDialog(null,
    		  "Type du Véhicule (ex : velo electrique)",
    		  "Information",
    		  JOptionPane.QUESTION_MESSAGE,
    		  null,
    		  tVeh,
    		  tVeh[1]);
      
      String[] mois = {"1","2","3","4","5","6","7","8","9","10","11","12"};
      String moisL = (String)jop.showInputDialog(null,
    		  "Mois de location (ex 11)",
    		  "Information",
    		  JOptionPane.QUESTION_MESSAGE,
    		  null,
    		  mois,
    		  mois[10]);
      
      String[] anne = {"2010","2011","2012","2013","2014","2015","2016"};
      String anneL = (String)jop.showInputDialog(null,
    		  "Année de location (ex 2016)",
    		  "Information",
    		  JOptionPane.QUESTION_MESSAGE,
    		  null,
    		  anne,
    		  anne[6]);
      
      // exemple moisL=11 anneL=2016 typeVehicule='velo electrique'
      ouvrir();
      try {
    	  String STMT_1 = "SELECT typeVehicule, SUM( "
    			  + "case when extract(month from Retour.DateR)= ? "
    			  + "AND extract(year from Retour.DateR)= ? "
    			  + "AND extract(month from Retour.dateLocation)= ? "
    			  + "Then (dateR -dateLocation)*24+heureR-heureLocation "
    			  + "when extract(month from dateLocation)= ? "
    			  + "AND extract(year from dateLocation)= ? "
    			  + "then (dateR-dateLocation)*24 -extract(day from dateR)*24+24-heureLocation "
    			  + "when extract(month from dateR)= ? "
    			  + "AND extract(year from dateR)= ? "
    			  + "then extract(day from dateR)*24-24+heureR "
    			  + "end) "
    			  + "from Retour,vehicule "
    			  + "Where retour.idVehicule=Vehicule.idVehicule "
    			  + "AND Vehicule.typeVehicule= ? "
    			  + "group by(typeVehicule) ";
    	  
    	  // Creation de la requete
    	  PreparedStatement stmt1 = conn.prepareStatement(STMT_1);
    	  stmt1.setString(1, moisL);
    	  stmt1.setString(2, anneL);
    	  stmt1.setString(3, moisL);
    	  stmt1.setString(4, moisL);
    	  stmt1.setString(5, anneL);
    	  stmt1.setString(6, moisL);
    	  stmt1.setString(7, anneL);
    	  stmt1.setString(8, tVehicule);
    	  
    	  // Execution de la requete
          ResultSet rset1 = stmt1.executeQuery();
          
          JOptionPane jop2 = new JOptionPane();
          
          String entete = "Type de véhicule"+"\t"+"Nombre d'heure"+"\n";
          String barre = "----------------------------------------------------------------------\n";
          
          JTextArea textArea = new JTextArea("       Temps moyen d'utilisation en heure       \n\n"+entete+barre+Fenetre.this.toString(rset1));
          textArea.setEditable(false);
          
          textArea.setSize(200, 200);
          jop2.showMessageDialog(null, textArea, "Information", JOptionPane.INFORMATION_MESSAGE);
          
    	  
      } catch (SQLException e) {
    	  System.err.println("failed");
    	  e.printStackTrace();
      }
      
      fermer();
    }
  } 
  
  //Classe écoutant notre second bouton
  class Bouton4Listener implements ActionListener{
    //Redéfinition de la méthode actionPerformed()
    public void actionPerformed(ActionEvent arg0) {
      label.setText("Catégorie de véhicule la plus utilisée par tranche d'âge de 10 ans");
      
      ouvrir();
      String entete = "Type de véhicule"+"\t"+"Nombre d'heure"+"\n";
      String barre = "----------------------------------------------------------------------\n";
      try {
    	  String STMT_0 = "SELECT Vehicule.Typevehicule, sum( "
    			  + "(Retour.DateR-Retour.DateLocation)*24-Retour.heureLocation+Retour.heureR) as temps "
    			  + "FROM Location,Vehicule,TypeVehicule,Abonnees,Retour "
    			  + "Where Retour.DateLocation=Location.dateLocation "
    			  + "AND Retour.heureLocation=Location.heureLocation "
    			  + "AND Retour.idVehicule=Location.idVehicule "
    			  + "AND Location.idVehicule=Vehicule.idVehicule "
    			  + "AND Vehicule.typeVehicule=TypeVehicule.typeVehicule "
    			  + "And Location.cbAbonne=Abonnees.cbAbonne "
    			  + "AND (CURRENT_DATE-Abonnees.dateNaissance)<3650*(?+1) "
    			  + "AND (CURRENT_DATE-Abonnees.dateNaissance)>=3650*(?) "
    			  + "GROUP BY Vehicule.TypeVehicule "
    			  + "ORDER bY temps DESC "
    			  + "Fetch first 1 rows only ";
    	 
    	  // Creation de la requete
    	  PreparedStatement stmt0 = conn.prepareStatement(STMT_0);
    	  
    	  String res = "";
    	  for (int i = 0; i < 10; i++) {
    		  stmt0.setInt(1, i);
    		  stmt0.setInt(2, i);
    		  
    		  // Execution de la requete
    		  ResultSet rset0 = stmt0.executeQuery();
    		  String tranche = "Tranche d'âge de "+(i*10)+" à "+(i*10 + 10)+"\n";
    		  res = res+tranche+entete+barre;
    		  res += Fenetre.this.toString(rset0)+"\n";
    		  
    	  }
    	  
    	  JOptionPane jop2 = new JOptionPane();
          
          JTextArea textArea = new JTextArea();
          
          textArea.setText("Catégorie de véhicule la plus utilisée par tranche d'âge de 10 ans \n\n"+res);
          
          textArea.setSize(200, 200);
          textArea.setDragEnabled(true);
          
          textArea.setEditable(false);
          
          jop2.showMessageDialog(null, textArea, "Information", JOptionPane.INFORMATION_MESSAGE);
     
      } catch (SQLException e) {
    	  System.err.println("failed");
    	  e.printStackTrace();
      }
      
      fermer();
      
    }
  } 
  
  
  private String calcul(int x, int y, ResultSet rseta, ResultSet rsetb, ResultSet rsetc) throws SQLException {
	float res = 0;
	String text = "";
	
	ArrayList<String> listeB = new ArrayList<String>();
	ArrayList<Integer> listeIB = new ArrayList<Integer>();
	while (rsetb.next()) {
		listeB.add(rsetb.getString(1));
		listeIB.add(rsetb.getInt(2));
	}
	
	
	ArrayList<String> listeC = new ArrayList<String>();
	ArrayList<Integer> listeIC = new ArrayList<Integer>();
	while (rsetc.next()) {
		listeC.add(rsetc.getString(1));
		listeIC.add(rsetc.getInt(2));
	}

	int a = 0, b = 0, c = 0;
    while (rseta.next()) {
    	String stA = rseta.getString(1);
    	String stB;
    	String stC;
    	a = rseta.getInt(2);
    	
    	
    	for (int i = 0; i < listeB.size(); i++) {
    		stB = listeB.get(i);
    		if (stB.equals(stA)) {
    			b = listeIB.get(i);
    			break;
    		}
    		b = 0;
    	}

    	for (int i = 0; i < listeC.size(); i++) {
    		stC = listeC.get(i);
    		if (stC.equals(stA)) {
    			c = listeIC.get(i);
    			break;
    		}
    		c = 0;
    	}
    	
    	
    	if ((c!=0)&&(b!=0)) {
    		res = (float) (((x+y)+b-a)/c);
    		text += stA + "\t"+res+"\n";
    	}
   
    }
	
	return text;
  }
  
  //Classe écoutant notre second bouton
  class Bouton5Listener implements ActionListener{
    //Redéfinition de la méthode actionPerformed()
    public void actionPerformed(ActionEvent arg0) {
      label.setText("Taux d'occupation des stations sur la journée");
      
      JOptionPane jop = new JOptionPane();
      //String nomStation = jop.showInputDialog(null, "Nom de la station (ex : station1)", "Information", JOptionPane.QUESTION_MESSAGE);
      String date = jop.showInputDialog(null, "Date (format 'jj/mm/aaaa' ex '21/11/2016')", "Information", JOptionPane.QUESTION_MESSAGE);
      
      SimpleDateFormat sdfmt1 = new SimpleDateFormat("dd/MM/yy");
      java.util.Date dTmp;
      
      ouvrir();
      try {
    	  
    	  String STMT_c = "Select nomStation, sum( "
    			  + "nombrePlace) "
    			  + "from Dispatching "
    			  + "group by nomStation ";
    	  
    	  String STMT_b = "Select nomStation,count(heureR) "
    			  + "from retour "
    			  + "Where dateR= ? "
    			  + "group by nomStation ";
    	  
    	  String STMT_a = "select nomStation,count(heureLocation) "
    			  + "from location "
    			  + "Where DateLocation= ? "
    			  + "group by nomStation ";
    	  
    	  String STMT_x = "select count(*) "
    			  + "from Vehicule ";
    	  
    	  String STMT_y = "select count(*) "
    			  + "from Station ";
    	  
    	  // Creation de la requete
    	  PreparedStatement stmtx = conn.prepareStatement(STMT_x);
    	  PreparedStatement stmty = conn.prepareStatement(STMT_y);
    	  PreparedStatement stmta = conn.prepareStatement(STMT_a);
    	  PreparedStatement stmtb = conn.prepareStatement(STMT_b);
    	  PreparedStatement stmtc = conn.prepareStatement(STMT_c);
    	  
    	  
    	  try {
        	  dTmp = sdfmt1.parse(date);
        	  
        	  java.sql.Date dateL = new java.sql.Date(dTmp.getYear(),dTmp.getMonth(),dTmp.getDate());
        	  
        	  stmta.setDate(1,dateL);
        	  stmtb.setDate(1,dateL);
        	  
    	  } catch (ParseException e1) {
        	  // TODO Auto-generated catch block
        	  e1.printStackTrace();
          }
    	  
    	  // Execution de la requete
          ResultSet rsetx = stmtx.executeQuery();
          rsetx.next();
          int x = rsetx.getInt(1);
          
          ResultSet rsety = stmty.executeQuery();
          rsety.next();
          int y = rsety.getInt(1);
          
          ResultSet rseta = stmta.executeQuery();
          ResultSet rsetb = stmtb.executeQuery();
          ResultSet rsetc = stmtc.executeQuery();
          
          JOptionPane jop2 = new JOptionPane();
          
          
          JTextArea textArea = new JTextArea();
          
          String entete = "Station"+"\t"+"Taux d'occupation"+"\n";
          String barre = "-------------------------------------------------------------------------\n";
          String res = calcul(x,y,rseta,rsetb,rsetc);
          textArea.setText("Taux d'occupation des stations sur la journée \n\n"+entete+barre+res);
          
          textArea.setSize(200, 200);
          textArea.setDragEnabled(true);
          
          textArea.setEditable(false);
          
          
          jop2.showMessageDialog(null, textArea, "Information", JOptionPane.INFORMATION_MESSAGE);
        
          
      } catch (SQLException e) {
    	  System.err.println("failed");
    	  e.printStackTrace();
      }
      
      fermer();
      
    }
  } 
  
  
  
}