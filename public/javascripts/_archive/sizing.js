var spH;
var setMT;

function moveNext() {
	spH = $('#speakerWrap').height();
	setMT = (spH + 65);
	$('#registerWrap').css('margin-top', setMT);
}

$(window).load(moveNext);