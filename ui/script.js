var password = undefined;

window.addEventListener('message', function(event){
    if (event.data.type == "open") {
        $('body').css('display', 'block');
        if (event.data.data != undefined) {
            password = event.data.data;
        }
    }
});


$(".button-key").click(function() {
    let pad = $(this).find(".special").text();
    numpad(pad);
});

$(document).ready(function() {
    $("#callButton").click(function() {
        numpad('enter');
    });
});

function numpad(pad) {
    let input = $('#phoneText');
    let currentValue = input.val();

    if (pad == 'clear') {
        input.val('');
    } else if (pad == 'enter' && currentValue.length == 4) {
        $.post('https://ate-nokia/get-callback', JSON.stringify({
            inputPass: currentValue
        }), function(response) {
            if(response.status) {
                input.val('');
                $('body').css('display', 'none');
                $.post('https://ate-nokia/close');
                $.post('https://ate-nokia/primary');
            } else {
                input.val(''); 
                $('body').css('display', 'none');
                $.post('https://ate-nokia/close');
                $.post('https://ate-nokia/donts');
            }
        });
    } else if (pad != 'enter' && currentValue.length < 4) {
        input.val(currentValue + pad);
    }
}


$(document).on('keyup', function(evt) {
    if (evt.keyCode == 27) {
        $('body').css('display', 'none');
        $.post('https://ate-nokia/close');
        $.post('https://ate-nokia/get-callback', JSON.stringify({
            status: false,
        }));
        $('#phoneText').val('');
    }
});
