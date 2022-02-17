<?php 

// Include mpdf library file
require_once __DIR__ . '/vendor/autoload.php';
//$mpdf = new \Mpdf\Mpdf();
//landscape orientacia
//https://mpdf.github.io/paging/page-size-orientation.html
$mpdf = new \Mpdf\Mpdf(['orientation' => 'L']);

// Database Connection 
$conn = new mysqli('127.0.0.1', 'root', '', 'cms');
//Check for connection error
if($conn->connect_error){
  die("Error in DB connection: ".$conn->connect_errno." : ".$conn->connect_error);    
}
// Select data from MySQL database
$select = "SELECT nazov_firmy, ico, dic FROM `firmy`";
$result = $conn->query($select);
$data = array();
while($row = $result->fetch_object()){
	$data .= '<tr>'
		  .'<td>'.$row->nazov_firmy.'</td>'
		  .'<td>'.$row->ico.'</td>'
		  .'<td>'.$row->dic.'</td></tr>';
}

// Take PDF contents in a variable
$pdfcontent = '<h1>Welcome to etutorialspoint.com</h1>
		<h2>Employee Details</h2>
		<table autosize="1">
		<tr>
		<td style="width: 33%"><strong>Nazov firmy</strong></td>
		<td style="width: 36%"><strong>ICO</strong></td>
		<td style="width: 30%"><strong>DIC</strong></td>
		</tr>
		'.$data.'
		</table>';

$mpdf->WriteHTML($pdfcontent);

$mpdf->SetDisplayMode('fullpage');
$mpdf->list_indent_first_level = 0; 

//call watermark content and image
$mpdf->SetWatermarkText('etutorialspoint');
$mpdf->showWatermarkText = true;
$mpdf->watermarkTextAlpha = 0.1;

//output in browser
$mpdf->Output();		
?>