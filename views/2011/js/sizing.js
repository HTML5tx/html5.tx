var spH;
var setMT;

function moveNext() {
	spH = $('#speakerWrap').height();
	setMT = (spH + 65);
	$('#footer').css('margin-top', setMT);
}

$(window).load(moveNext);