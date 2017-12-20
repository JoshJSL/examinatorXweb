
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
public class materias {
    
    private int _id;
    private String _materia;
    
    public materias(String _id, String _materia){
        
        this._id=Integer.parseInt(_id);
        this._materia=_materia;
        
    }
    
    public int getId(){
        return this._id;
    }
    
    public String getMateria(){
        return this._materia;
    }
    
    public void guardarBD(){
        /*
        
        aqui va el codigo chidorris que hace la magia
        
        */
    }
    
}
