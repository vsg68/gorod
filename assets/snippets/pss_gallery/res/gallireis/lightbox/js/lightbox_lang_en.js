//loading image
var fileLoadingImage = "assets/snippets/maxigallery/lightbox/images/loading.gif";		
//close image
var fileBottomNavCloseImage = "assets/snippets/maxigallery/lightbox/images/close.gif";
//next image
var nextLinkImage = "assets/snippets/maxigallery/lightbox/images/next.gif";
//previous image
var previousLinkImage = "assets/snippets/maxigallery/lightbox/images/prev.gif";
//controls the speed of the image resizing (1=slowest and 10=fastest)
var resizeSpeed = 7;
//if you adjust the padding in the CSS, you will need to update this variable
var borderSize = 10;
//the "Image" part from the text "Image 1 of 6"
var imageNrDesc = "";
//the separator "of" from the text "Image 1 of 6", you can change to / slash or whatever
var imageNrSep = "/";
//accelerator keys that goes to next picture, separate by commas
var nextKeys = new Array("n"," ");
//accelerator keys that goes to previous picture, separate by commas
var prevKeys = new Array("b");
//accelerator keys that close the lightbox, separate by commas
var closeKeys = new Array("c","x","q");
