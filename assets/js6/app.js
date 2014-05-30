jQuery(function($) {
    $('h1').click((e) => {
        e.preventDefault();
        $('h1').after('<p>Hello from JavaScript</p>');
    })
});
