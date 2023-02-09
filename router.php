
<?php  
 include 'Oop';
  $ins = new Oop();	


 switch($_GET['action']){

  case "produk":
	$ins->Produk();
  break;
	
   case "sales":
	ins->Sales();
  break;

   case "register":
	
  break;

   default :
	
  break;	

}






?>
