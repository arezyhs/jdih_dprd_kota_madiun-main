import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// inject css/js webview
Future<void> injectHideFooterAndTableJS(InAppWebViewController controller,
    {bool enableTableScroll = false}) async {
  String js = '''
		var footers = document.getElementsByTagName('footer');
		for(var i=0;i<footers.length;i++){footers[i].style.display='none';}
		var footerById = document.getElementById('footer');
		if(footerById){footerById.style.display='none';}
		var footerByClass = document.getElementsByClassName('footer');
		for(var i=0;i<footerByClass.length;i++){footerByClass[i].style.display='none';}
		// Hide tombol kontak di header web
		var kontakBtn = document.querySelectorAll('a[href*="/kontak"], .menu-kontak, .header-kontak');
		for(var i=0;i<kontakBtn.length;i++){kontakBtn[i].style.display='none';}
	''';
  if (enableTableScroll) {
    js += '''
			var tables = document.getElementsByTagName('table');
			for(var i=0;i<tables.length;i++){
				tables[i].style.width='100%';
				tables[i].style.display='block';
				tables[i].style.overflowX='auto';
				tables[i].style.whiteSpace='nowrap';
			}
		''';
  }
  await controller.evaluateJavascript(source: js);
}

/// Inject JS untuk menghilangkan burger/hamburger menu icon di header web JDIH
Future<void> injectHideBurgerMenuJS(InAppWebViewController controller) async {
  String js = '''
		// Hilangkan elemen dengan class/menu hamburger
		var burger1 = document.querySelectorAll('.navbar-toggler, .menu-toggle, .fa-bars, .header-toggle, .navbar-toggle, .menu-mobile, .mobile-menu, .menu-icon, .burger, .hamburger, .mobile-nav-toggle, .d-lg-none');
		for(var i=0;i<burger1.length;i++){burger1[i].style.display='none';}
		// Hilangkan elemen dengan id yang umum untuk burger
		var burger2 = document.getElementById('menu-toggle');
		if(burger2){burger2.style.display='none';}
		// Hilangkan elemen <button> yang mengandung aria-label menu/hamburger
		var btns = document.querySelectorAll('button[aria-label*="menu" i], button[aria-label*="hamburger" i]');
		for(var i=0;i<btns.length;i++){btns[i].style.display='none';}
		// Hilangkan elemen <i> dengan class fa-bars atau icofont-navigation-menu
		var icons = document.querySelectorAll('i.fa-bars, i.icofont-navigation-menu');
		for(var i=0;i<icons.length;i++){icons[i].style.display='none';}
		// Hilangkan button dengan class mobile-nav-toggle
		var btnMobileNav = document.querySelectorAll('button.mobile-nav-toggle');
		for(var i=0;i<btnMobileNav.length;i++){btnMobileNav[i].style.display='none';}
	''';
  await controller.evaluateJavascript(source: js);
}
