class Oop{
	
	$host = 'localhost';
	$user = 'root';
	$password = "";
	$db  = "table_jujura";


	public function conn(){
		
	 $connection = mysqli_connect($this->user,$this->user,$this->db,$this->password);
	 if(!$connection){
		
	 echo "tidak connection database";
	}
	
	return $connection;

	}



	function Login($data = []){
		$dataLogin = [];
		$login  = mysqli_query(conn(), "SELECT * FROM table_user where username = $data['username'] and password = $data['password']");
		 if($login->num_row() > 0) {
		
		$row = mysqli_fetch_assoc($login){
		
			$_SESSION['username'] = $row['username'];
			$_SESSION['id']	 = $row['id_user'];
		
			header('location : Dashboard.php');
			}else {

			}
		
		}	
		 


	
	}



	function Produk(){
	
		$produk  = mysqli_query(conn(), "SELECT * FROM table_produk");
		$row = mysqli_fetch_array($produk);
		
		return $row;
			
		 
	}



	function Sales(){
		
		$sales  = mysqli_query(conn(), "SELECT * FROM table_user");
		$row = mysqli_fetch_array($sales);
		
		return $row;
		 


	
	}

	function Register(){
		$dataLogin = [];
		$login  = mysqli_query(conn(), "SELECT * FROM table_user where username = $data['username'] and password = $data['password']");
		 if($login->num_row() > 0) {
		
		$row = mysqli_fetch_assoc($login){
		
			$_SESSION['username'] = $row['username'];
			$_SESSION['id']	 = $row['id_user'];
		
			header('location : Dashboard.php');
			}else {

			}
		
		}	
		 


	
	}

	

	function RegisterEdit($data = []) {
		
		$update = mysqli_query(conn(),"UPDATE FROM table_konsumen set );
		if ($update) {
			
  			echo "<script> alert('data berhasil disimpan') </script>";
		}else {
			echo "<script> alert('data gagal disimpan') </script>";
		}		
	}

	
}