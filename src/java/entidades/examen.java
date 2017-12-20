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
public class examen {
    
    private int _id;
    private int id_tipo;
    private int id_periodo;
    private int no_preg;
    private int id_materia;
    private String _fecha;
    private int id_prof;
    
    public examen(String _id, String id_tipo, String id_periodo, String no_preg, String id_materia, String fecha, String id_prof){
        
        this._id=Integer.parseInt(_id);
        this.id_tipo=Integer.parseInt(id_tipo);
        this.id_periodo=Integer.parseInt(id_periodo);
        this.no_preg=Integer.parseInt(no_preg);
        this.id_materia=Integer.parseInt(id_materia);
        this.id_prof=Integer.parseInt(id_prof);
        this._fecha=_fecha;
    }

    public int getId() {
        return this._id;
    }

    public int getIdTipo() {
        return this.id_tipo;
    }

    public int getIdPeriodo() {
        return this.id_periodo;
    }

    public int getNoPreg() {
        return this.no_preg;
    }

    public int getIdMateria() {
        return this.id_materia;
    }

    public String getFecha() {
        return this._fecha;
    }

    public int getIdProf() {
        return this.id_prof;
    }
    
    public void guardarBD(){
        /*
        
        aqui va el codigo chidorris que hace la magia
        
        */
    }
    
}
