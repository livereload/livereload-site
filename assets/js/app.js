jQuery(function($) {
    $('h1').click(function(e)  {
        e.preventDefault();
        $('h1').after('<p>Hello from JavaScript</p>');
    })
});
