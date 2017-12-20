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
public class persona_tipo {
    
    private int id_persona;
    private int id_tipo;
    
    public persona_tipo(String id_persona, String id_tipo){
        this.id_tipo=Integer.parseInt(id_tipo);
        this.id_persona=Integer.parseInt(id_persona);
    
    }
    
    public int  getIdPersona(){
        
        return this.id_persona;
    }
    
    public int getIdTipo(){
        
        return this.id_tipo;
    }
    
    public void guardarBD(){
        /*
        
        aqui va el codigo chidorris que hace la magia
        
        */
    }
    
}
