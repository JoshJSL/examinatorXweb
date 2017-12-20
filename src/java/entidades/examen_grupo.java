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
public class examen_grupo {
    
    private int id_grupo;
    private int id_examen;
    
    public examen_grupo(int id_grupo, int id_examen){
        
        this.id_examen=id_examen;
        this.id_grupo=id_grupo;
    }public examen_grupo(){
        
        
    }
    
    public int getIdGrupo(){
        
        return this.id_grupo;
    }
    
    public int getIdExamen(){
        
        return this.id_examen;
    }
    
    
    public ArrayList<String[]> exmGru(String _id, String _nom) throws SQLException{
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("call spVeExaGrup('"+_nom+"', "+_id+")");
        ArrayList <String[]> grups= new ArrayList<>();
        while(msj.next()){
            
            
            if(msj.getString("mensaje").equals(" ")){
                String[] str= {msj.getString("materia")+"", msj.getString("fechaApli")+"",msj.getString("periodo")+"",msj.getString("idExam")+""};
                grups.add(str);
            }else{
                return grups;
            }
                
        }
        return grups;
    }
    public ArrayList<ArrayList<String[]>> exmGrupos(String _id, ArrayList<String[]> grupos) throws SQLException{
            ArrayList<ArrayList<String[]>> sarr = new ArrayList<>();
            for (int i = 0; i < grupos.size(); i++) {
                ArrayList<String[]> grp= exmGru(_id, grupos.get(i)[1]);
                ArrayList<String[]> grp2= new ArrayList<>();
                for (int j = 0; j < grp.size(); j++) {
                    String[] ex= new String[5];
                    ex[0]=grupos.get(i)[1];
                    ex[1]=grp.get(j)[0];
                    ex[2]=grp.get(j)[1];
                    ex[3]=grp.get(j)[2];
                    ex[4]=grp.get(j)[3];
                    grp2.add(ex);
                }
                
                
                sarr.add(grp2);
        }
        
            
            return sarr;
        }
    
    public String sube(String mat, String fech, String grup, String id) throws SQLException{
        
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("call spSubeEx('"+mat+"', '"+grup+"', '"+fech+"'," +id+")");
        msj.next();
        
        if(msj.getString(1).equals("si"))
            return "Ahora las calificaciones estan disponibles para sus alumnos";
        
        return "Ocurrio algùn error";
    }
            
    
    
    
    public void guardarBD(){
        /*
        
        aqui va el codigo chidorris que hace la magia
        
        */
    }
}
