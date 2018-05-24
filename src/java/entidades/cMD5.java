/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author joshua
 */
public class cMD5 {
    
    public String md5(String text){
      //  
       String textoSinEncriptar=text; 
        String textoEncriptadoConMD5=DigestUtils.md5Hex(textoSinEncriptar); 
       return textoEncriptadoConMD5;

    }
    
    
}
