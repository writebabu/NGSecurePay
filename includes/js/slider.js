// JavaScript Document

var strImages = "DSC00093.jpg;DSC00873.jpg;DSC00953.jpg;new-folder-054.jpg;DSC03051.jpg;DSC03756.jpg;DSC04720.jpg;DSCN1643.jpg;";

  var strImageVirDir = "http://vdsindia.verizon.com/Images/Homepage_Disp_Image/";
    var strImageArray = strImages.split(";");
    var imgArray = new Array();
    
    var img;
    for( var i=0; i <strImageArray.length; i++)
    {
        img = new Image();
       img.src =  strImageVirDir+strImageArray[i];
       
       imgArray.push(img);
    }

function fnChangeImage()
{
      
         var ctlImage = document.getElementById("imgSlideShow");
         var intIndex = Math.random()*(imgArray.length-1);
         intIndex = parseInt(intIndex);
        if(ctlImage)
         ctlImage.src = imgArray[intIndex].src;
}
function  fnStartSliding()
{
//alert("hi");
window.setInterval("fnChangeImage()",2000)
}
 window.setTimeout("fnStartSliding()",500);
   