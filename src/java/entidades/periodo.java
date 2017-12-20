/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

/**
 *
 * @author joshua
 */
public class periodo {
    
    private int _id;
    private String _periodo;
    
    
    public periodo(String _id, String _periodo){
        
        this._id=Integer.parseInt(_id);
        this._periodo=_periodo;
    }
    
    public String getPeriodo(){
        
        return this._periodo;
    }
    
    public int getId(){
        
        return this._id;
    }
    
    public void guardarBD(){
        /*
        
        aqui va el codigo chidorris que hace la magia
        
        */
    }
    
}
