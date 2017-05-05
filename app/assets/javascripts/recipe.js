$(document).ready(function(){
    $("#add-ingredient").click(function(e){
        $("#ingredients").append('<div><input type="text" name="ayed"><a href="#" class="remove_field">Remove</a></div>');
        $("#ingredients").on("click",".remove_field", function(e){ 
       e.preventDefault(); 
        $(this).parent('div').remove();
    })

});
    // $("#ac").on("click",function(event){
      // $("#li1").addClass('someNode,active');
      $('#li1').addClass('active');
      // alert("pressed");
    // });


 // $("#h-v").hover(function(){
 //        $(this).css({
 //          'width' : '400px',
 //          'height' : '600px'
          
 //        });
 //        }, function(){
 //        $(this).css({
 //          ' max-width' : '100%',
 //          'height' : 'auto'
 //        });

        
 //    });

})
