$(document).ready(function(){
    
    $(".sup_bodycam").hide();
    $(".odz").hide();
    window.addEventListener("message", function(event){
        if(event.data.open == true)
        {
            $(".odz").fadeIn();
            $(".sup_bodycam").fadeIn();
            //document.getElementById("data").innerHTML = event.data.date;
			var monthShortNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN",
  "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
];


function dateFormat(d) {
  var t = new Date(d);
  if(t.getDate() >= 0 && t.getDate() <= 9){
    day = "0" + t.getDate();
  }
  else{
    day = t.getDate()
  }
  if(t.getHours() >= 0 && t.getHours() <= 9){
    hour = "0" + t.getHours();
  }
  else{
    hour = t.getHours()
  }
  if(t.getMinutes() >= 0 && t.getMinutes() <= 9){
    minute = "0" + t.getMinutes();
  }
  else{
    minute = t.getMinutes()
  }
  if(t.getSeconds() >= 0 && t.getSeconds() <= 9){
    second = "0" + t.getSeconds();
  }
  else{
    second = t.getSeconds()
  }
  return day + ' ' + monthShortNames[t.getMonth()] + ' ' + t.getFullYear() + ' ' + hour + ':' + minute + ':' + second + ' CET';
}


var check = function(){
    $(".dash_time").html(dateFormat(new Date()));
    setTimeout(check, 1000); 
}
check();
            //document.getElementById("stopien").innerHTML = event.data.ranga + event.data.daneosoby;
			var x = document.getElementById("beep");
			x.play();
			x.volume = 0.1;
			function enableLoop() { 
			  x.loop = true;
			  x.load();
			} 
        }
        else if(event.data.open == false) 
        {
            $(".odz").fadeOut();
            $(".sup_bodycam").fadeOut();
			//var x = document.getElementById("beep");
			//function disableLoop() { 
			//x.loop = false;
			//x.load();
			//}
        }
    })
});
