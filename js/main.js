if ($("#nav-tail").length > 0) {
	$("#nav .navbar-header").prepend('<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#nav-tail"><span class="sr-only">Toggle navigation.</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>')
	$("#nav-tail").addClass("collapse navbar-collapse")
}
moment.lang("en-downcase", {
	calendar : {
		lastDay : '[yesterday at] LT',
		sameDay : '[today at] LT',
		nextDay : '[tomorrow at] LT',
		lastWeek : '[last] dddd [at] LT',
		nextWeek : 'dddd [at] LT',
		sameElse : 'L'
	}})
$("time.posted-at").each(function(i) {
	$(this).text(moment($(this).attr("datetime")).calendar())
})
