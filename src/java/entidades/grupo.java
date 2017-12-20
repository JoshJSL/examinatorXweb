/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

/**
 *
 * @author joshua
 */
public class grupo {
    
    private String _id;
    private String _nombre;
    private String _semestre;
    private String _turno;
    
    public grupo(){
        
    }
    
    public grupo(String _id, String _nombre, String _semestre, String _turno){
        
        this._id=(_id);
        this._nombre=_nombre;
        this._semestre=(_semestre);
        this._turno=_turno;
        
       
    }
    
    public String codigoGrupo(){
        
        String codigo="";
        String grupo=this._nombre;
        Random r= new Random();
        
        for (int i = 0; i < grupo.length(); i++) {
            
            codigo+=(((grupo.codePointAt(i))+6)*r.nextInt(10)+1);
        }
        
        
        return codigo;
    }
    
    public String getId(){
        
        return this._id;
    }
    
    public String getNombre(){
        
        return this._nombre;
    }
    
    public String getSemestre(){
        
        return this._semestre;
    }
    
    public String getTurno(){
        
        return this._turno;
    }
    
    
    public ArrayList<String[]> todos() throws SQLException{
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("select * from vwGrupos");
        ArrayList<String[]> ss= new ArrayList<>();
        while(msj.next()){
            String[] s={ msj.getString("id") , msj.getNString("Grupo") , msj.getInt("Sem")+"", msj.getString("Truno")+"" };
            ss.add(s);
    }   
        return ss;
    }
    
    public String[][] guardarGrupo() throws SQLException{
        cDatos conec=new cDatos();
        conec.conectar();
        ResultSet msj =conec.ejecuta("call spGuardaGrupo("+this._id+", '"+this._nombre+"',"+this._semestre+",'"+this._turno+"', '"+codigoGrupo()+"')");
        ArrayList<String[]> ss= new ArrayList<>();
        while(msj.next()){
            String[] s={ msj.getNString("mensaje") , msj.getInt("id")+"" };
            ss.add(s);
    }   
        String [][]rtrn= new String[ss.size()][2];
        for (int i = 0; i < ss.size(); i++) {
            rtrn[i]=ss.get(i);
        }
        
        return rtrn;
    }
}
