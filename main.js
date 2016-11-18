// JavaScript do banner rotativo
img = new Array('1','2','3','4', '5');
 
indice = 0;
 
setInterval("mudaImg()", 3000);
	
function mudaImg(i) {
 
	if (i == 0 || i == 1 || i == 2 || i == 3 || i== 4) {
		
		indice = i;
		
	} else {
		
		if (indice == img.length - 1) {
			
			indice = 0;
			
		} else {
			
			indice++;
			
		}
		
	}
	
	document.getElementById("banner_img_1").setAttribute("class", "");
	document.getElementById("banner_img_2").setAttribute("class", "");
	document.getElementById("banner_img_3").setAttribute("class", "");
	document.getElementById("banner_img_4").setAttribute("class", "");
	document.getElementById("banner_img_5").setAttribute("class", "");
	document.getElementById("banner_img_" + img[indice]).setAttribute("class", "hover");
	
	document.getElementById("banner_img").innerHTML = "<img src='img/"+ img[indice] +".jpg' width='100%' height='100%' border='0' alt='Banner'>";
 
}
//