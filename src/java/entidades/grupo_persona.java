/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author joshua
 */
public class grupo_persona{

    private String nombGrupo;
    
    public ArrayList<String[]> gruposProf(String _id, String _tipo, String _siEs) throws SQLException{
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("call spGrupoPers("+_id+", '"+_tipo+"',"+_siEs+")");
        ArrayList <String[]> grups= new ArrayList<>();
        
        while(msj.next()){
            String[] str= {msj.getString("idGru")+"", msj.getString("nomGru")+"",msj.getString("codigo")};
            grups.add(str);
        }
        
        
        
        return grups;
    }
    
    public String[][] alumnosProfe(String _nombreG) throws SQLException{
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("call spAlumnosGrupo('"+_nombreG+"')");
        ArrayList <String[]> grups= new ArrayList<>();
        while(msj.next()){
            if(!msj.getString("alumno").equals(" ")&&!msj.getString("boleta").equals(" ")){
            String[] str= {msj.getString("alumno")+"", msj.getString("boleta")+"", msj.getString("idAlum")+""};
            grups.add(str);
            }else{
                String[][] mal = {{msj.getString("mensaje")+"", ""}};
                return mal;
            }
                
        }
        String[][] grup= new String[grups.size()][2];
        for (int i = 0; i < grups.size(); i++) {
            grup[i]=grups.get(i);
        }
        
        return grup;
    }
    
    public String agregaPG(String id, String nomG) throws SQLException{
        
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("call spGrupoPer("+id+", '"+nomG+"')");
        msj.next();
        return msj.getString(1);
        
    }
    
    public ArrayList<String[]> grpPS(ArrayList<String[]> grupos,ArrayList<String[]> grupos2){
    
        
        int k=0;
        int t=grupos2.size();
        boolean si;
        
       
        
        for (int i = 0; i < grupos.size(); i++) {
            while(k<t){
            si=false;
            if(i==0){
                if((grupos2.get(k)[0]).equals(grupos.get(i)[0])||(grupos2.get(k)[0]).equals(grupos.get(i+1)[0])){
                        
                        grupos2.remove(k);
                        t=grupos2.size();
                        si=true;
                }
            
            if(!si)
                k++;
        }else{
                if((grupos2.get(k)[0]).equals(grupos.get(i)[0])||(grupos2.get(k)[0]).equals(grupos.get(i-1)[0])||(grupos2.get(k)[0]).equals(grupos.get(i+1)[0])){
                        
                        grupos2.remove(k);
                        t=grupos2.size();
                        si=true;
                }
            
            if(!si)
                k++;
            }
            }
    }
        return grupos2;
        
}
    
    public boolean alumTiene(String _id) throws SQLException{
        
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("call spVeGrupoAlumn("+_id+")");
        
        msj.next();
        String str= msj.getString("mensaje");
        nombGrupo=str;
        if (!str.equals("no g")&&!str.equals("no ex"))
            return true;
        
        
        return false;
    }
    
    public String nombreG(){
        return nombGrupo;
    }
}

