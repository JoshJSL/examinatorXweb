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
public class tipo_persona {
    
    private int _id;
    private String _tipo;
    
    public tipo_persona(String _id, String _tipo){
        
        this._tipo=_tipo;
        this._id=Integer.parseInt(_id);
        
    }
    
    public int getId(){
        
        return this._id;
    }
    
    public String getTipo(){
        
        return this._tipo;
    }
    
    public void guardarBD(){
        /*
        
        aqui va el codigo chidorris que hace la magia
        
        */
    }
    
}
