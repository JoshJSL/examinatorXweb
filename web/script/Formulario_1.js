
function validarNum(){
		if ((event.keyCode < 45)|| (event.keyCode >57)) {
			event.returnValue = false;
		}
	}
	function validarLet(){
		if((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 98) && 
			(event.keyCode < 97) || (event.keyCode > 122)){
			event.returnValue = false;
		}
	}
	function validarMail() {
		if ((event.keyCode < 45)|| (event.keyCode >122)) {
			event.returnValue = false;
		}

	}
	function validarBol(){
		 var valor=document.getElementById("Boleta").value;
		 var valorP = 0;
		 var regresar=true;
		if (((event.keyCode < 48) || (event.keyCode >57)) && (event.keyCode != 80) && (event.keyCode != 77)){
				regresar = false;
		}
		if(event.keyCode == 80 && valor.indexOf("P")!=-1)
			regresar=false;

		if(event.keyCode == 77 && valor.indexOf("M")!=-1)
			regresar=false;

		event.returnValue=regresar;
	}
	function contra(){
		var p1 = document.getElementById('contra').value;
		var p2 = document.getElementById('confiContra').value;
		if (p1 != p2) {
		  alert("Las passwords deben de coincidir");
		  return false;
		} else {
		  alert("Todo esta correcto");
		  return true; 
    }          
}

    



function editaDatos(){    
    var datos = document.getElementById('datos'),
        formi= document.getElementById('formu')
            ;
        datos.style.display="none";
        formi.style.display="flex";
            
    
}