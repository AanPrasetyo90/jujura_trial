

<html>
<head>
</head>

<body>

	<div class="resultTransaksi">
	<table>
<thead>
        <tr> 
	
	<th> NO </th>
<th> ID TRANSAKSI </th>
<th> SALES</th>
<th> ALAMAT </th>
<th> TANGGAL </th>
<th> ACTION </th>
        
	</tr>
</thead>
	

<tbody>
	<?php foreach($transaksi as $item -> $value) { 
   ?>
	<tr>
	<td> <?php echo $item+1 ?> </td>
<?php echo $tranaskasi[$item]['id_transaksi']; ?>
<td> <?php echo $tranaskasi[$item]['sales']; ?> </td>
<td> <?php echo $tranaskasi[$item]['alamat']; ?> </td>
<td> <a href="router.php?action='detail_transaksi'"> detail <button>  </td>
</tr>

</tbody>
		
	
	
	</table>
	</div>


</body>


</html>



