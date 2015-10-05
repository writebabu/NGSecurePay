// JavaScript Document
var strImages = "RE1.jpg;RE2.jpg;RE3.jpg;RE4.jpg;";


    var strImageVirDir = "Images/content/";
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
      
         var ctlImage = document.getElementById("FacilitiesimgSlideShow");
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
   